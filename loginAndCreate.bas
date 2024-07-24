B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12.8
@EndOfDesignText@

Sub Class_Globals
	Private Root As B4XView
	Private xui As XUI
'	Private EditText1 As EditText
'	Private EditText2 As EditText
	Dim actualsplash As Boolean=False
'	Private EditText3 As EditText
	Private Button1login As Button
	Private Panel1mail As Panel
	Private Panel2pass As Panel
'	Private EditText1mail As EditText
'	Private EditText2pass As EditText
'	Private EditText1fullname As EditText
'	Private EditText2mail As EditText
'	Private EditText3pass As EditText
	Private ImageView1 As ImageView
	Private ImageView2 As ImageView
	Private ImageView3 As ImageView
	Private Label1 As Label
	Private Label1back As Label
	Private Label2 As Label
'	Private Label4 As Label
	Private Label4Effect As Label
'	Private Panel1Fname As B4XView
'	Private Panel2mail As B4XView
'	Private Panel3pass As B4XView
	Private EditText1mailL As EditText
	Private EditText2passL As EditText
	Private EditText1fullnameC As EditText
	Private EditText2mailC As EditText
	Private EditText3passC As EditText
	Private Panel1FnameC As B4XView
	Private Panel2mailC As B4XView
	Private Panel3passC As B4XView
'	Private EditText4name As EditText
'	Private EditText1Email As EditText
'	Private EditText3Pass1 As EditText
'	Private EditText2Pass2 As EditText
'	Private Button1LSingUp As Button
	Private Label3 As Label
'	Private Label4S As Label
'	Private Label5 As Label
'	Private Panel1 As Panel
'	Private Panel2 As Panel
'	Private Panel3 As Panel
'	Private Panel4 As Panel
'	Private Panel5 As Panel
'	Private Activity As Activity
	Private EditText3passC2 As EditText
	Private Panel3passC2 As Panel
End Sub

Public Sub Initialize
	B4XPages.GetManager.LogEvents = True
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	splash
End Sub



Sub B4XPage_Appear
'	geral.ResetUserFontScale(Root)
'	(0xff2E4D3B,0xff2D4A38)
End Sub

Sub login
	actualsplash=False
	Root.RemoveAllViews
	Root.LoadLayout("login")
	Button1login.Tag="l"
	geral.SetStatusNavBarColor(0xFF101114,0xFFF7F7F7)
	geral.colordarkIconsStatusbar
	geral.darkiconnav
'	EditText1mailL.InputType= Bit.Or(EditText1mailL.INPUT_TYPE_TEXT,  16384)
	EditText1mailL.Color=Colors.Transparent
	EditText2passL.Color=Colors.Transparent
End Sub

Sub create
	actualsplash=False
	Root.RemoveAllViews
	Root.LoadLayout("create")
	Button1login.Tag="c"
	geral.SetStatusNavBarColor(0xFF101114,0xFFF7F7F7)
	geral.colordarkIconsStatusbar
	geral.darkiconnav
	EditText1fullnameC.Color=Colors.Transparent
	EditText1fullnameC.InputType=Bit.Or(EditText1fullnameC.INPUT_TYPE_TEXT,49152)'=Colors.Transparent
'	EditText1fullnameC.Typeface=(EditText1fullnameC.TYPE_CLASS_TEXT,EditText1fullnameC.TYPE_TEXT_FLAG_CAP_SENTENCES))
	EditText2mailC.Color=Colors.Transparent
	EditText3passC.Color=Colors.Transparent
	EditText3passC2.Color=Colors.Transparent
End Sub


