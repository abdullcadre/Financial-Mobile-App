B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Service
Version=9.85
@EndOfDesignText@
#Region  Service Attributes 
	#StartAtBoot: False
	#ExcludeFromLibrary: True
#End Region

Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.
	Dim sql As SQL
End Sub

Sub Service_Create
	'This is the program entry point.
	'This is a good place to load resources that are not specific to a single activity.	
	sql.Initialize(File.DirInternal, "mydatabase84new.db", True)
	CreateCardTable
	CreateUserTable
	CreateTransactionTable
End Sub

Sub Service_Start (StartingIntent As Intent)
	Service.StopAutomaticForeground 'Starter service can start in the foreground state in some edge cases.
End Sub

Sub Service_TaskRemoved
	'This event will be raised when the user removes the app from the recent apps list.
End Sub

'Return true to allow the OS default exceptions handler to handle the uncaught exception.
Sub Application_Error (Error As Exception, StackTrace As String) As Boolean
	Return True
End Sub

Sub Service_Destroy

End Sub


Sub  getMoeda As String	
	If File.Exists(File.DirInternal,"coin")=False Then
		File.WriteString(File.DirInternal,"coin", "€ ")			
	End If
	
	Return 	File.ReadString(File.DirInternal,"coin")
	
End Sub


Sub GetIdUser As Int
	Try
		Dim email As String=File.ReadString(File.DirInternal, "actualuser")
	Dim Cursor As Cursor
	Cursor = sql.ExecQuery("SELECT * FROM user WHERE email = '"&email&"' limit 1")
		Cursor.Position = 0
'		Log(Cursor.GetInt("id"))
		Return Cursor.GetInt("id")	
	Catch
		Return 0
		Log(LastException)
	End Try

End Sub

#region CRUDMoviment
Sub CreateTransactionTable
	sql.ExecNonQuery("CREATE TABLE IF NOT EXISTS transacaoo (" _
                    & "id INTEGER PRIMARY KEY AUTOINCREMENT," _
                    & "amount REAL," _ ' REAL é usado para números decimais
                    & "data TEXT," _
					 & "dia INTEGER," _
					  & "mes INTEGER," _
					   & "ano INTEGER," _
					& "nota TEXT," _
                    & "tipo TEXT," _
					 & "user INTEGER," _
                    & "card INTEGER)") ' card é uma chave estrangeira que referencia a tabela de cartões
End Sub



Sub InsertTransaction(amount As Double, data As String, nota As String, tipo As String, card As Int) As Boolean
	Try
		
		Log(data)
		
		
		Dim v()As Object=geral.splitDate(data).As(Object)
		
		Log("Dia"& v(0))
		Log("Mes"& v(1))
		Log("Ano"& v(2))
		
		
	' Abre o banco de dados
	' Cria a instrução SQL de inserção de um movimento de entrada
	Dim query As String
		query = "INSERT INTO transacaoo (amount, data, dia, mes, ano, nota, tipo, user, card) VALUES (?, ?,?, ?,?,?,?,?,?)"

	' Prepara a instrução SQL
		sql.ExecNonQuery2(query, Array As Object(amount, data,v(0),v(1),v(2),nota,tipo,GetIdUser, card))
	Return True
	Catch
		Log(LastException)
		Return False
	End Try
End Sub

Sub UpdateTransaction(id As Int, amount As Double, data As String, nota As String, tipo As String, card As Int) As Boolean
	Try

		Dim query As String
		query = "UPDATE transacaoo SET amount = ?, data = ?, nota = ?, tipo = ?, card = ? WHERE id = ?"
		' Prepara a instrução SQL
		sql.ExecNonQuery2(query, Array As Object(amount, data, nota, tipo, card, id))

		Return True
	Catch
		Log(LastException)
		Return False
	End Try
End Sub



Sub DeletetransacaoByIDcard(idcard As Int)  As ResumableSub
	' Abre o banco de dados
'	Dim sql As SQL
'	sql.Initialize(File.DirInternal, "mydatabase.db", True)
	'
'	' Cria a instrução SQL de exclusão de dados
	Dim query As String
	query = "DELETE FROM transacaoo WHERE card = ?"
Log(query)
	' Prepara a instrução SQL
	sql.ExecNonQuery2(query, Array As Object(idcard))

	' Fecha a conexão com o banco de dados
'	sql.Close
	Return True
End Sub


Sub DeletetransacaooData(id As Int)  As ResumableSub
	' Abre o banco de dados
'	Dim sql As SQL
'	sql.Initialize(File.DirInternal, "mydatabase.db", True)
	'
