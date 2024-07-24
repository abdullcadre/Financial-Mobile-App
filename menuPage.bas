B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12.8
@EndOfDesignText@

Sub Class_Globals
	Private Root As B4XView
	Private Root2 As B4XView
	Private xui As XUI
	Private CustomListView1recents As CustomListView
	Private Label4price As Label
	Private Label3time As Label
'	Dim tr As Transaction
'	Dim nt As Notification_c
	Dim side As Int=275dip
	Private Drawer As B4XDrawer
	Private Label2leftMenu As B4XView
	Private Panel1Main As B4XView
	Private imgveffectTop As B4XView
	Private CustomListView1leftMenu As CustomListView
	Private Label2catyname As B4XView
	Private Label2menuName As B4XView
'	Private ImageView1 As B4XView
	Private ImageView1leftIcon As B4XView
	Private Panel1MenuItem As B4XView
'	Dim login As loginAndCreate
	Private Label4name As Label
	Private Label4nameMain As Label
	Private ImageView1User As ImageView
	Private Label5CbMail As Label
'	Private Panel2card As Panel
	Private AS_CardSlider1 As AS_CardSlider
	Private ImageView1CardMain As ImageView
	Private Panel2mov As Panel
	Private Label2note As Label
	Private Label6Mybalance As Label
	Private Label18go As Label
	Private Panel1EmptyTras As Panel
	
	Dim inam As Double=0
	Dim outam As Double=0
	
	Private Panel1EmptyCards As Panel
	Private Label4out As Label
	Private Label5outMoney As Label
	Private Label6in As Label
	Private Label7inmoney As Label
	Dim filename As String=Rnd(0,90)&"_report.pdf"
	Dim palmo As PalmoHtmlToPdf
	Private Label17 As Label
	
	
	Private Label3noty As Label
End Sub

Public Sub Initialize
	B4XPages.GetManager.LogEvents = True
	B4XPages.GetManager.TransitionAnimationDuration=0' = True
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	palmo.Initialize("palmo")
	Root = Root1
	Drawer.Initialize(Me, "Drawer", Root,side)
	Drawer.GestureEnabled=True
	Drawer.CenterPanel.LoadLayout("MainPage")
	Drawer.LeftPanel.LoadLayout("leftmenu")
	AS_CardSlider1.Tag=0
	Drawer.CenterPanel.Color=0xFF1D253C
	Drawer.LeftPanel.Color=0xFF1D253C
	Drawer.LeftPanel.As(Panel).Elevation=0
	Drawer.CenterPanel.As(Panel).Elevation=0
	Root.Color=0xFF1D253C
	Root2.SetColorAndBorder(0xFFF7F7F7,0dip,Colors.Transparent,0dip)
	fillleftMneu	
	Sleep(30)
	change
End Sub


Sub getTrasitions(idcard As Int)	
	Dim balancecard As Double=0	
	Dim inam As Double=0
	Dim outam As Double=0
	Label6Mybalance.Text=Starter.getMoeda&(inam-outam)
	Label7inmoney.Text=Starter.getMoeda&(inam)
	Label5outMoney.Text=Starter.getMoeda&(outam)
	CustomListView1recents.Clear
	Dim Cursor As Cursor
	Cursor = Starter.sql.ExecQuery("SELECT * FROM transacaoo WHERE card = '"&idcard&"' ORDER BY id DESC")
	For i = 0 To Cursor.RowCount - 1
		Cursor.Position = i			
		CustomListView1recents.Add(CreateLisCat(Cursor.GetString("nota"),Cursor.GetDouble("amount"),Cursor.GetString("data"),Cursor.GetString("tipo")),Array As Object(Cursor.GetString("id"),Cursor.GetString("tipo")))
		balancecard=balancecard+Cursor.GetDouble("amount")		
		Label7inmoney.Text=Starter.getMoeda&NumberFormat((inam),2,2)
		Label5outMoney.Text=Starter.getMoeda&NumberFormat((outam),2,2)
		Label6Mybalance.Text=Starter.getMoeda&NumberFormat((inam-outam),2,2)	
		
		Label18go.Tag=Array As Object(idcard,"")
		
	Next
	
	If i<>0 Then
		Panel1EmptyTras.Visible=False
		Label18go.Visible=True
		Else
		Panel1EmptyTras.Visible=True
		Label18go.Visible=False
	End If



	If Label6Mybalance.Text.Contains("-") Then
		Label6Mybalance.TextColor=Colors.Red
		Else
		Label6Mybalance.TextColor=Colors.White			
	End If
End Sub