'
'Sub login
'	Root.RemoveAllViews
'	Root.LoadLayout("loginScreen")
'	EditText1.Color=Colors.Transparent
'	EditText2.Color=Colors.Transparent
'	Dim cs As CSBuilder
'	cs.Initialize.Append("Don’t you have an account? ")
'	cs.Clickable("cs", 1).Bold.Append("Create now!").Pop.PopAll
'	cs.EnableClickEvents(Label4)	
'	Label4.Text=cs
'End Sub
'Sub cs_Click (Tag As Object)
'	create
'End Sub
'
'Sub create
'	Root.RemoveAllViews
'	Root.LoadLayout("createAccount")
'	EditText3Pass1.Color=Colors.Transparent	
'	EditText2Pass2.Color=Colors.Transparent	
'	EditText1Email.Color=Colors.Transparent	
'	EditText4name.Color=Colors.Transparent	
'	Dim cs As CSBuilder
'	cs.Initialize.Append("Already have an account? ")
'	cs.Clickable("css", 1).Bold.Append("Login now!").Pop.PopAll
'	cs.EnableClickEvents(Label4S)	
'	Label4S.Text=cs
'End Sub

Sub splash
	actualsplash=True
	Root.RemoveAllViews
	Root.LoadLayout("MainPageLogin")
	geral.SetStatusNavBarColor(0xFF101114,0xFF101114)
	geral.colorLightIconsStatusbar
End Sub



Private Sub Button1_Click
	login
End Sub

Private Sub Button1SignUp_Click
	create
End Sub

Private Sub Label1back_Click
	splash
End Sub

Private Sub B4XPage_CloseRequest As ResumableSub		
	Log(actualsplash)
	If actualsplash=False Then
		splash
		Return False
	Else
		Return True
	End If
	
End Sub

Private Sub Button1login_Click
	
	If Button1login.Tag="l" Then
		LoginUser
'		If LoginUser(EditText1.text,EditText2.text) Then B4XPages.ShowPageAndRemovePreviousPages("mp")
	End If
	
	If Button1login.Tag="c" Then
'		insertUser
		SignUp
	End If
	
End Sub


Sub SignUp
	' Captura os valores dos campos EditText
	Dim nome As String = EditText1fullnameC.Text.Trim
	Dim email As String = EditText2mailC.Text.Trim
	Dim senha As String = EditText3passC.Text.Trim
	Dim senha2 As String = EditText3passC2.Text.Trim

	If nome = "" And email="" And senha="" And senha2="" Then
		geral.alertViews(Panel1FnameC,EditText1fullnameC)
		geral.alertViews(Panel2mailC,EditText2mailC)
		geral.alertViews(Panel3passC,EditText3passC)
		geral.alertViews(Panel3passC2,EditText3passC2)
		ToastMessageShow("Please all your fields", True)
		
	else If nome = "" Then		
		geral.alertViews(Panel1FnameC,EditText1fullnameC)		
		ToastMessageShow("Please check your name", True)
	else If geral.IsEmail(email)=False Then
		geral.alertViews(Panel2mailC,EditText2mailC)
		ToastMessageShow("Please check your email address", True)	
	else If senha = "" Then
		geral.alertViews(Panel3passC,EditText3passC)
		ToastMessageShow("Please check your password", True)
	else If senha2 = "" Then
		geral.alertViews(Panel3passC2,EditText3passC2)
		ToastMessageShow("Please check your password", True)				
		else If senha2<>senha Then
			geral.alertViews(Panel3passC,EditText3passC)
			geral.alertViews(Panel3passC2,EditText3passC2)
		ToastMessageShow("Passwords do NOT match, Please check your password", True)
	
	Else
		insertUser(nome,email,senha)
	End If


End Sub







Sub LoginUser
	Dim email As String = EditText1mailL.Text.Trim
	Dim senha As String = EditText2passL.Text.Trim	
	If geral.IsEmail(email)=False And  senha = "" Then
		geral.alertViews(Panel1mail,EditText1mailL)
		geral.alertViews(Panel2pass,EditText2passL)
		ToastMessageShow("Please check your email and Password field" , True)
			
	else If geral.IsEmail(email)=False Then
		geral.alertViews(Panel1mail,EditText1mailL)
		ToastMessageShow("Please check your email address", True)
	else If senha = "" Then
		Log("Here")
		geral.alertViews(Panel2pass,EditText2passL)
		ToastMessageShow("Please check your Password", True)
	Else
		If selectUser(email,senha) Then
			B4XPages.ShowPageAndRemovePreviousPages("mp")
		Else
			MsgboxAsync("Invalid email or password", "Login")
		End If
	End If
	
