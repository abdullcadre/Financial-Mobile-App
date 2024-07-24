B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12.8
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore
	Private CustomListView1Noty As CustomListView
	Private Label2catyname As Label
	Private Label2noty As Label
	Private Label2note As Label
	Private Label3time As Label
	Private Label4price As Label
	Private Label5separador As Label
	Private Panel1 As Panel
	Private Panel2mov As Panel
	Dim carinfo As Object
	Private Label1nmbrcard As Label
End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	'load the layout to Root
	Root.LoadLayout("notificationUI")
	
	
'	For i=0 To 8
'		If Rnd(0,8) Mod 2 = 0 Then
'			CustomListView1Noty.Add(CreateCardNotypay,"")
'		Else
'			CustomListView1Noty.Add(CreateCardNoty,"")
'		End If
'	Next
'	
'	
'	
'	CustomListView1Noty.Add(CreateCardData("Yesterday"),"")
'	
'	For i=0 To 8
'		If Rnd(0,8) Mod 2 = 0 Then
'			CustomListView1Noty.Add(CreateCardNotypay,"")
'		Else
'			CustomListView1Noty.Add(CreateCardNoty,"")
'		End If
'	Next
	
 
End Sub

Sub B4XPage_Appear
	
	
	Dim info() As Object=carinfo
	
	Dim Cursor As Cursor
	Cursor = Starter.sql.ExecQuery("SELECT * FROM card WHERE id = '"&info(0)&"' ORDER BY id ASC limit 1")
	For i = 0 To Cursor.RowCount - 1
		Cursor.Position = i
		Log(Cursor.GetString("number"))		
		Label1nmbrcard.Text=Cursor.GetString("number")
'		AS_CardSlider1.AddPage(CreateListCards(Cursor.GetString("number"),Cursor.GetString("id")),Cursor.GetString("id"))
	Next
	
	CustomListView1Noty.Clear
	geral.SetStatusNavBarColor(0xFF101114,0xFF101114)
	geral.colorLightIconsStatusbar	
	Dim Cursor2 As Cursor
	
	
'	Select DISTINCT mes
'	FROM transacaoo
'	WHERE card = '4'
'	ORDER BY mes ASC;

	Cursor2 = Starter.sql.ExecQuery("SELECT DISTINCT mes FROM transacaoo WHERE card = '"&info(0)&"' ORDER BY mes ASC")
	For i = 0 To Cursor2.RowCount - 1
		Cursor2.Position = i
'		Log(Cursor2.GetInt("mes")-1)
		Dim mes As String=DateUtils.GetMonthsNames.Get(Cursor2.GetInt("mes")-1)
'		Log(mes)
		CustomListView1Noty.Add(CreateCardData(mes),Cursor2.GetInt("mes"))		
		Dim saidastt, entradatt As Float=0		
		Dim Cursor As Cursor
		Cursor = Starter.sql.ExecQuery("SELECT * FROM transacaoo WHERE mes = '"&Cursor2.GetInt("mes")&"' and user = '"&Starter.GetIdUser&"' and card='"&info(0)&"' ORDER BY id DESC")
		For i2 = 0 To Cursor.RowCount - 1
			Cursor.Position = i2
			
			If Cursor.GetString("tipo")="in" Then
				entradatt=entradatt+Cursor.GetDouble("amount")
				Else
				saidastt=saidastt+Cursor.GetDouble("amount")					
			End If
				CustomListView1Noty.Add(CreateLisCat(Cursor.GetString("nota"),Cursor.GetDouble("amount"),Cursor.GetString("data"),Cursor.GetString("tipo")),Array As Object(Cursor.GetString("id"),Cursor.GetString("tipo")))

		Next
		
		Dim cs As CSBuilder
		Dim calculo As Float=(entradatt-saidastt)
		cs.Initialize.Color(Colors.Gray).Append("Saldo ").Pop.Color(Colors.Gray).Append(mes&"-"&Cursor.GetInt("ano")).pop.Color(Colors.White).Bold.Append(" "&Starter.getMoeda&(NumberFormat(calculo,2,2))).PopAll
		Label2catyname.Text=cs
	Next
End Sub


Sub CreateLisCat(note As String, amount As Double,time As String, tipo As String) As B4XView
	Dim xui As XUI
	Dim p As B4XView  = xui.CreatePanel("")
	p.SetLayoutAnimated(0, 0, 0,100%x, 80dip)
	p.LoadLayout("card")
	If tipo="in" Then
'		balancecardin=balancecardin+amount
'		Label5totalIn.Text="+"&Starter.getMoeda&NumberFormat(balancecardin,2,2)
		geral.AdjustImageViewPanel(Panel2mov,"request.png")
		Label4price.Text="+"&Starter.getMoeda& amount
	End If

	If tipo="out" Then
'		balancecardout=balancecardout+amount
'		Label7Totalout.text="-"&Starter.getMoeda&NumberFormat( balancecardout,2,2)
		geral.AdjustImageViewPanel(Panel2mov,"sendicon.png")
		Label4price.Text="-"&Starter.getMoeda&amount
	End If
'	Label6Mybalance.Text=Starter.getMoeda&NumberFormat( (balancecardin-balancecardout),2,2)
	Label2note.TextColor=Colors.White
	Label4price.TextColor=Colors.White
	Label2note.Text=note
	Label3time.Text=time
	Return p
End Sub

Sub CreateCardData(name As String) As B4XView
	Dim xui As XUI
	Dim p As B4XView  = xui.CreatePanel("")
	p.SetLayoutAnimated(0, 0, 0,100%x, 50dip)
	p.LoadLayout("category")
	Label2catyname.Text=name
	Return p
End Sub

Sub CreateCardNotypay As B4XView
	Dim xui As XUI
	Dim p As B4XView  = xui.CreatePanel("")
	p.SetLayoutAnimated(0, 0, 0,100%x, 75dip)
	p.LoadLayout("cardNotyPay")
	
	Dim cs As CSBuilder
	cs.Initialize
	cs.Typeface(Typeface.DEFAULT_BOLD).color(Colors.White).Append("Lucas ")
	cs.Typeface(Typeface.DEFAULT).color(0xFFA9A9A9).Append("requested a payment of ")
	cs.Typeface(Typeface.DEFAULT).color(0xFF89B9FF).Append("$782.5")
	cs.PopAll
	
	Label2noty.Text=cs
	Return p
End Sub


Sub CreateCardNoty As B4XView
	Dim xui As XUI
	Dim p As B4XView  = xui.CreatePanel("")
	p.SetLayoutAnimated(0, 0, 0,100%x, 70dip)
	p.LoadLayout("cardNoty")
	Dim cs As CSBuilder
	cs.Initialize
	cs.Typeface(Typeface.DEFAULT).color(Colors.White).Append("You received a payment of ")
	cs.Typeface(Typeface.DEFAULT).color(0xFF89B9FF).Append("$782.5")
	cs.Typeface(Typeface.DEFAULT).color(Colors.White).Append(" from ")
	cs.Typeface(Typeface.DEFAULT_BOLD).color(0xFFA9A9A9).Append("Justin Ester")
	cs.PopAll	
	Label2noty.Text=cs
	Return p
End Sub

Private Sub Label2leftMenu_Click
	B4XPages.ClosePage(Me)
End Sub