public Sub cards1
	Sleep(250)
	Label6Mybalance.Text=""
	AS_CardSlider1.Clear
	AS_CardSlider1.LazyLoading = False
	Dim Cursor As Cursor
	Cursor = Starter.sql.ExecQuery("SELECT * FROM card WHERE iduser = '"&Starter.GetIdUser&"' ORDER BY id ASC")
	For i = 0 To Cursor.RowCount - 1
		Cursor.Position = i			
		AS_CardSlider1.AddPage(CreateListCards(Cursor.GetString("number"),Cursor.GetString("id")),Cursor.GetString("id"))
	Next
	
	If i<>0 Then
'		Log(AS_CardSlider1.Tag)
		Panel1EmptyCards.Visible=False			
		Else	
		Log("Here")			
		geral.SetStatusNavBarColor(Colors.White,Colors.White)
		geral.darkiconnav
		geral.colordarkIconsStatusbar
		Label6Mybalance.Text="$0"
		Panel1EmptyCards.Visible=True		
	End If
	
'If i=1 Then
'
''Sleep(0)
''AS_CardSlider1_PageChanged(0,AS_CardSlider1.Tag)
'End If	


	If i=1 Then		
		getTrasitions(Cursor.GetInt("id"))		
		
		B4XPages.GetPage("mvm").as(MovmentMoney).cardid=Cursor.GetInt("id")
		Else			
		Sleep(0)		
		change
	End If



End Sub
'

Sub change
	Log(AS_CardSlider1.Tag)
	Dim NumberOfMatches As Int
	NumberOfMatches = Starter.sql.ExecQuerySingleResult("SELECT count(*) FROM transacaoo WHERE user = '"&Starter.GetIdUser&"' ")
	Log(NumberOfMatches<>0 And AS_CardSlider1.Size<>0)
	If NumberOfMatches<>0 And AS_CardSlider1.Size<>0 Then
'		AS_CardSlider1_PageChanged(3,0)
'		AS_CardSlider1.RefreshLite
'		AS_CardSlider1.Refresh
		AS_CardSlider1.NextPage
		AS_CardSlider1.PreviousPage		
		End If
End Sub
'
Sub CreateListCards(name As String,idcard As Int) As B4XView
	name=name.Replace("","_")&".png"
	Dim xui As XUI
	Dim p As B4XView  = xui.CreatePanel("")
	p.SetLayoutAnimated(0, 0, 0,AS_CardSlider1.mBase.Width,AS_CardSlider1.mBase.Height)
	p.LoadLayout("cardTBankMain")
	ImageView1CardMain.Tag=idcard
	ImageView1CardMain.Bitmap=(LoadBitmap(File.DirInternal,name))
	Return p
End Sub


Sub B4XPage_Disappear 
'	Log(AS_CardSlider1.Tag)
End Sub


Private Sub ImageView1CardMain_Click
	ImageView1CardMain = Sender
	Log(ImageView1CardMain.Tag)
	editCard(ImageView1CardMain.Tag)
End Sub

Private Sub AS_CardSlider1_PageChanged(OldIndex As Int, NewIndex As Int)
	Sleep(9)	
	Log("OldIndex: "&OldIndex)
	Log("NewIndex: "&NewIndex)
	Log(AS_CardSlider1.Size)
	AS_CardSlider1.Tag=NewIndex
	B4XPages.GetPage("mvm").as(MovmentMoney).cardid=AS_CardSlider1.GetValue(NewIndex)	
	getTrasitions(AS_CardSlider1.GetValue(NewIndex))	
End Sub

Private Sub B4XPage_Resize (Width As Int, Height As Int)
	
End Sub

#If B4J
Private Sub Label1_MouseClicked (EventData As MouseEvent)
	AS_CardSlider1.NextPage
End Sub

Private Sub Label2_MouseClicked (EventData As MouseEvent)
	AS_CardSlider1.PreviousPage
End Sub
#Else
Private Sub Label1_Click
	AS_CardSlider1.NextPage
End Sub

Private Sub Label2_Click
	AS_CardSlider1.PreviousPage
End Sub
#End If

'End Sub



Sub B4XPage_Appear
	If Drawer.LeftOpen Then
		geral.SetStatusNavBarColor(0xFF121524,0xFF121524)
		geral.colorLightIconsStatusbar
	Else
		geral.SetStatusNavBarColor(0xFF101114,0xFFF7F7F7)
		geral.darkiconnav
	End If
	For i = 0 To CustomListView1leftMenu.Size - 1
		Dim p As B4XView = CustomListView1leftMenu.GetPanel(i)
		If p.NumberOfViews > 0 Then
			Dim ContentLabel As B4XView = p.GetView(0)
			UpdateItemColor(i,Colors.Transparent)
			If ContentLabel.Tag ="home" Then
				geral.SetPanelGradientRightLeft(ContentLabel,0x37808080,0x00808080)
			End If
		End If
	Next
	GetUser(File.ReadString(File.DirInternal, "actualuser"))	
	cards1

