B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12.8
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI
	Private Label1back As B4XView
'	Private Label2 As B4XView
	Private Label3 As B4XView
'	Private Label4 As B4XView
'	Private Label4Effect As B4XView
'	Private Panel1 As Panel
'	Private Panel2 As B4XView
'	Private Label1number As Label
'	Private EditText1Number As EditText
'	Private Label1Number As Label
'	Private EditText1 As EditText
'	Private Label1CounntNumer As Label
'	
'	Dim cd As CustomLayoutDialog
	Private CustomListView1 As CustomListView
'	Private ImageView1 As ImageView
	Private ImageView1Theme As ImageView
	Private Panel1Card As B4XView
	Private MaskedEditText1 As MaskedEditText
	Private EditText1HolderName As EditText
	Private EditText1Bankname As EditText
	Private MaskedEditText2 As MaskedEditText
	Private Label5 As Label	
	Dim theme As String="cardTheme(3).png"
	Dim cardnumber As String=""
	Dim typecard As String="MasterCard.png"
	Dim Holdername As String=""
	Dim bankname As String=""
	Dim expdate As String=""
	Public mode As String="new"
	Public idCard As Int=0
	Private Label17 As Label
	Private Button1SaveCard As Button
	Private Label2Delete As Label
End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	Root.RemoveAllViews
End Sub


Sub editC
	Root.RemoveAllViews
	Root.LoadLayout("newcard")
	Label2Delete.Visible=True
	Label17.Text="Modifica Card"
	Button1SaveCard.tag="edit"
	Button1SaveCard.Text=Chr(0xF093) & " Aggiorna card"
	geral.SetStatusNavBarColor(0xffF7F7F7,0xffF7F7F7)
	geral.darkiconnav
	geral.colordarkIconsStatusbar
	Dim MyFont As Typeface
	MyFont = Typeface.LoadFromAssets("PlusJakartaSans-SemiBold.ttf")
	MaskedEditText1.Typeface=(MyFont)
	MyFont = Typeface.LoadFromAssets("PlusJakartaSans-Bold.ttf")
	MaskedEditText2.Typeface=(MyFont)
	MaskedEditText1.Color=Colors.Transparent
	EditText1Bankname.Color=Colors.Transparent
	MaskedEditText2.Color=Colors.Transparent
	EditText1HolderName.Color=Colors.Transparent
	EditText1HolderName.InputType = Bit.Or(0x00004000, 0x00000001) 'TYPE_TEXT_FLAG_CAP_SENTENCES + TYPE_CLASS_TEXT	
	Dim Cursor As Cursor
	Cursor = Starter.sql.ExecQuery("SELECT * FROM card")
	For i = 0 To Cursor.RowCount - 1
		Cursor.Position = i
		If Cursor.GetString("id")=idCard Then
			geral.AdjustImageViewPanel(Panel1Card,Cursor.GetString("img"))			
			MaskedEditText1.Text=Cursor.GetString("number")
			EditText1HolderName.Text=Cursor.GetString("holder")
			EditText1Bankname.Text=Cursor.GetString("bankname")
			MaskedEditText2.Text=Cursor.GetString("expireddate")				
			cardnumber=Cursor.GetString("number")
			Holdername=Cursor.GetString("holder")
			bankname=Cursor.GetString("bankname")
			expdate=Cursor.GetString("expireddate")
			theme=Cursor.GetString("img")
			typecard=Cursor.GetString("type")
			Label5.Tag=Cursor.GetString("type")
			Private bmp As B4XBitmap = LoadBitmap(File.DirAssets, Cursor.GetString("type"))
			Label5.SetBackgroundImage(bmp)		
		End If
	Next	
End Sub

