B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12.8
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore
'	Private EditText1Name As EditText
'	Private EditText1Email As EditText
'	Private EditText3Pass As EditText
'	Private ImageView3Profile As ImageView
	Dim choser As ContentChooser	
	Dim imagem() As Byte'= File.ReadBytes(File.DirAssets, "ellipse 10.png")
	Private Panel1 As Panel
	Private Panel2 As Panel
	Private Button1SaveUser As Button
	Private CheckBox1EditPass As CheckBox
	Private EditText1Email As EditText
	Private EditText2Pass2 As EditText
	Private EditText3Pass1 As EditText
	Private EditText4name As EditText
	Private ImageView1user As ImageView
	Private Label1CloseEP As Label
	Private Label2 As Label
	Private Label3 As Label
	Private Label4 As Label
	Private Label5 As Label
'	Private Panel3 As Panel
'	Private Panel4 As Panel
'	Private Panel5 As Panel
	Private Panel5name As Panel
	Private Panel2email As Panel
	Private Panel4pass1 As Panel
	Private Panel3pass2 As Panel
End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	imagem= File.ReadBytes(File.DirInternal,"profile.png")
	choser.Initialize("cc")
	Root = Root1
	Root.LoadLayout("editprofile")
	EditText4name.Color=Colors.Transparent
	EditText1Email.Color=Colors.Transparent
	EditText3Pass1.Color=Colors.Transparent
	EditText2Pass2.Color=Colors.Transparent
	GetUser
End Sub

Private Sub Label2leftMenu_Click
	B4XPages.ClosePage(Me)
End Sub

Sub  B4XPage_Appear 
	geral.SetStatusNavBarColor(Root.Color,Root.Color)
	geral.colorLightIconsStatusbar
End Sub

Sub GetUser 	
	Dim email As String=File.ReadString(File.DirInternal, "actualuser")
	Log(email)
	Dim Cursor As Cursor
	Cursor = Starter.sql.ExecQuery("SELECT * FROM user WHERE email = '"&email&"' limit 1")
	Cursor.Position = 0	
	EditText3Pass1.Text=Cursor.GetString("senha")
	EditText2Pass2.Text=""
	EditText4name.Text=Cursor.GetString("nome")
	EditText1Email.Text=Cursor.GetString("email")
	Dim Buffer() As Byte = Cursor.GetBlob("imagem")
	Dim InputStream1 As InputStream
	InputStream1.InitializeFromBytesArray(Buffer, 0, Buffer.Length)
	Dim Bitmap1 As Bitmap
	Bitmap1.Initialize2(InputStream1)
	InputStream1.Close	
	Dim img As Bitmap = Bitmap1
	ImageView1user.Bitmap=(geral.CreateRoundRectBitmap(img, 20dip)) 'ImageView1 type is set to B4XView
End Sub


Sub updateuser
	Dim name As String = EditText4name.Text.Trim
	Dim email As String = EditText1Email.Text.Trim
	Dim pass1 As String = EditText3Pass1.Text.Trim
	Dim pass2 As String = EditText2Pass2.Text.Trim	
	
	If geral.IsEmail(email)=False And  name = "" And pass1 ="" And pass2="" Then
		geral.alertViews(Panel5name,EditText4name)
		geral.alertViews(Panel2email,EditText1Email)
		geral.alertViews(Panel4pass1,EditText3Pass1)
		geral.alertViews(Panel3pass2,EditText2Pass2)
		ToastMessageShow("Please check your email and Password field" , True)
	else If name = "" Then
		Log("Here")
		geral.alertViews(Panel1,EditText4name)
		ToastMessageShow("Please check your Password", True)
	else If geral.IsEmail(email)=False Then
		geral.alertViews(Panel2,EditText1Email)
		ToastMessageShow("Please check your email address", True)		
		else if pass1="" And CheckBox1EditPass.Checked Then
		geral.alertViews(Panel4pass1,EditText3Pass1)
		ToastMessageShow("Please check your Password field" , True)
	else if pass2=""  And CheckBox1EditPass.Checked Then
		geral.alertViews(Panel3pass2,EditText2Pass2)
		ToastMessageShow("Please check your Password field" , True)		
	else if pass2<>pass1  And CheckBox1EditPass.Checked Then
		ToastMessageShow("Passwords do NOT match, Please check your password", True)
	Else		
		imagem= File.ReadBytes(File.DirInternal,"profile.png")			
		If (Starter.UpdateUserProfile(Starter.GetIdUser,EditText4name.Text,EditText1Email.Text,EditText3Pass1.Text,imagem)) Then
			
			Msgbox2Async("Profile updated", "", "OK", "", "", Null, False)
			Wait For Msgbox_Result (Result As Int)
			If Result = DialogResponse.POSITIVE Then
				Label2leftMenu_Click
			End If		
			
		
		Else
			MsgboxAsync("Any erro occorred!", "Update profile")
		End If
	End If
	
End Sub

''
''Private Sub Button1login_Click	
''	
''End Sub
'
'Private Sub ImageView3Profile_Click
'	
'End Sub

Private Sub cc_Result (Success As Boolean, Dir As String, FileName As String)
	 If Success Then		
	File.Copy(Dir, FileName,File.DirInternal,"profile.png")
		imagem= File.ReadBytes(File.DirInternal,"profile.png")
	 Dim Bitmap1 As Bitmap
		Bitmap1.Initialize(File.DirInternal,"profile.png")
		ImageView1user.Bitmap=(geral.CreateRoundRectBitmap(Bitmap1, 20dip)) 'ImageView1 type is set to B4XView
	End If	
End Sub

Private Sub ImageView1user_Click
	choser.Show("image/*", "Choose image")
End Sub

Private Sub Button1SaveUser_Click
	
	updateuser
		
End Sub

Private Sub CheckBox1EditPass_CheckedChange(Checked As Boolean)
	EditText3Pass1.Enabled=Checked
	EditText2Pass2.Enabled=Checked
End Sub


Private Sub B4XPage_CloseRequest As ResumableSub
	Msgbox2Async("Do you really want to close?", "Close", "Yes", "", "Cancel", Null, False)
	Wait For Msgbox_Result (Result As Int)
	If Result = DialogResponse.POSITIVE Then
		Return True
	Else
		Return False
	End If
End Sub

Private Sub Label1CloseEP_Click
	Label2leftMenu_Click	
End Sub