End Sub


Sub GetUser(email As String) 
	Dim Cursor As Cursor
	Cursor = Starter.SQL.ExecQuery("SELECT * FROM user WHERE email = '"&email&"' limit 1")
	For i = 0 To Cursor.RowCount - 1
		Cursor.Position = i
		Label4nameMain.text=$" Ciao, ${Cursor.GetString("nome")}!  "$
		Label4name.text=Cursor.GetString("nome")
		Label5CbMail.Text=Cursor.GetString("email")		
		Dim Buffer() As Byte = Cursor.GetBlob("imagem")
		Dim InputStream1 As InputStream
		InputStream1.InitializeFromBytesArray(Buffer, 0, Buffer.Length)
		Dim Bitmap1 As Bitmap
		Bitmap1.Initialize2(InputStream1)
		InputStream1.Close
		Dim img As Bitmap = Bitmap1
		ImageView1User.Bitmap=(geral.CreateRoundRectBitmap(img, 9005dip))		
	Next	
End Sub

  
Sub fillleftMneu'
	Dim menus() As String = Array As String("home", "transitions", "cards", "profile","settings","logout")
	CustomListView1leftMenu.Clear
	CustomListView1leftMenu.Add(CreateCardLeftMenuCaty("MENU"),"non")
	For Each menu As String In menus		
		CustomListView1leftMenu.Add(CreateCardLeftMenu(menu),menu)
	Next
	CustomListView1leftMenu.Add(CreateCardLeftMenuCaty("APP"),"non")
	CustomListView1leftMenu.Add(CreateCardLeftMenu("about app"),"about app")
End Sub
 
Sub CreateLisCat(note As String, amount As Double,time As String, tipo As String) As B4XView
	Dim xui As XUI
	Dim p As B4XView  = xui.CreatePanel("")
	p.SetLayoutAnimated(0, 0, 0,100%x, 80dip)
	p.LoadLayout("card")
	If tipo="in" Then
		Label4price.Text="+"&Starter.getMoeda&amount
		inam=inam+amount
		geral.AdjustImageViewPanel(Panel2mov,"request.png")
	End If
	
	If tipo="out" Then
		Label4price.Text="-"&Starter.getMoeda&amount
		outam=outam+amount		
		geral.AdjustImageViewPanel(Panel2mov,"sendicon.png")
	End If
	Label2note.Text=note	
	Label3time.Text=time
	Return p
End Sub

Sub CreateCardLeftMenuCaty(name As String) As B4XView
	Dim xui As XUI
	Dim p As B4XView  = xui.CreatePanel("")
	p.SetLayoutAnimated(0, 0, 0,100%x, 40dip)
	p.LoadLayout("category")
	Label2catyname.Text=name
	Return p
End Sub


Sub CreateCardLeftMenu(name As String) As B4XView
	Dim xui As XUI
	Dim p As B4XView  = xui.CreatePanel("")
	p.SetLayoutAnimated(0, 0, 0,side, 65dip)
	p.LoadLayout("cardleftMenu")
	If name="home" Then
		geral.SetPanelGradientRightLeft(Panel1MenuItem,0x37808080,0x00808080)
	End If
	Panel1MenuItem.Tag=name
	Label2menuName.Text=name.ToUpperCase
	Dim nameicon As String=name&".png"
	geral.AdjustImageView(ImageView1leftIcon,nameicon)
	Return p
End Sub



Private Sub Label2leftMenu_Click
	Drawer.LeftOpen=Not(Drawer.LeftOpen)
End Sub


Sub openMenu
	geral.SetStatusNavBarColor(0xFF1D253C,0xFF1D253C)
	Dim rd As Int=30dip
	Label2leftMenu.SetRotationAnimated(15,90)
	Root2.SetLayoutAnimated(15,side-1%x,5%y,90%x,90%y)
	geral.RotatePanelY(Root2,-8)
	Root2.SetColorAndBorder(0xFFF7F7F7,2dip,0xFFF7F7F7,rd)
	Dim img As B4XBitmap = xui.LoadBitmap(File.DirAssets, "Untitled-nonmodified.png")
	geral.ImageWithTopCorners(img, imgveffectTop, rd)
	geral.colorLightIconsStatusbar
'	disabelallviews!
End Sub



