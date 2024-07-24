B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12.8
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore
	Private B4XComboBox1 As B4XComboBox
	Private Panel1Main As B4XView
'	Private  BarChart2 As xChart
	Private CustomListView1recents As CustomListView
	Private Label1 As Label
'	Private Label2 As Label
	Private Label3time As Label
	Private Label4price As Label
	Private Label5separador As Label
	Private Panel1 As Panel
	Private Panel2 As Panel

	Private Label2leftMenu As B4XView
	Private Label2note As Label
	Private Panel2mov As Panel
	Private Label6Mybalance As Label
	Private Label7Totalout As Label
	Private Label5totalIn As Label
	Private Label2filter As Label
	
	Dim balancecardin As Double=0
	Dim balancecardout As Double=0
	Dim filename As String=""
	Dim Titolo_Report As String = "Riepilogo"
'	dim provider 
Dim palmo As PalmoHtmlToPdf

	Private mlc1  As MultiBarChart
	Dim carinfo As Object
	Dim nmrcard As String=""
	Dim scriptsql As String=""
End Sub

'java.lang.RuntimeException: java.lang.NumberFormatException: For input string: "Placeholder"
'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	palmo.Initialize("palmo")
	Root = Root1	
	Root.LoadLayout("Transaction")
	B4XComboBox1.cmbBox.Clear
	B4XComboBox1.cmbBox.add("all")
End Sub


Sub B4XPage_Appear
	Try
		
	
	Dim anno As Int = DateTime.GetYear(DateTime.Now)
	
	For i=2020 To (anno+2)
		B4XComboBox1.cmbBox.add(i)
	Next
'	B4XComboBox1.cmbBox.SelectedIndex=(anno-2019)
	Log(carinfo)
	Dim info() As Object=carinfo
	scriptsql ="SELECT * FROM transacaoo WHERE user = '"&Starter.GetIdUser&"' and card='"&info(0)&"' ORDER BY id DESC"	
'	Log(scriptsql)	
	Dim Cursor As Cursor
	Cursor = Starter.sql.ExecQuery("SELECT * FROM card WHERE id = '"&info(0)&"' ORDER BY id ASC limit 1")
	For i = 0 To Cursor.RowCount - 1
		Cursor.Position = i
		Log(Cursor.GetString("number"))
		
		Label2filter.Text="Solde de "&Cursor.GetString("number")
'		AS_CardSlider1.AddPage(CreateListCards(Cursor.GetString("number"),Cursor.GetString("id")),Cursor.GetString("id"))
	Next
	Log(balancecardout)
	
'	geral.ResetUserFontScale(Root)
	geral.SetStatusNavBarColor(0xFFF7F7F7,0xFF101114)
	geral.colordarkIconsStatusbar
	B4XComboBox1_SelectedIndexChanged(0)
'	getTrasitions(0)
	Catch
		Log(LastException)
	End Try
End Sub

 
Sub CreateLisCat(note As String, amount As Double,time As String, tipo As String) As B4XView
	Dim xui As XUI
	Dim p As B4XView  = xui.CreatePanel("")
	p.SetLayoutAnimated(0, 0, 0,100%x, 80dip)
	p.LoadLayout("card")
	
	Log(tipo)
	If tipo="in" Then			
		balancecardin=balancecardin+amount
		Label5totalIn.Text="+"&Starter.getMoeda&NumberFormat(balancecardin,2,2)
		geral.AdjustImageViewPanel(Panel2mov,"request.png")
		Label4price.Text="+"&Starter.getMoeda& amount		
	End If

	If tipo="out" Then		
		balancecardout=balancecardout+amount
		Label7Totalout.text="-"&Starter.getMoeda&NumberFormat( balancecardout,2,2)
		geral.AdjustImageViewPanel(Panel2mov,"sendicon.png")	
		Label4price.Text="-"&Starter.getMoeda&amount
	End If
	Label6Mybalance.Text=Starter.getMoeda&NumberFormat( (balancecardin-balancecardout),2,2)
	Label2note.TextColor=Colors.White
	Label4price.TextColor=Colors.White
	Label2note.Text=note	
	Label3time.Text=time
	Return p