'	' Cria a instrução SQL de exclusão de dados
	Dim query As String
	query = "DELETE FROM transacaoo WHERE id = ?"

	' Prepara a instrução SQL
	sql.ExecNonQuery2(query, Array As Object(id))

	' Fecha a conexão com o banco de dados
'	sql.Close
	Return True
End Sub

#end region

#region CRUD USER
Sub CreateUserTable
	sql.ExecNonQuery("CREATE TABLE IF NOT EXISTS user (" _
                    & "id INTEGER PRIMARY KEY AUTOINCREMENT," _
                    & "nome TEXT," _
                    & "email TEXT UNIQUE," _
                    & "senha TEXT," _
                    & "imagem BLOB)")
End Sub



Sub InsertUserData(nome As String, email As String, senha As String, imagem() As Byte) As Boolean
	Try
	Dim query As String
	query = "INSERT INTO user (nome, email, senha, imagem) VALUES (?, ?, ?, ?)"
	sql.ExecNonQuery2(query, Array As Object(nome, email, senha, imagem))	
	Return True
	Catch
		Log(LastException)
		Return False
	End Try

End Sub


Sub UpdateUserProfile(id As Int, nome As String, email As String, senha As String, imagem() As Byte) As Boolean
	Try
		' Abre uma conexão com o banco de dados
'	Dim sql As SQL
'	sql.Initialize(File.DirInternal, "mydatabase.db", True)

	' Cria a instrução SQL de atualização do perfil do usuário
	Dim query As String
	query = "UPDATE user SET nome = ?, email = ?, senha = ?, imagem = ? WHERE id = ?"
	' Prepara a instrução SQL
	sql.ExecNonQuery2(query, Array As Object(nome, email, senha, imagem, id))
	' Fecha a conexão com o banco de dados
'	sql.Close
	File.WriteString(File.DirInternal, "actualuser", email)
	Log("saved")
	' Retorna verdadeiro para indicar que o perfil do usuário foi atualizado com sucesso
	Return True	
	Catch
		Log(LastException)
		Return False
	End Try

End Sub



#end region
#region CRUD CARD
Sub CreateCardTable
	sql.ExecNonQuery("CREATE TABLE IF NOT EXISTS card (" _
                    & "id INTEGER PRIMARY KEY AUTOINCREMENT," _
                    & "img TEXT," _
                    & "number TEXT," _
                    & "bankname TEXT," _
                    & "holder TEXT," _
                    & "expireddate TEXT," _
                    & "iduser TEXT," _
                    & "type TEXT)")

	' Fecha a conexão com o banco de dados
'	sql.Close
'	sql.Close
End Sub


Sub InsertCardData(img As String, number As String, bankname As String, holder As String, expireddate As String, TypeCard As String,iduser As String) As ResumableSub
	
	Log(iduser)
	' Cria a instrução SQL de inserção de dados
	Dim query As String
	query = "INSERT INTO card (img, number, bankname, holder, expireddate, type, iduser) VALUES (?, ?, ?, ?, ?, ?,?)"
	' Prepara a instrução SQL
	sql.ExecNonQuery2(query, Array As Object(img, number, bankname, holder, expireddate, TypeCard,iduser))

	' Fecha a conexão com o banco de dados
'	sql.Close
	Return True
End Sub


Sub UpdateCardData(id As Int, img As String, number As String, bankname As String, holder As String, expireddate As String, TypeCard As String) As ResumableSub
	Dim query As String
	query = "UPDATE card SET img = ?, number = ?, bankname = ?, holder = ?, expireddate = ?, type = ? WHERE id = ?"
	' Prepara a instrução SQL
	sql.ExecNonQuery2(query, Array As Object(img, number, bankname, holder, expireddate, TypeCard, id))
	' Fecha a conexão com o banco de dados
'	sql.Close
	Return True
End Sub


Sub DeleteCardData(id As Int)  As ResumableSub
	' Abre o banco de dados
'	Dim sql As SQL
'	sql.Initialize(File.DirInternal, "mydatabase.db", True)

'
	DeletetransacaoByIDcard(id)
'	' Cria a instrução SQL de exclusão de dados
	Dim query As String
	query = "DELETE FROM card WHERE id = ?"
	Log("DELETE FROM card WHERE id = ?")
	' Prepara a instrução SQL
	sql.ExecNonQuery2(query, Array As Object(id))
	
	
	' Fecha a conexão com o banco de dados
'	sql.Close
	Return True
End Sub



#end region