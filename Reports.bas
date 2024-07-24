B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12.5
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 
	Private B4XComboBox1 As B4XComboBox
	Private B4XComboBox2 As B4XComboBox
	Dim listmes As List	
	Dim palmo As PalmoHtmlToPdf	
	Dim filename As String=""
End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	
End Sub


Sub  B4XPage_Appear
'	Root.LoadLayout("SallPage")
'	load
	filename =Rnd(0,90)&"_report.pdf"
End Sub



Private Sub MenuBnt_Click
	B4XPages.ClosePage(Me)
End Sub

'
'Sub load	
'	B4XComboBox1.cmbBox.TextColor=Colors.White
'	B4XComboBox1.cmbBox.DropdownTextColor=Colors.White
'	B4XComboBox2.cmbBox.TextColor=Colors.White
'	B4XComboBox2.cmbBox.DropdownTextColor=Colors.White	
'	B4XComboBox1.cmbBox.DropdownBackgroundColor=0xffFF182843
'	B4XComboBox2.cmbBox.DropdownBackgroundColor=0xffFF182843	
'	B4XComboBox1.cmbBox.Clear
'	B4XComboBox2.cmbBox.Clear	
'	B4XComboBox1.cmbBox.add("===Select year===")
'	Dim Cursor As Cursor
'	Cursor = Main.SQL1.ExecQuery("SELECT DISTINCT TaskYear FROM task where userId='"&geral.getUserId&"' ORDER BY TaskYear ASC")
'	For i = 0 To Cursor.RowCount - 1
'		Cursor.Position = i
'		Dim year As String=Cursor.GetInt("TaskYear")
'		B4XComboBox1.cmbBox.add(year)
'	Next
'End Sub

'
'Private Sub B4XComboBox1_SelectedIndexChanged (Index As Int)	
'	Dim listmes As List
'	listmes.Initialize	
'	Dim value As String=B4XComboBox1.GetItem(Index)
'	Dim script As String="SELECT DISTINCT day FROM task where TaskYear='"&value&"' and userId='"&geral.getUserId&"' ORDER BY Task_ID DESC "
'	Log(script)
'	B4XComboBox2.cmbBox.Clear
'	Dim Cursor As Cursor
'	Cursor = Main.SQL1.ExecQuery(script)
'	For i = 0 To Cursor.RowCount - 1
'		Cursor.Position = i
'		Dim year As String=Cursor.GetString("day")
'		Dim l As List=DateUtils.GetMonthsNames
'		Dim partes() As String = Regex.Split("/", year)
'		Dim mes As String  = l.Get(partes(1)-1)
'		B4XComboBox2.cmbBox.add(mes)	
'		listmes.add(partes(1))
'	Next
'End Sub

'Private Sub Button1_Click
'	
'	
'	If B4XComboBox1.SelectedIndex=0 Then
'		Return
'	End If
'	
'	Dim sb As StringBuilder
'	sb.Initialize
'	palmo.Initialize("palmo")
'	Dim text2 As String
'	text2 = File.ReadString(File.DirAssets, "index.html")	
'	Dim dia As Int=listmes.Get(B4XComboBox2.SelectedIndex)
'	Dim ano As String=B4XComboBox1.SelectedItem
'	Dim script As String="SELECT * FROM task where TaskYear='"&ano&"' and userId='"&geral.getUserId&"' and Taskmouth='"&dia&"'  ORDER BY Task_ID DESC "
'	Log(script)
'	Dim Cursor As Cursor
'	Cursor = Main.SQL1.ExecQuery(script)
'	For i = 0 To Cursor.RowCount - 1
'		Cursor.Position = i								
'		Dim year As String=Cursor.GetString("day")
'		Dim Task_Title As String=Cursor.GetString("Task_Title")
'		Dim Taskmouth As String=Cursor.GetString("Taskmouth")
'		Dim startTimeM As String=Cursor.GetString("startTimeM")
'		Dim EndTimeM As String=Cursor.GetString("EndTimeM")
'		Dim startTimeP As String=Cursor.GetString("startTimeP")
'		Dim EndTimeP As String=Cursor.GetString("EndTimeP")
'		 
'		
'		Log(year)
'		Log(Task_Title)
'		Log(Taskmouth)
'		Dim soma As Float=geral.onlyMinutes2(startTimeM,EndTimeM)+geral.onlyMinutes2(startTimeP,EndTimeP)
'		sb.Append($"<tr><td>${year}</td>	<td>${startTimeM&"-"&EndTimeM}</td>	<td>${startTimeP&"-"&EndTimeP}</td>		<td>${NumberFormat(soma, 2 ,2)&" h"}</td>"$)
'	Next
'	
'	Dim year As String=Cursor.GetString("day")
'	Dim l As List=DateUtils.GetMonthsNames
'	Dim partes() As String = Regex.Split("/", year)
'	Dim mes As String  = l.Get(partes(1)-1)
'	Log(sb.ToString)
'	text2=text2.Replace("#list",sb.ToString)
'	text2=text2.Replace("#title","Report-"&mes&" "&ano)
'	text2=text2.Replace("--:-----:--","")
'	palmo.ConvertFromString(text2,File.DirInternal,filename)
'End Sub


 
Sub palmo_Finished (Success As Boolean)
	Log(Success)
	If Success Then
		Log("File saved successfully? " & Success)
		geral.ver(filename)
	Else
		Sleep(99)
		ProgressDialogHide
	End If
End Sub