End Sub





Sub getTrasitions
	Dim balancecard As Double=0
	 balancecardin =0
	 balancecardout=0
	Label5totalIn.Text=balancecardin
	Label7Totalout.text=balancecardout	 
	Label6Mybalance.Text=Starter.getMoeda&balancecard
	CustomListView1recents.Clear
	Dim Cursor As Cursor
	Cursor = Starter.sql.ExecQuery(scriptsql)
	For i = 0 To Cursor.RowCount - 1
		Cursor.Position = i		
		CustomListView1recents.Add(CreateLisCat(Cursor.GetString("nota"),Cursor.GetDouble("amount"),Cursor.GetString("data"),Cursor.GetString("tipo")),Array As Object(Cursor.GetString("id"),Cursor.GetString("tipo")))		
		balancecard=balancecard+Cursor.GetDouble("amount")	
	Next	
End Sub



Private Sub B4XComboBox1_SelectedIndexChanged (Index As Int)
	Try
		
	
	Dim info() As Object=carinfo
	If B4XComboBox1.SelectedItem="all" Then
		'scriptsql=	"SELECT * FROM transacaoo WHERE user = '"&Starter.GetIdUser&"' ORDER BY id DESC"	
		scriptsql=	"SELECT * FROM transacaoo WHERE user = '"&Starter.GetIdUser&"' and card='"&info(0)&"' ORDER BY data DESC"
		Titolo_Report="Riepilogo Transazioni"
		Else
		'scriptsql=	"SELECT * FROM transacaoo WHERE user = '"&Starter.GetIdUser&"' and ano='"&B4XComboBox1.SelectedItem&"' ORDER BY id DESC"
		scriptsql=	"SELECT * FROM transacaoo WHERE user = '"&Starter.GetIdUser&"' and ano='"&B4XComboBox1.SelectedItem&"' and card='"&info(0)&"' ORDER BY data DESC"
		Titolo_Report="Riepilogo Transazioni " & B4XComboBox1.SelectedItem
	End If
	
	
	Log(scriptsql)
	showChart
	getTrasitions
	
	Catch
		Log(LastException)
	End Try
End Sub

Private Sub Label2leftMenu_Click
	B4XPages.ClosePage(Me)
End Sub

Private Sub Label3noty_Click
	print'(id As Int)
End Sub

Sub print
	Dim inam As Double=0
	Dim outam As Double=0
	Dim sb As StringBuilder
	sb.Initialize
	Dim text2 As String=File.ReadString(File.DirAssets,"index.html")
	text2=text2.Replace("#title",Titolo_Report)
	Dim Cursor As Cursor
	Dim Testo_Movimento As String = ""
	Cursor = Starter.sql.ExecQuery(scriptsql)
	For i = 0 To Cursor.RowCount - 1
		Cursor.Position = i
		If Cursor.GetString("tipo")="in" Then
			Testo_Movimento="Versamento"
			inam=inam+Cursor.GetDouble("amount")
			Else
			Testo_Movimento="Prelievo"
			outam=outam+Cursor.GetDouble("amount")
		End If
		
		'sb.Append($"<tr><td>${Cursor.GetString("nota")}</td>	<td>${Cursor.GetString("data")}</td>	<td>${Starter.getMoeda&NumberFormat(Cursor.GetString("amount"),2,2)}</td>		<td>${Cursor.GetString("tipo")&""}</td>"$)
		sb.Append($"<tr><td>${Cursor.GetString("nota")}</td>	<td>${Cursor.GetString("data")}</td>	<td>${Starter.getMoeda&NumberFormat(Cursor.GetString("amount"),2,2)}</td>		<td>${Testo_Movimento &""}</td>"$)
	Next

	Log(sb.ToString)
	text2=text2.Replace("{in}",Starter.getMoeda&NumberFormat((inam),2,2))
	text2=text2.Replace("{total}",Starter.getMoeda&NumberFormat((inam-outam),2,2))
	text2=text2.Replace("{out}",Starter.getMoeda&NumberFormat((outam),2,2))	 
	text2=text2.Replace("#list",sb.ToString)