Sub disabelallviews
	Root2.Enabled=Not(Drawer.LeftOpen)
	For Each v As View In Root2.GetAllViewsRecursive
		v.Enabled=Not(Drawer.LeftOpen)
	Next
	
	Label2leftMenu.Enabled=True
End Sub


Sub CloseMenu
	Label2leftMenu.SetRotationAnimated(150,0)
	Root2.SetLayoutAnimated(150,0%x,0,100%x,100%y)
	geral.RotatePanelY(Root2,0)
	Root2.SetColorAndBorder(0xFFF7F7F7,0dip,Colors.Red,0dip)
	Dim img As B4XBitmap = xui.LoadBitmap(File.DirAssets, "Untitled-nonmodified.png")
	imgveffectTop.SetBitmap(img)
	Sleep(150)
	geral.SetStatusNavBarColor(0xFF101114,0xFFF7F7F7)
	geral.darkiconnav
'	disabelallviews
End Sub

Private Sub Drawer_StateChanged' (open As Boolean)
	
	If Drawer.LeftOpen Then
		openMenu
	Else
		CloseMenu
	End If
	disabelallviews	
End Sub

Private Sub Panel1MenuItem_Click
	For i = 0 To CustomListView1leftMenu.Size - 1
		UpdateItemColor(i,Colors.Transparent)
	Next
	Panel1MenuItem=Sender
	geral.SetPanelGradientRightLeft(Panel1MenuItem,0x37808080,0x00808080)
	Dim Value As String=Panel1MenuItem.tag
	Drawer.LeftOpen=False
	Sleep(300)
	If Value="transitions" Then
		B4XPages.ShowPage("tr")
	End If
	If Value="cards" Then
		B4XPages.ShowPage("lc")
	End If
	
	If Value="send" Then
		outmoney
	End If
	
	If Value="request1" Then
		inmoney
	End If
	
	If Value="profile" Then
		B4XPages.ShowPage("pf")
	End If
	
	If Value="settings" Then
		B4XPages.ShowPage("st")
	End If
	
	
	If Value="logout" Then		
		Msgbox2Async("Do you really want to leave?", "Logout", "Yes", "", "Cancel", Null, False)
		Wait For Msgbox_Result (Result As Int)
		If Result = DialogResponse.POSITIVE Then
			File.WriteString(File.DirInternal, "actualuser", "nulo")
			B4XPages.ShowPage("MainPage")
		End If	
	End If
	
End Sub


Sub UpdateItemColor (Index As Int, Color As Int)
	Dim p As B4XView = CustomListView1leftMenu.GetPanel(Index)
	If p.NumberOfViews > 0 Then
		Dim ContentLabel As B4XView = p.GetView(0)
		ContentLabel.Color = Color
	End If
End Sub

Private Sub Label3noty_Click
	
	Log(Label18go.Tag)'=Cursor.GetString("id")
'	idcard
	
	B4XPages.GetPage("nt").As(Notification_c).carinfo=Label18go.Tag
	B4XPages.ShowPage("nt")
End Sub



Private Sub B4XPage_CloseRequest As ResumableSub
	Log("MainPage CloseRequest")
	' Close the Drawer and don't exit if it's open
	If Drawer.LeftOpen Then
		Drawer.LeftOpen=False
		Return False
	Else
		
		Msgbox2Async("Do you really want to close the app 🥲?", "Close", "Yes", "", "Cancel", Null, False)
		Wait For Msgbox_Result (Result As Int)
		If Result = DialogResponse.POSITIVE Then
			Return True
			Else
			Return False
		End If
		
	End If
End Sub

Private Sub Panel4Send_Click
	
End Sub

Private Sub Panel6_Click
	newcardq
End Sub


Sub newcardq
	B4XPages.ShowPage("nc")
	B4XPages.GetPage("nc").As(NewCard).mode="new"
'	B4XPages.GetPage("nc").As(NewCard).newC
	B4XPages.ShowPage("nc")
	
End Sub



Sub editCard(id As Int)
	B4XPages.ShowPage("nc")
	B4XPages.GetPage("nc").As(NewCard).mode="edit"
	B4XPages.GetPage("nc").As(NewCard).idCard=id
	Sleep(10)
	
End Sub


Sub outmoney
	B4XPages.GetPage("mvm").As(MovmentMoney).modo="new"
	B4XPages.GetPage("mvm").As(MovmentMoney).tipo="out"
	B4XPages.ShowPage("mvm")
End Sub


Sub inmoney
	B4XPages.GetPage("mvm").As(MovmentMoney).modo="new"
	B4XPages.GetPage("mvm").As(MovmentMoney).tipo="in"
	B4XPages.ShowPage("mvm")