Sub newC
	Root.RemoveAllViews
	Root.LoadLayout("newcard")
	Button1SaveCard.tag="new"
	Panel1Card.Tag="cardTheme(3).png"
	geral.SetStatusNavBarColor(0xffF7F7F7,0xffF7F7F7)
	geral.darkiconnav
	geral.colordarkIconsStatusbar
	Dim MyFont As Typeface
	MyFont = Typeface.LoadFromAssets("PlusJakartaSans-SemiBold.ttf")
	MaskedEditText1.Typeface=(MyFont)
	MyFont = Typeface.LoadFromAssets("PlusJakartaSans-Bold.ttf")
	MaskedEditText2.Typeface=(MyFont)
	MaskedEditText1.Color=Colors.Transparent
	EditText1Bankname.Color=Colors.Transparent
	MaskedEditText2.Color=Colors.Transparent
	EditText1HolderName.Color=Colors.Transparent
	EditText1HolderName.InputType = Bit.Or(0x00004000, 0x00000001) 'TYPE_TEXT_FLAG_CAP_SENTENCES + TYPE_CLASS_TEXT
	cardnumber=""
	Holdername=""
	bankname=""
	expdate=""
	theme="cardTheme(3).png"
	typecard="MasterCard.png"
End Sub


Sub callComponnet
	Root.RemoveAllViews
	Sleep(55)
	If mode="new"  Then newC
	If mode="edit"  Then editC
	Sleep(120)
	fillCLV
End Sub
Sub B4XPage_Appear 
'	geral.ResetUserFontScale(Root)
	geral.SetStatusNavBarColor(0xffF7F7F7,0xffF7F7F7)
	callComponnet
End Sub

Private Sub Button1SaveCard_Click
	Log(typecard)
	Log(Button1SaveCard.Tag)
	Log(Button1SaveCard.Text)
	If cardnumber = "" Or Holdername = "" Or bankname = "" Or expdate = "" Then
		' Exibe uma mensagem informando que os campos obrigatórios não podem estar vazios
		MsgboxAsync("The fields 'Card Number', 'Cardholder Name', 'Bank Name' and 'Expiration Date' are mandatory.", "Notice")
		Return ' Retorna sem inserir o registro
	End If
	
	If Button1SaveCard.Tag="new" Then
		Log("aqui 2")		
		createnew	
	End If
	
	
	If Button1SaveCard.Tag="edit" Then	
		Log("aqui")	
		update	
	End If
	
End Sub

Sub createnew
	Wait For (Starter.InsertCardData(theme,cardnumber,bankname,Holdername,expdate,typecard,Starter.GetIdUser)) complete (sucesso As Boolean)	
		Log(sucesso)
		If sucesso Then
		removefocusEDIText
		Log(cardnumber.Replace("","_")&".png")
		Dim Out As OutputStream
		Out = File.OpenOutput(File.DirInternal, cardnumber.Replace("","_")&".png", False)
		Panel1Card.Snapshot.WriteToStream(Out, 100, "PNG")
		Out.Close
			B4XPages.ShowPage("lc")
			callComponnet
		End If
End Sub

Sub update
	Wait For (Starter.UpdateCardData(idCard,theme,cardnumber,bankname,Holdername,expdate,typecard)) complete (sucesso2 As Boolean)
	Log(sucesso2)
	If sucesso2 Then
		removefocusEDIText
		Log(cardnumber.Replace("","_")&".png")
		Dim Out As OutputStream
		Out = File.OpenOutput(File.DirInternal, cardnumber.Replace("","_")&".png", False)
		Panel1Card.Snapshot.WriteToStream(Out, 100, "PNG")
		Out.Close
		B4XPages.ShowPage("lc")
		callComponnet
	End If
End Sub



Sub removefocusEDIText
'	MaskedEditText1.RequestFocus=False
'	MaskedEditText2.RequestFocus=False
'	EditText1Bankname.RequestFocus=False
'	EditText1HolderName.RequestFocus=False
	
	MaskedEditText1.Enabled=False
	MaskedEditText2.Enabled=False
	EditText1Bankname.Enabled=False
	EditText1HolderName.Enabled=False
	
End Sub


Private Sub CustomListView1_ItemClick (Index As Int, Value As Object)
	theme=Value
	Log(Value)
	geral.AdjustImageViewPanel(Panel1Card,Value)
End Sub