'	#if B4A
'	Dim jo As JavaObject = Me
'	jo.InitializeContext 'comment this line if calling this code from class
'	jo.RunMethod("zoom", Array(WV))
'#End If
	
	
	Dim Out As OutputStream
	Out = File.OpenOutput(File.DirInternal, "report.png", False)
	Root.Snapshot.WriteToStream(Out, 100, "PNG")
	Out.Close
	
	
'	Dim linktoimage As String= File.Combine(File.DirInternal, "report.png")
'	text2=text2.Replace("#img","<img src=" " & linktoimage & " ">")
	
	text2=text2.Replace("#img",$"<img src="${xui.FileUri(File.DirInternal, "report.png")}"/>"$)

	
'	text2=text2.Replace("#img",sb.ToString)
	Dim filename As String=Rnd(0,90)&"_report_Transactions.pdf"
	palmo.ConvertFromString(text2,File.DirInternal,filename)
	
	Log(text2)
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

Sub showChart	
	Dim textos As Int=Colors.Gray
	Dim inBar As Int=0xff3EDF82
	Dim outBar As Int=0xffDF3E60	
	mlc1.ChartDescription = ""
	mlc1.ChartDescriptionColor = textos
	mlc1.ChartDescriptionTextSize = 12
	mlc1.GridBackgroundColor = Colors.Transparent
	
	mlc1.LegendShapeSize = 10.0
	mlc1.setTheLegendPositionAndForm("BELOW_CHART_CENTER","CIRCLE")
	mlc1.TheLegendColor = textos
	mlc1.TheLegendTextSize = 10.0
	mlc1.LegendText = Array As String("Entrate", "Uscite", "2013", "2014", "2015")


	mlc1.ValueTextColor = Array As Int(inBar, outBar, Colors.White, Colors.Red, Colors.White)
	mlc1.ValueTextSize = Array As Float(12.0, 10.0, 14.0, 8.0, 16.0)
	mlc1.YaxisTextSize = 10.0
	mlc1.YaxisTextColor = textos
	
	

	' Declaração dos arrays para armazenar as entradas e saídas de cada mês
	Dim entradas(22) As Float
	Dim saidas(22) As Float

	' Inicialização dos arrays com 0
	For i = 0 To 12
		entradas(i) = 0
		saidas(i) = 0
	Next




	Dim Cursor As Cursor
	Cursor = Starter.sql.ExecQuery(scriptsql)

	For i = 0 To Cursor.RowCount - 1
		Cursor.Position = i
    
		Dim mes As Int
		mes = Cursor.GetInt("mes")-1
		Dim tipo As String
		tipo = Cursor.GetString("tipo")
		Dim amount As Double
		amount = Cursor.GetDouble("amount")
    
		If tipo = "in" Then
			entradas(mes) = entradas(mes) + amount
			Else If tipo = "out" Then
			saidas(mes) = saidas(mes) + amount
		End If
	Next



	mlc1.Chart_1_Data = entradas'Array As Float(1100.0, 550.0, 550.0, 300.0, 600.5, 445.0, 849.7, 50.4, 380.2, 345.0, 453.5, 783.7)
	'   We are going to draw 2 charts/graphs
	mlc1.Chart_2_Data = saidas'Array As Float(1200.0, 750.0, 450.0, 960.0, 730.0, 1100.0, 676.5, 985.6, 1010.8, 836.4, 498.5, 965.3)

	mlc1.DrawGraphValues = Array As Boolean(True, True, False, True, False)
	
	'   Maximum 5 colors to be passed ==> must be at least equal to the number of data sets that are passed i.e maximum 5
	'   If you pass only for eg 2 data sets then at least 2 colors need to be passed
	'   If more that 2 colors are passed with for eg only 2 data sets then only the first 2 colors will be used in the color array
	mlc1.LineColors = Array As Int(inBar, outBar, Colors.Blue, Colors.Green, Colors.Cyan)
	mlc1.GraphLineWidth = Array As Float(2.0, 2.0, 4.0, 5.0, 6.0)
	
	mlc1.XaxisTextColor = textos
	mlc1.XaxisTextSize = 9.0
	mlc1.XaxisLables = Array As String("Gen", "Feb", "Mar", "Apr", "Mag", "Giu", "Lug", "Ago", "Set", "Ott", "Nov", "Dic")
	'  TOP, BOTTOM, BOTH_SIDED, TOP_INSIDE, BOTTOM_INSIDE
	mlc1.XaxisLabelPosition = "BOTTOM"
	
	
	
	mlc1.YaxisMinVal = 0           'commented it out so that the scale will be set automatically
