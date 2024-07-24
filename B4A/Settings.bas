B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12.75
@EndOfDesignText@

Sub Class_Globals
	Private Root As B4XView
	Private xui As XUI
	Private AS_Settings1 As AS_Settings
	Private Label1Titile As Label
End Sub

Public Sub Initialize
	
End Sub

'Chr(0xE1AE)

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	loadScreen
End Sub


Sub loadScreen
	Root.RemoveAllViews
	Root.LoadLayout("settings")
	AS_Settings1.AddGroup("Basic","Basic Settings")
	AS_Settings1.AddProperty_ComboBox("Basic","PropertyName_12","Currency","",AS_Settings1.FontToBitmap(Chr(0xE263),True,25,xui.Color_White),1,getCurrency)
'	AS_Settings1.AddProperty_ComboBox("Basic","PropertyName_14","Language","",AS_Settings1.FontToBitmap(Chr(0xE894),True,25,xui.Color_White),1,getLang)
'	AS_Settings1.AddGroup("Basic2","Advanced")
'	AS_Settings1.AddProperty_ActionClean("Basic2","PropertyName_6","Delete all data","",AS_Settings1.FontToBitmap(Chr(0xE92B),True,25,xui.Color_White))
	AS_Settings1.Create
End Sub


Sub B4XPage_Appear
	geral.SetStatusNavBarColor(Root.Color,Root.Color)
	geral.colorLightIconsStatusbar
End Sub

Sub getCurrency As List
	Dim l As List
	l.Initialize
	l.Clear
	l.Add(Starter.getMoeda)
	Log(Starter.getMoeda)
	Dim parser As JSONParser
	parser.Initialize(File.ReadString(File.DirAssets,"currencies.json"))
	Dim jroot As List = parser.NextArray
	For Each coljroot As Map In jroot
		Dim symbol As String = coljroot.Get("symbol")
		If symbol<>Starter.getMoeda Then
			l.Add(symbol)
		End If
	Next
	Return l
End Sub






Private Sub B4XPage_KeyboardStateChanged (Height As Float)	
	AS_Settings1.Base_Resize(Root.Width,Root.Height - Height)	
End Sub

Private Sub AS_Settings1_ValueChanged(Property As ASSettings_Property, Value As Object)
	Log("ValueChanged " & Property.PropertyName & ": " & Value)	
	
	If Property.PropertyName="PropertyName_14" Then
		
	End If
	
If Property.PropertyName="PropertyName_12" Then
		saveMoeda(Value)
	End If
End Sub


Sub saveMoeda(Moeda_Title As String)
	Log("Save: "&Moeda_Title)		
	File.WriteString(File.DirInternal,"coin", Moeda_Title&" ")
'	Starter.SQL.ExecNonQuery("DELETE FROM Moeda")	
'	Starter.SQL.ExecNonQuery2("INSERT INTO Moeda VALUES (?, ?,?)", Array As Object(Null," "&Moeda_Title,1))',Task_day,Task_startTime,Task_endtime,Task_Description,Task_money,mes,ano,priority))
Log(Starter.getMoeda)
End Sub

Private Sub AS_Settings1_ActionClicked(Property As ASSettings_Property)
	Log("ActionClicked: " & Property.PropertyName)	
	If Property.PropertyName="PropertyName_6" Then
		Msgbox2Async("Delete all data?", "", "Yes", "", "Cancel", Null, False)
		Wait For Msgbox_Result (Result As Int)
		If Result = DialogResponse.POSITIVE Then
			Starter.SQL.ExecNonQuery("DELETE FROM task where userId="&Starter.GetIdUser)		
			B4XPages.ShowPageAndRemovePreviousPages("hp")
		End If
	End If
	
	
	If Property.PropertyName = "PropertyName_4" Or Property.PropertyName = "PropertyName_5" Or Property.PropertyName = "PropertyName_7" Then
		'Shows an input box
		ShowInputBox(Property.Value,Property.PropertyName)
	End If
	
End Sub

Private Sub AS_Settings1_CustomDrawProperty(CustomDrawProperty As ASSettings_CustomDrawProperty)
	
	If CustomDrawProperty.Property.PropertyName = "PropertyName_6" Then
		CustomDrawProperty.PropertyViews.NameLabel.TextColor = xui.Color_ARGB(255,221, 95, 96)
		CustomDrawProperty.PropertyViews.IconImageView.SetBitmap(AS_Settings1.FontToBitmap(Chr(0xE92B),True,34,xui.Color_ARGB(255,221, 95, 96)))
	else If CustomDrawProperty.Property.PropertyName = "PropertyName_7" Then
		
		Dim ChipWidth As Float = 45dip
		Dim ChipHeight As Float = 20dip
		
		Dim xlbl_ProVersionChip As B4XView = CustomDrawProperty.PropertySettingViews.ActionValueLabel
		Dim xlbl_ActionButtonArrowLabel As B4XView = CustomDrawProperty.PropertySettingViews.ActionButtonArrowLabel
		xlbl_ProVersionChip.SetTextAlignment("CENTER","CENTER")
		xlbl_ProVersionChip.Font = xui.CreateDefaultBoldFont(15)
		xlbl_ProVersionChip.SetColorAndBorder(xui.Color_ARGB(255,81,190,97),0,0,ChipHeight/2)
		'Resize the Chip Label
		xlbl_ProVersionChip.SetLayoutAnimated(0,xlbl_ActionButtonArrowLabel.Left - ChipWidth - 5dip,CustomDrawProperty.PropertySettingViews.BackgroundPanel.Height/2 - ChipHeight/2,ChipWidth,ChipHeight)
	
	End If
	
End Sub


Private Sub ShowInputBox(DefaultText As String,PropertyName As String)
	Dim dialog As B4XDialog
	dialog.Initialize(Root)
	Dim input As B4XInputTemplate
	input.Initialize
	input.lblTitle.Text = "Title"
	input.Text = DefaultText
	Wait For (dialog.ShowTemplate(input, "OK", "", "CANCEL")) Complete (Result As Int)
	If Result = xui.DialogResponse_Positive Then
		AS_Properties.PutProperty(PropertyName,input.Text)
		AS_Settings1.Refresh
	End If
End Sub

Private Sub MenuBnt_Click
	B4XPages.ClosePage(Me)
End Sub