Sub CreateLisThemes(name As String) As B4XView
	Dim xui As XUI
	Dim p As B4XView  = xui.CreatePanel("")
	p.SetLayoutAnimated(0, 0, 0,170dip, 115dip)
	p.LoadLayout("themes")
	geral.AdjustImageView(ImageView1Theme,name)
	Return p
End Sub


Sub fillCLV	
'	Log(Panel1Card.Tag)
	CustomListView1.Clear
	For i=1 To 10		
		Dim name As String="cardTheme("&i&").png"	
'		Log(name)
		If File.Exists(File.DirAssets, name) Then			
			If name=Panel1Card.Tag Then				
				CustomListView1.Add(CreateLisThemes(name),name)
			End If		
		End If
	Next
	
	
	For i=1 To 10
		Dim name As String="cardTheme("&i&").png"
'		Log(name)
		If File.Exists(File.DirAssets, name) Then			
			If name<>Panel1Card.Tag Then
'				Log(name)				
				CustomListView1.Add(CreateLisThemes(name),name)
			End If	
		
		End If
	Next
End Sub


Private Sub MaskedEditText2_FocusChanged(HasFocus As Boolean)
'	Log(HasFocus)	
	If HasFocus Then
		Sleep(0)
		MaskedEditText2.SelectAll
		MaskedEditText2.SelectionStart=0
		Sleep(0)
		MaskedEditText2.SelectAll
		MaskedEditText2.SelectionStart=0
	End If
End Sub



Private Sub MaskedEditText1_FocusChanged(HasFocus As Boolean)
	
	Log(HasFocus)
	If HasFocus Then
		Sleep(0)
		MaskedEditText1.SelectAll
		MaskedEditText1.SelectionStart=0
		Sleep(0)
		MaskedEditText1.SelectAll
		MaskedEditText1.SelectionStart=0
	End If
End Sub

Private Sub Label5_Click		
	If Label5.Tag="MasterCard.png" Then
		Private bmp As B4XBitmap = LoadBitmap(File.DirAssets, "visa.png")	
		typecard="visa.png"
		Label5.Tag="visa.png"
		Else		
		Private bmp As B4XBitmap = LoadBitmap(File.DirAssets, "MasterCard.png")
		typecard="MasterCard.png"	
		Label5.Tag="MasterCard.png"
	End If	
	Label5.Tag=typecard
	Log(Label5.Tag)
	Label5.SetBackgroundImage(bmp)
End Sub


'card{ id, img, number, bankname, holder, expireddata, type)

Private Sub MaskedEditText2_TextChanged(Old As String, new As String)
	expdate=new
End Sub

Private Sub EditText1HolderName_TextChanged (Old As String, new As String)
	Holdername=EditText1HolderName.text
End Sub

Private Sub MaskedEditText1_TextChanged(Old As String, new As String)
	cardnumber=MaskedEditText1.text
End Sub

Private Sub EditText1Bankname_TextChanged (Old As String, new As String)
	bankname=EditText1Bankname.text
End Sub

'	If cardnumber = "" Or Holdername = "" Or bankname = "" Or expdate = "" Then


Private Sub Label1back_Click
	B4XPages.ClosePage(Me)
End Sub

Private Sub Label2Delete_Click 
	Msgbox2Async("Are you sure you want To delete this card?", "Delete", "Yes", "", "Cancel", Null, True)
	Wait For Msgbox_Result (Result As Int)
	If Result = DialogResponse.POSITIVE Then
		delete
	End If		
End Sub

Sub delete
	Wait For (Starter.DeleteCardData(idCard)) complete (sucesso As Boolean)
	Log(sucesso)
	If (sucesso) Then
		B4XPages.ShowPage("lc")
		callComponnet
	End If
End Sub



Private Sub B4XPage_CloseRequest As ResumableSub
	Log("MainPage CloseRequest")
	Msgbox2Async("Uscire dalla Gestione Card", "Chiudi", "SI", "", "Annulla", Null, False)
	Wait For Msgbox_Result (Result As Int)
	If Result = DialogResponse.POSITIVE Then
		Return True		
		Else
		Return False
	End If
	
End Sub