'	mlc1.YaxisMaxVal = 140          'commented it out so that the scale will be set automatically
'	mlc1.YaxisTextSize = 10.0
'	mlc1.YaxisTextColor = 0xff3EDF82
	mlc1.ShowYaxisRightLabels = False
	
	mlc1.CubicIntensity = Array As Float(0.1, 0.2, 0.3, 0.4, 0.5)
	mlc1.DrawCubicGraph = Array As Boolean(True, False, True, False, True)
	mlc1.DrawDashedLine = Array As Boolean(True, False, True, False, True)
	mlc1.MarkerToUse = 4
	
	mlc1.XAnimate = False
	mlc1.YAnimate = True
	mlc1.ChartAnimationTime = 100                     'milliseconds
	
	'   the number of charts to be drawn (maximum 5, in this case 2)
	'   the number of x-axis values per chart (in this case 12 = number of elements in the array passed to mlc1.XaxisLables)
	mlc1.setBarData(2,12)
'	flag = flag + 1
	'mlc1.s
	'End Sub
End Sub



Private Sub CustomListView1recents_ItemClick (Index As Int, Value As Object)
	Dim v() As Object=Value
	Log(v(0))
	Log(v(1))
	Dim Opzione1,Opzione2,Opzione3 As CSBuilder
	'cs.Initialize.Color(Colors.Red).Bold.Append(Chr(0xF014) &" Cancella").PopAll
	Opzione1.Initialize.Color(Colors.Black).Typeface(Typeface.FONTAWESOME).Append(Chr(0xF044) & " Modifica").PopAll
	Opzione2.Initialize.Color(Colors.Black).Typeface(Typeface.FONTAWESOME).Append(Chr(0xF02F) & " Stampa").PopAll
	Opzione3.Initialize.Color(Colors.Red).Bold.Typeface(Typeface.FONTAWESOME).Append(Chr(0xF014) &" Cancella").PopAll
	
'cs.Initialize.Append("Click in this icon: ").Typeface(Typeface.FONTAWESOME).Append(Chr(0xF055)).PopAll

	Dim options As List = Array(Opzione1,Opzione2, Opzione3)
	InputListAsync(options, "Operazione", -1, True)
	
	Wait For InputList_Result (Index As Int)
	If Index <> DialogResponse.CANCEL Then

		If Index=0 Then
			B4XPages.GetPage("mvm").As(MovmentMoney).idmov=v(0)
		B4XPages.GetPage("mp").As(menuPage).editinMoney
			B4XPages.GetPage("mp").As(menuPage).cards1
		End If
		
		If Index=1 Then
			B4XPages.GetPage("mp").As(menuPage).print(v(0))
		End If
		If Index=2 Then
			Msgbox2Async("Sei Sicuro di vole cancellare questo movimento?", "Cancella", "Si", "", "Annulla", Null, True)
			Wait For Msgbox_Result (Result As Int)
			If Result = DialogResponse.POSITIVE Then
				Starter.DeletetransacaooData(v(0))
				B4XPages.GetPage("mp").As(menuPage).cards1
			End If
			
		End If
		
	End If
End Sub