End Sub


Sub insertUser(fname As String, email As String, pass As String)	
	
	File.Copy(File.DirAssets, "ellipse 10.png",File.DirInternal,"profile.png")	
	Dim imagem() As Byte = File.ReadBytes(File.DirInternal,"profile.png")
	If Starter.InsertUserData(fname,email,pass,imagem) Then 
		If selectUser(email,pass) Then B4XPages.ShowPageAndRemovePreviousPages("mp")
		Else
		MsgboxAsync("Oups! Erro while create account! ", "Sign up")
	End If
	
End Sub


Sub selectUser(email As String, senha As String) As Boolean 
    ' Cria a consulta SQL para verificar as credenciais do usuário
    Dim query As String
    query = "SELECT COUNT(*) FROM user WHERE email = ? AND senha = ?"
    Dim args() As String
    args = Array As String(email, senha)

    ' Executa a consulta SQL
    Dim cursor As Cursor
    cursor = Starter.sql.ExecQuery2(query, args)
	
    ' Obtém o resultado da consulta
    cursor.Position = 0
    Dim count As Int = cursor.GetInt("COUNT(*)")

    ' Fecha o cursor e a conexão com o banco de dados
'    cursor.Close
'    sql.Close

	If count <> 0 Then
		File.WriteString(File.DirInternal, "actualuser", email)
	End If
	Log(count > 0)
    ' Retorna verdadeiro se as credenciais estiverem corretas, falso caso contrário
    Return count > 0
End Sub


Private Sub Label5CreateC_Click
	create
End Sub

Private Sub Label5Login_Click
	login
End Sub


'
'Private Sub Button1LSingUp_Click
'	Dim 	passa As Boolean=True
'	If EditText4name.Text="" Then
'		passa =False
'	else If EditText1Email.Text="" Then
'		passa =False
'	else If EditText2Pass2.Text="" Or EditText2Pass2.Text<> EditText3Pass1.Text Then
'		passa =False
'	Else
'		passa=True
'	End If
'	If geral.IsEmail(EditText1Email.Text.Trim)=False Then
'		passa =False
'		EditText1Email.TextColor=Colors.Red
'		Sleep(2000)
'		EditText1Email.TextColor=Colors.White
'		ToastMessageShow( "Invalid email format!",False)
'	End If
'	
'	If passa Then
'		Dim numeritens As Int
''		numeritens = Main.SQL1.ExecQuerySingleResult("SELECT count(*) FROM user where email='"&EditText1Email.Text&"' ")
'		If numeritens=0 Then
''			saveUser1(EditText4name.Text,EditText1Email.Text,EditText2Pass2.text)
'			Sleep(900)
''			login1(EditText1Email.Text,EditText2Pass2.text)
'		Else
'			ToastMessageShow("User with this email already exists.",False)
'		End If
'			
'		
'	Else
'		ToastMessageShow("Please fill in all mandatory fields.",False)
'	End If
'End Sub
'
'
'Private Sub Button1Login_Click
'	If EditText1.text="" Then 
'		ToastMessageShow("Please fill in all mandatory fields.",False)
'	else If EditText2.text="" Then
'		ToastMessageShow("Please fill in all mandatory fields.",False)
'	else If geral.IsEmail(EditText1.Text.Trim)=False Then
'		EditText1.TextColor=Colors.Red
'		Sleep(2000)
'		EditText1.TextColor=Colors.White
'		ToastMessageShow( "Invalid email format!",False)
'		Else		
''		login1(EditText1.Text,EditText2.Text)'=Colors.Transparent
'	End If
'End Sub