End Sub


Sub editinMoney
	B4XPages.GetPage("mvm").As(MovmentMoney).modo="edit"
	B4XPages.GetPage("mvm").As(MovmentMoney).tipo="in"
	B4XPages.ShowPage("mvm")
End Sub

'
'Sub editoutMoney
'	B4XPages.GetPage("mvm").As(MovmentMoney).tipo="edit"
'	B4XPages.GetPage("mvm").As(MovmentMoney).tipo="out"
'	B4XPages.ShowPage("mvm")
'End Sub



Private Sub Panel4request_Click
	inmoney
End Sub

Private Sub Panel4Out_Click
	outmoney
End Sub

Private Sub Label18go_Click
	
	Log(Label18go.Tag)'=Cursor.GetString("id")
'	idcard
	
	B4XPages.GetPage("tr").As(Transaction).carinfo=Label18go.Tag
	B4XPages.ShowPage("tr")
End Sub

Private Sub Label17_Click
'	B4XPages.ShowPage("tr")
End Sub

Private Sub Button1Addcard_Click
	newcardq
End Sub

Private Sub Panel1EmptyCards_Click
	Log("nada")
End Sub

Private Sub CustomListView1recents_ItemClick (Index As Int, Value As Object)
	Dim v() As Object=Value
	Log(v(0))
	Log(v(1))

'	Dim cs As CSBuilder
'	cs.Initialize.Color(Colors.Red).Bold.Append("Delete").PopAll
	Dim Opzione1,Opzione2,Opzione3 As CSBuilder
	'cs.Initialize.Color(Colors.Red).Bold.Append(Chr(0xF014) &" Cancella").PopAll
	Opzione1.Initialize.Color(Colors.Black).Typeface(Typeface.FONTAWESOME).Append(Chr(0xF044) & " Modifica").PopAll
	Opzione2.Initialize.Color(Colors.Black).Typeface(Typeface.FONTAWESOME).Append(Chr(0xF02F) & " Stampa").PopAll
	Opzione3.Initialize.Color(Colors.Red).Bold.Typeface(Typeface.FONTAWESOME).Append(Chr(0xF014) &" Cancella").PopAll
	

	Dim options As List = Array(Opzione1, Opzione2, Opzione3)
	InputListAsync(options, "Operazione", -1, True)
	Wait For InputList_Result (Index As Int)
	If Index <> DialogResponse.CANCEL Then

		If Index=0 Then
			B4XPages.GetPage("mvm").As(MovmentMoney).idmov=v(0)
			editinMoney
			cards1
		End If
		
		If Index=1 Then
			print(v(0))
		End If
		If Index=2 Then			
			Msgbox2Async("Sei Sicuro di vole cancellare questo movimento?", "Cancella", "Si", "", "Annulla", Null, True)
			'Msgbox2Async("Do you want to eliminate this movement?", "Delete", "Yes", "", "Cancel", Null, True)
			Wait For Msgbox_Result (Result As Int)
			If Result = DialogResponse.POSITIVE Then
				Starter.DeletetransacaooData(v(0))
				cards1
			End If
			
		End If
		
	End If
End Sub

Sub print(idtras As Int)
	Dim text2 As String=File.ReadString(File.DirAssets,"invoice.html")
	Dim Cursor As Cursor
	Cursor = Starter.sql.ExecQuery("SELECT * FROM transacaoo WHERE id = '"&idtras&"' limit 1")
	For i = 0 To Cursor.RowCount - 1
		Cursor.Position = i		
		Log(Cursor.GetString("data"))
		Log(Cursor.GetString("nota"))
		Log(Cursor.GetString("amount"))
		Log(Cursor.GetString("tipo"))
		Log(Cursor.GetString("card"))
		Log(Cursor.GetString("user"))	
		text2=text2.Replace("{id}",idtras)
		text2=text2.Replace("{note}",Cursor.GetString("nota"))
		text2=text2.Replace("{Type}",Cursor.GetString("tipo"))
		text2=text2.Replace("{date}",Cursor.GetString("data"))
		text2=text2.Replace("{amount}",Starter.getMoeda&Cursor.GetString("amount"))
	Next
	Dim filename As String=Rnd(0,90)&"_report_Transaction.pdf"
	palmo.ConvertFromString(text2,File.DirInternal,filename)
End Sub

Sub palmo_Finished (Success As Boolean)
	Log(Success)
	If Success Then
'		Log("File saved successfully? " & Success)
		geral.view(filename)
	Else
		Sleep(99)
		ProgressDialogHide
	End If
End Sub
