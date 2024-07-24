B4i=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=8.1
@EndOfDesignText@
#If Documentation
Conditional Symbols
-SETTINGS_SegmentedTab
-SETTINGS_PlusMinus

Updates
V1.00
	-Release
V1.01
	-AS_Settings
		-BugFixes
		-Add AddProperty_SegmentedTab - You can now add the AS_SegmentedTab
		-Add AddProperty_PlusMinus - You can now add the AS_PlusMinus
		-Add get ValueTypeTextProperties - Change the appearance of the text edits
		-Breaking Change - Add Description Property to all AddProperty_ functions
			-You can now display a short descripton to your properties
		-Add Designer Property ShowMadeWithLove - Shows the Made with Love in B4X Badge at the end of the list
			-Default: False
		-Add Designer Property MadeWithLoveTextColor - Text Color of the Made with Love Badge
			-Default: White
		-Add Designer Property BottomText - a custom text on the end of the list
			-Default: ""
		-Add Designer Property BottomTextTextColor
			-Default: White
	-AS_Properties
		-Add RemoveProperty - Removes a property from the db
		-Add ClearProperties - Clears all properties from the db
V1.02
	-AS_Properties
		-Breaking change - For the intern database i'm now using the KeyValueStore lib.
			-This means that all settings are reset by the update
		-ClearProperties renamed to DeleteAllProperties
		-Add get KeyValueStore
	-AS_Settings
		-BugFixes in Property_SegmentedTab
			-AS_SegmentedTab V1.18+ needed
		-Add AddProperty_Chooser - looks like an AddProperty_Text, but is a label with click event
		-Add Event ChooserTextFieldClicked - Is triggered when you click on an AddProperty_Chooser
		-Add AddProperty_Custom - Is a CustomDrawProperty field, the CustomDrawProperty event is triggered, there you can add your own layout
		-Add Event CustomDrawProperty - You can now add your custom property layout
		-Add CustomDrawProperty_Add - You can add any view with this function and It is automatically added to the layout, you don't have to worry about where to put it
		-Add CustomDrawProperty_AddChooser - A chooser view is created
		-Add CustomDrawProperty_AddText - A simple text item
V1.03
	-AS_Settings
		-Add ResetGroups - Removes the groups, so that you can fill the view with new groups, without the groups that were previously visible

	SegmentedTab, PlusMinus und dieses Example Projekt updaten wegen abhängikeiten
#End If

'-BreakingChange - AddProperty_Text has a new parameter "Format"

#DesignerProperty: Key: SaveMode, DisplayName: SaveMode, FieldType: String, DefaultValue: Automatic, List: Automatic|Manual

#DesignerProperty: Key: BackgroundColor, DisplayName: BackgroundColor, FieldType: Color, DefaultValue: 0xFF131416, Description: You can use the built-in color picker to find the color values.

#DesignerProperty: Key: GroupHeight, DisplayName: GroupHeight, FieldType: Int, DefaultValue: 50, MinRange: 0
#DesignerProperty: Key: GroupNameBackgroundColor, DisplayName: GroupNameBackgroundColor, FieldType: Color, DefaultValue: 0xFF131416, Description: You can use the built-in color picker to find the color values.

#DesignerProperty: Key: PropertyColor, DisplayName: PropertyColor, FieldType: Color, DefaultValue: 0xFF202125, Description: You can use the built-in color picker to find the color values.
#DesignerProperty: Key: CornerRadius, DisplayName: CornerRadius, FieldType: Int, DefaultValue: 10, MinRange: 0, MaxRange: 50
#DesignerProperty: Key: PropertyHeight, DisplayName: PropertyHeight, FieldType: Int, DefaultValue: 60, MinRange: 0
#DesignerProperty: Key: PropertySeperator, DisplayName: PropertySeperator, FieldType: Boolean, DefaultValue: True
#DesignerProperty: Key: PropertySeperatorColor, DisplayName: PropertySeperatorColor, FieldType: Color, DefaultValue: 0x28FFFFFF

#DesignerProperty: Key: SwitchThumbColor, DisplayName: SwitchThumbColor, FieldType: Color, DefaultValue: 0xFFFFFFFF, Description: You can use the built-in color picker to find the color values.
#DesignerProperty: Key: SwitchTrueColor, DisplayName: SwitchTrueColor, FieldType: Color, DefaultValue: 0xFF2D8879, Description: You can use the built-in color picker to find the color values.
#DesignerProperty: Key: SwitchFalseColor, DisplayName: SwitchFalseColor, FieldType: Color, DefaultValue: 0xFF3C4043, Description: You can use the built-in color picker to find the color values.

#IF SETTINGS_SegmentedTab
#DesignerProperty: Key: SegmentedTabBackgroundColor, DisplayName: SegmentedTabBackgroundColor, FieldType: Color, DefaultValue: 0xFF3D3C40, Description: You can use the built-in color picker to find the color values.
#DesignerProperty: Key: SegmentedTabSelectionColor, DisplayName: SegmentedTabSelectionColor, FieldType: Color, DefaultValue: 0xFF737278, Description: You can use the built-in color picker to find the color values.
#DesignerProperty: Key: SegmentedTabTextColor, DisplayName: SegmentedTabTextColor, FieldType: Color, DefaultValue: 0xFFFFFFFF, Description: You can use the built-in color picker to find the color values.
#DesignerProperty: Key: SegmentedTabShowSeperators, DisplayName: SegmentedTabShowSeperators, FieldType: Boolean, DefaultValue: False
#DesignerProperty: Key: SegmentedTabSeperatorsColor, DisplayName: SegmentedTabSeperatorsColor, FieldType: Color, DefaultValue: 0x50FFFFFF, Description: You can use the built-in color picker to find the color values.
#DesignerProperty: Key: SegmentedTabCornerRadius, DisplayName: SegmentedTabCornerRadius, FieldType: Int, DefaultValue: 5, MinRange: 0
#End If

#If SETTINGS_PlusMinus
#DesignerProperty: Key: PlusMinusBackgroundColor, DisplayName: PlusMinusBackgroundColor, FieldType: Color, DefaultValue: 0xFF3D3C40
#DesignerProperty: Key: PlusMinusTextColor, DisplayName: PlusMinusTextColor, FieldType: Color, DefaultValue: 0xFFFFFFFF
#DesignerProperty: Key: PlusMinusHaloColor, DisplayName: PlusMinusHaloColor, FieldType: Color, DefaultValue: 0x50FFFFFF
#DesignerProperty: Key: PlusMinusShowDivider, DisplayName: PlusMinusShowDivider, FieldType: Boolean, DefaultValue: True
#DesignerProperty: Key: PlusMinusDividerColor, DisplayName: PlusMinusDividerColor, FieldType: Color, DefaultValue: 0x50FFFFFF
#DesignerProperty: Key: PlusMinusCornerRadius, DisplayName: PlusMinusCornerRadius, FieldType: Int, DefaultValue: 10, MinRange: 0
#End If

#DesignerProperty: Key: HapticFeedback, DisplayName: HapticFeedback, FieldType: Boolean, DefaultValue: True

#DesignerProperty: Key: ShowMadeWithLove, DisplayName: ShowMadeWithLove, FieldType: Boolean, DefaultValue: False , Description: Shows the Made with love in B4X Badge on the end of the list
#DesignerProperty: Key: MadeWithLoveTextColor, DisplayName: MadeWithLoveTextColor, FieldType: Color, DefaultValue: 0xFFFFFFFF

#DesignerProperty: Key: BottomText, DisplayName: BottomText, FieldType: String, DefaultValue: , Description: Version 1.0.2
#DesignerProperty: Key: BottomTextTextColor, DisplayName: BottomTextTextColor, FieldType: Color, DefaultValue: 0xFFFFFFFF

#Event: ActionClicked(Property As ASSettings_Property)
#Event: ChooserTextFieldClicked(Property As ASSettings_Property)
#Event: ValueChanged(Property As ASSettings_Property, Value As Object)

#Event: CustomDrawProperty(CustomDrawProperty As ASSettings_CustomDrawProperty)

Sub Class_Globals
	
	Type ASSettings_Group(Key As String,Name As String,Properties As List)
	Type ASSettings_Property(PropertyName As String,DisplayName As String,Description As String,Icon As B4XBitmap,ValueType As String,Value As Object,DisplayValueText As String,ItemList As List,ItemMap As Map,ValueTypeTextProperties As ASSettings_ValueTypeTextProperties,ValueTypeSegmentedTabProperties As Object,ValueTypePlusMinusProperties As Object,isLast As Boolean,Group As ASSettings_Group)
	Type ASSettings_CustomDrawProperty(Group As ASSettings_Group,Property As ASSettings_Property,PropertyViews As ASSettings_PropertyViews,PropertySettingViews As ASSettings_PropertySettingViews)
	Type ASSettings_PropertyViews(RootBackgroundPanel As B4XView,LeftBackgroundPanel As B4XView,RightBackgroundPanel As B4XView,IconImageView As B4XView,NameLabel As B4XView)
	Type ASSettings_PropertySettingViews(BackgroundPanel As B4XView,ActionButtonArrowLabel As B4XView,ActionValueLabel As B4XView)
	
	Type ASSettings_BottomTextProperty(xFont As B4XFont,TextColor As Int)
	
	Type ASSettings_ValueTypeTextProperties(Width As Float,Height As Float,xFont As B4XFont,TextColor As Int,Color As Int,InputType As String,Format As String,CornerRadius As Float)
	#IF SETTINGS_SegmentedTab
	Type ASSettings_ValueTypeSegmentedTabProperties(Width As Float,CornerRadius As Float,ShowSeperators As Boolean,BackgroundColor As Int,SelectionColor As Int,SeperatorColor As Int,TextColor As Int,xFont As B4XFont)
	#End If
	#If SETTINGS_PlusMinus
	Type ASSettings_ValueTypePlusMinusProperties(CornerRadius As Float,ShowDivider As Boolean,BackgroundColor As Int,DividerColor As Int,HaloColor As Int,TextColor As Int,xFont As B4XFont,ShowHaloEffect As Boolean,MinValue As Int,MaxValue As Int,Increment As Int,Prefix As String,Suffix As String)
	#End If
		
	Private g_ValueTypeTextProperties As ASSettings_ValueTypeTextProperties
	Private g_BottomTextProperties As ASSettings_BottomTextProperty
	#IF SETTINGS_SegmentedTab
	Private g_ValueTypeSegmentedTabProperties As ASSettings_ValueTypeSegmentedTabProperties
	#End IF
	#If SETTINGS_PlusMinus
	Private g_ValueTypePlusMinusProperties As ASSettings_ValueTypePlusMinusProperties
	#End If
	
	Private mEventName As String 'ignore
	Private mCallBack As Object 'ignore
	Public mBase As B4XView
	Private xui As XUI 'ignore
	Public Tag As Object
	
	Private xclv_main As CustomListView
	Private isReady As Boolean = False
	
	Private lstGroups As List
	
	Private m_BackgroundColor As Int
	Private m_PropertyColor As Int
	Private m_Padding As Float = 10dip
	Private m_SwitchThumbColor As Int
	Private m_SwitchTrueColor As Int
	Private m_SwitchFalseColor As Int
	Private m_PropertySeperator As Boolean
	Private m_PropertySeperatorColor As Int
	Private m_CornerRadius As Int
	Private m_PropertyHeight As Float
	Private m_GroupHeight As Float
	Private m_GroupNameBackgroundColor As Int
	Private m_HapticFeedback As Boolean
	Private m_SaveMode As String
	Private m_ShowMadeWithLove As Boolean
	Private m_MadeWithLoveTextColor As Int
	Private m_BottomText As String

End Sub

Public Sub Initialize (Callback As Object, EventName As String)
	mEventName = EventName
	mCallBack = Callback
	lstGroups.Initialize
End Sub

'Base type must be Object
Public Sub DesignerCreateView (Base As Object, Lbl As Label, Props As Map)
	mBase = Base
    Tag = mBase.Tag
    mBase.Tag = Me 

	IniProps(Props)
	AS_Properties.Initialize
	xclv_main = ini_xclv("xclv_main",mBase,xui.IsB4J)
End Sub

Public Sub Base_Resize (Width As Double, Height As Double)
  
	mBase.Color = m_BackgroundColor
  
	xclv_main.AsView.SetLayoutAnimated(0,xclv_main.AsView.Left,xclv_main.AsView.Top,Width,Height)
	xclv_main.Base_Resize(Width,Height)
  
End Sub

Private Sub IniProps(Props As Map)
	
	m_BackgroundColor = xui.PaintOrColorToColor(Props.Get("BackgroundColor"))
	m_PropertyColor = xui.PaintOrColorToColor(Props.Get("PropertyColor"))
	m_SwitchThumbColor = xui.PaintOrColorToColor(Props.Get("SwitchThumbColor"))
	m_SwitchTrueColor = xui.PaintOrColorToColor(Props.Get("SwitchTrueColor"))
	m_SwitchFalseColor = xui.PaintOrColorToColor(Props.Get("SwitchFalseColor"))
	m_PropertySeperator = Props.Get("PropertySeperator")
	m_PropertySeperatorColor = xui.PaintOrColorToColor(Props.Get("PropertySeperatorColor"))
	m_CornerRadius = Props.Get("CornerRadius")
	m_PropertyHeight = DipToCurrent(Props.Get("PropertyHeight"))
	m_GroupNameBackgroundColor = xui.PaintOrColorToColor(Props.Get("GroupNameBackgroundColor"))
	m_GroupHeight = DipToCurrent(Props.Get("GroupHeight"))
	m_HapticFeedback = Props.Get("HapticFeedback")
	m_SaveMode = Props.GetDefault("SaveMode","Automatic")
	m_ShowMadeWithLove = Props.GetDefault("ShowMadeWithLove",False)
	m_MadeWithLoveTextColor = xui.PaintOrColorToColor(Props.GetDefault("MadeWithLoveTextColor",0xFFFFFFFF))
	m_BottomText = Props.GetDefault("BottomText","")
	
	g_ValueTypeTextProperties = CreateASSettings_ValueTypeTextProperties(mBase.Width/4,m_PropertyHeight/2,xui.CreateDefaultFont(18),xui.Color_White,xui.Color_ARGB(255,60, 64, 67),getInputType_Text,"",5dip)
	#IF SETTINGS_SegmentedTab
	g_ValueTypeSegmentedTabProperties = CreateASSettings_ValueTypeSegmentedTabProperties(0,diptocurrent(Props.GetDefault("SegmentedTabCornerRadius",5dip)),Props.GetDefault("SegmentedTabShowSeperators",False),xui.PaintOrColorToColor(Props.GetDefault("SegmentedTabBackgroundColor",0xFF3D3C40)),xui.PaintOrColorToColor(Props.GetDefault("SegmentedTabSelectionColor",0xFF737278)),xui.PaintOrColorToColor(Props.GetDefault("SegmentedTabSeperatorsColor",0x50FFFFFF)),xui.PaintOrColorToColor(Props.GetDefault("SegmentedTabTextColor",0xFFFFFFFF)),xui.CreateDefaultBoldFont(15))
	#End If
	#If SETTINGS_PlusMinus
	g_ValueTypePlusMinusProperties = CreateASSettings_ValueTypePlusMinusProperties(Props.GetDefault("PlusMinusCornerRadius",5dip),Props.GetDefault("PlusMinusShowDivider",True),xui.PaintOrColorToColor(Props.GetDefault("PlusMinusBackgroundColor",0xFF3D3C40)),xui.PaintOrColorToColor(Props.GetDefault("PlusMinusDividerColor",0x50FFFFFF)),xui.PaintOrColorToColor(Props.GetDefault("PlusMinusHaloColor",0x50FFFFFF)),xui.PaintOrColorToColor(Props.GetDefault("PlusMinusTextColor",0xFFFFFFFF)),xui.CreateDefaultFont(20),True)
	#End If
	
	g_BottomTextProperties = CreateASSettings_BottomTextProperty(xui.CreateDefaultFont(15),xui.PaintOrColorToColor(Props.GetDefault("BottomTextTextColor",0xFFFFFFFF)))
	
End Sub

Private Sub ini_xclv(EventName As String,Parent As B4XView,ShowScrollBar As Boolean) As CustomListView
	Dim tmplbl As Label
	tmplbl.Initialize("")
 
 	Dim clv As CustomListView
 
	Dim tmpmap As Map
	tmpmap.Initialize
	tmpmap.Put("DividerColor",0x00FFFFFF)
	tmpmap.Put("DividerHeight",0)
	tmpmap.Put("PressedColor",0x00FFFFFF)
	tmpmap.Put("InsertAnimationDuration",0)
	tmpmap.Put("ListOrientation","Vertical")
	tmpmap.Put("ShowScrollBar",xui.IsB4J)
	clv.Initialize(Me,EventName)
	clv.DesignerCreateView(Parent,tmplbl,tmpmap)

	#If B4I
	Do While clv.sv.IsInitialized = False
		'Sleep(0)
	Loop
	Dim sv As ScrollView = clv.sv
	sv.Color = xui.Color_Transparent'xui.Color_ARGB(255,32, 33, 37)
	#End If
	
	Return clv
	
End Sub

Public Sub AddGroup(Key As String,Name As String)
	
	Dim lst_Properties As List
	lst_Properties.Initialize
	
	Dim Group As ASSettings_Group = CreateASSettings_Group(Key,Name,lst_Properties)
	lstGroups.Add(Group)
	
End Sub

'<code>AS_Settings1.AddProperty_Boolean("General","PropertyName_1","Boolean Property True",Null,True)</code>
Public Sub AddProperty_Boolean(GroupKey As String,PropertyName As String,DisplayName As String,Description As String,Icon As B4XBitmap,DefaultValue As Boolean)
	
	Dim Group As ASSettings_Group = GetGroup(GroupKey)
	Dim lst_Properties As List = Group.Properties
	
	Dim Property As ASSettings_Property
	Property.Initialize
	Property.PropertyName = PropertyName
	Property.DisplayName = DisplayName
	Property.Description = Description
	Property.ValueType = getValueType_Boolean
	Property.Icon = Icon
	Property.ValueTypeTextProperties = g_ValueTypeTextProperties
	Property.Value = DefaultValue
	
	lst_Properties.Add(Property)
	
End Sub

Public Sub AddProperty_Text(GroupKey As String,PropertyName As String,DisplayName As String,Description As String,Icon As B4XBitmap,DefaultValue As Object,Width As Float,InputType As String)
	
	Dim Group As ASSettings_Group = GetGroup(GroupKey)
	Dim lst_Property As List = Group.Properties
	
	Dim Property As ASSettings_Property
	Property.Initialize
	Property.PropertyName = PropertyName
	Property.DisplayName = DisplayName
	Property.Description = Description
	Property.ValueType = getValueType_Text
	Property.Icon = Icon
	
	Dim ValueTypeTextProperties As ASSettings_ValueTypeTextProperties
	ValueTypeTextProperties.Initialize
	ValueTypeTextProperties.Width = Width
	ValueTypeTextProperties.Height = g_ValueTypeTextProperties.Height
	ValueTypeTextProperties.Color = g_ValueTypeTextProperties.Color
	ValueTypeTextProperties.TextColor = g_ValueTypeTextProperties.TextColor
	ValueTypeTextProperties.xFont = g_ValueTypeTextProperties.xFont
	ValueTypeTextProperties.CornerRadius = g_ValueTypeTextProperties.CornerRadius
	ValueTypeTextProperties.InputType = InputType
	'ValueTypeTextProperties.Format = Format
	Property.ValueTypeTextProperties = ValueTypeTextProperties
	Property.Value = DefaultValue
	
	lst_Property.Add(Property)
	
End Sub

Public Sub AddProperty_Action(GroupKey As String,PropertyName As String,DisplayName As String,Description As String,Icon As B4XBitmap,DefaultValue As Object)
	
	Dim Group As ASSettings_Group = GetGroup(GroupKey)
	Dim lst_Properties As List = Group.Properties
	
	Dim Property As ASSettings_Property
	Property.Initialize
	Property.PropertyName = PropertyName
	Property.DisplayName = DisplayName
	Property.Description = Description
	Property.ValueType = getValueType_Action
	Property.Icon = Icon
	Property.ValueTypeTextProperties = g_ValueTypeTextProperties
	Property.Value = DefaultValue
	
	lst_Properties.Add(Property)
	
End Sub

Public Sub AddProperty_ActionClean(GroupKey As String,PropertyName As String,DisplayName As String,Description As String,Icon As B4XBitmap)
	
	Dim Group As ASSettings_Group = GetGroup(GroupKey)
	Dim lst_Properties As List = Group.Properties
	
	Dim Property As ASSettings_Property
	Property.Initialize
	Property.PropertyName = PropertyName
	Property.DisplayName = DisplayName
	Property.Description = Description
	Property.ValueType = getValueType_ActionClean
	Property.Icon = Icon
	Property.ValueTypeTextProperties = g_ValueTypeTextProperties
	
	lst_Properties.Add(Property)
	
End Sub

Public Sub AddProperty_ComboBox(GroupKey As String,PropertyName As String,DisplayName As String,Description As String,Icon As B4XBitmap,DefaultValue As String,ItemList As List)
	
	Dim Group As ASSettings_Group = GetGroup(GroupKey)
	Dim lst_Properties As List = Group.Properties
	
	Dim Property As ASSettings_Property
	Property.Initialize
	Property.PropertyName = PropertyName
	Property.DisplayName = DisplayName
	Property.Description = Description
	Property.ValueType = getValueType_ComboBox
	Property.Icon = Icon
	Property.ItemList = ItemList
	Property.ValueTypeTextProperties = g_ValueTypeTextProperties
	Property.Value = DefaultValue
	
	lst_Properties.Add(Property)
	
End Sub

Public Sub AddProperty_Chooser(GroupKey As String,PropertyName As String,DisplayName As String,Description As String,Icon As B4XBitmap,DefaultValue As String,Width As Float) As ASSettings_Property
	
	Dim Group As ASSettings_Group = GetGroup(GroupKey)
	Dim lst_Properties As List = Group.Properties
	
	Dim Property As ASSettings_Property
	Property.Initialize
	Property.PropertyName = PropertyName
	Property.DisplayName = DisplayName
	Property.Description = Description
	Property.ValueType = getValueType_Chooser
	Property.Icon = Icon
	Property.ValueTypeTextProperties = g_ValueTypeTextProperties
	Property.Value = DefaultValue

	Dim ValueTypeTextProperties As ASSettings_ValueTypeTextProperties
	ValueTypeTextProperties.Initialize
	ValueTypeTextProperties.Width = Width
	ValueTypeTextProperties.Height = g_ValueTypeTextProperties.Height
	ValueTypeTextProperties.Color = g_ValueTypeTextProperties.Color
	ValueTypeTextProperties.TextColor = g_ValueTypeTextProperties.TextColor
	ValueTypeTextProperties.xFont = g_ValueTypeTextProperties.xFont
	ValueTypeTextProperties.CornerRadius = g_ValueTypeTextProperties.CornerRadius
	Property.ValueTypeTextProperties = ValueTypeTextProperties
	
	lst_Properties.Add(Property)
	
	Return Property
	
End Sub

'Add your own layout over the CustomDraw Event
Public Sub AddProperty_Custom(GroupKey As String,PropertyName As String,DisplayName As String,Description As String,Icon As B4XBitmap,DefaultValue As String)
	
	Dim Group As ASSettings_Group = GetGroup(GroupKey)
	Dim lst_Properties As List = Group.Properties
	
	Dim Property As ASSettings_Property
	Property.Initialize
	Property.PropertyName = PropertyName
	Property.DisplayName = DisplayName
	Property.Description = Description
	Property.ValueType = getValueType_Custom
	Property.Icon = Icon
	Property.Value = DefaultValue
	
	lst_Properties.Add(Property)
	
End Sub

#If SETTINGS_SegmentedTab
'Width: If 0 then the full width is used
'<code>AS_Settings1.AddProperty_SegmentedTab("Basic","PropertyName_1","Segmented Example 1",Null,1,CreateMap("Option 1":"Value1","Option 2":"Value2"),200dip)</code>
Public Sub AddProperty_SegmentedTab(GroupKey As String,PropertyName As String,DisplayName As String,Description As String,Icon As B4XBitmap,DefaultValue As String,ItemMap As Map,Width As Float)
	
	Dim Group As ASSettings_Group = GetGroup(GroupKey)
	Dim lst_Properties As List = Group.Properties
	
	Dim Property As ASSettings_Property
	Property.Initialize
	Property.PropertyName = PropertyName
	Property.DisplayName = DisplayName
	Property.Description = Description
	Property.ValueType = getValueType_SegmentedTab
	Property.Icon = Icon
	Property.ItemMap = ItemMap
	Property.ValueTypeTextProperties = g_ValueTypeTextProperties
	Property.Value = DefaultValue
	
	Dim ValueTypeSegmentedTabProperties As ASSettings_ValueTypeSegmentedTabProperties = g_ValueTypeSegmentedTabProperties
	ValueTypeSegmentedTabProperties.Width = Width

	Property.ValueTypeSegmentedTabProperties = ValueTypeSegmentedTabProperties
	
	lst_Properties.Add(Property)
	
End Sub

#End If

#If SETTINGS_PlusMinus
Public Sub AddProperty_PlusMinus(GroupKey As String,PropertyName As String,DisplayName As String,Description As String,Icon As B4XBitmap,DefaultValue As String,MinValue As Int,MaxValue As Int,Increment As Int,Prefix As String,Suffix As String)
	
	Dim Group As ASSettings_Group = GetGroup(GroupKey)
	Dim lst_Properties As List = Group.Properties
	
	Dim Property As ASSettings_Property
	Property.Initialize
	Property.PropertyName = PropertyName
	Property.DisplayName = DisplayName
	Property.Description = Description
	Property.ValueType = getValueType_PlusMinus
	Property.Icon = Icon
	Property.ValueTypeTextProperties = g_ValueTypeTextProperties
	Property.Value = DefaultValue
	
	Dim ValueTypePlusMinusProperties As ASSettings_ValueTypePlusMinusProperties
	ValueTypePlusMinusProperties.Initialize	
	ValueTypePlusMinusProperties.BackgroundColor = g_ValueTypePlusMinusProperties.BackgroundColor
	ValueTypePlusMinusProperties.CornerRadius = g_ValueTypePlusMinusProperties.CornerRadius
	ValueTypePlusMinusProperties.DividerColor = g_ValueTypePlusMinusProperties.DividerColor
	ValueTypePlusMinusProperties.HaloColor = g_ValueTypePlusMinusProperties.HaloColor
	ValueTypePlusMinusProperties.ShowDivider = g_ValueTypePlusMinusProperties.ShowDivider
	ValueTypePlusMinusProperties.ShowHaloEffect = g_ValueTypePlusMinusProperties.ShowHaloEffect
	ValueTypePlusMinusProperties.TextColor = g_ValueTypePlusMinusProperties.TextColor
	ValueTypePlusMinusProperties.xFont = g_ValueTypePlusMinusProperties.xFont
	
	ValueTypePlusMinusProperties.MinValue = MinValue
	ValueTypePlusMinusProperties.MaxValue = MaxValue
	ValueTypePlusMinusProperties.Increment = Increment
	ValueTypePlusMinusProperties.Prefix = Prefix
	ValueTypePlusMinusProperties.Suffix = Suffix
	Property.ValueTypePlusMinusProperties = ValueTypePlusMinusProperties
	
	lst_Properties.Add(Property)
	
End Sub
#End If

'Removes the groups, so that you can fill the view with new groups, without the groups that were previously visible
Public Sub ResetGroups	
	lstGroups.Clear
End Sub

Public Sub Create
	
	xclv_main.Clear
	
	For Each Group As ASSettings_Group In lstGroups
		
		AddGroup2List(Group)

	Next
	
	If m_ShowMadeWithLove Then
		AddMadeWithLove
	End If
	
	If m_BottomText <> "" Then
		AddBottomText
	End If
	
	Dim xpnl_Placeholder As B4XView = xui.CreatePanel("")
	xpnl_Placeholder.Color = m_BackgroundColor
	xpnl_Placeholder.SetLayoutAnimated(0,0,0,mBase.Width,20dip)
	#If B4I
	xpnl_Placeholder.Height = xpnl_Placeholder.Height + 60dip
	#End If
	xclv_main.Add(xpnl_Placeholder,"")
	
	XUIViewsUtils.AddStubToCLVIfNeeded(xclv_main, m_BackgroundColor)
	
	Sleep(500)
	isReady = True
	
End Sub

Private Sub AddBottomText
	
	Dim xpnl_Background As B4XView = xui.CreatePanel("")
	xpnl_Background.Color = m_BackgroundColor
	
	Dim xlbl As B4XView = CreateLabel("")
	xlbl.Width = mBase.Width
	xlbl.Text = m_BottomText
	xlbl.Font = g_BottomTextProperties.xFont
		#If B4I
	xlbl.As(Label).Multiline = True
	#Else If B4J
	xlbl.As(Label).WrapText = True
	#Else B4A
	xlbl.As(Label).SingleLine = False
	#End If
	
	xpnl_Background.SetLayoutAnimated(0,0,0,mBase.Width,MeasureMultilineTextHeight(xlbl) + 10dip)
	
	xclv_main.Add(xpnl_Background,"BottomText")
	
End Sub

Private Sub AddInternBottomText(xpnl_Background As B4XView)
	
	Dim xlbl As B4XView = CreateLabel("")
	xlbl.Width = mBase.Width
	xlbl.Text = m_BottomText
	xlbl.Font = g_BottomTextProperties.xFont
	xlbl.SetTextAlignment("CENTER","CENTER")
	xlbl.TextColor = g_BottomTextProperties.TextColor
			#If B4I
	xlbl.As(Label).Multiline = True
	#Else If B4J
	xlbl.As(Label).WrapText = True
	#Else B4A
	xlbl.As(Label).SingleLine = False
	#End If
	
	Dim LabelHeight As Float = MeasureMultilineTextHeight(xlbl)
	
	xpnl_Background.AddView(xlbl,0,xpnl_Background.Height/2 - LabelHeight/2,mBase.Width,LabelHeight)
	'xpnl_Background.Color = xui.Color_Red
	
End Sub

Private Sub AddMadeWithLove
	
	Dim xpnl_Background As B4XView = xui.CreatePanel("")
	xpnl_Background.Color = m_BackgroundColor
	xpnl_Background.SetLayoutAnimated(0,0,0,mBase.Width,40dip)
	
	xclv_main.Add(xpnl_Background,"MadeWithLove")
	
End Sub

Private Sub AdInternMadeWithLove(xpnl_Background As B4XView)
	Dim xpnl_MadeWithLoveBackground As B4XView = xui.CreatePanel("")
	xpnl_MadeWithLoveBackground.SetLayoutAnimated(0,0,xpnl_Background.Height/2 - 20dip/2,mBase.Width,20dip)
	
	Dim xlbl_MadeWithLove As B4XView = CreateLabel("")
	xlbl_MadeWithLove.TextColor = m_MadeWithLoveTextColor
	xlbl_MadeWithLove.Font = xui.CreateDefaultFont(15)
	
	Dim MadeWithLoveBadge As MadeWithLove
	MadeWithLoveBadge.Initialize(Me,"MadeWithLove")
	
	MadeWithLoveBadge.DesignerCreateView(xpnl_MadeWithLoveBackground,xlbl_MadeWithLove,CreateMap())
	
	xpnl_Background.AddView(xpnl_MadeWithLoveBackground,0,xpnl_MadeWithLoveBackground.Top,mBase.Width,xpnl_MadeWithLoveBackground.Height)

	'xpnl_Background.Color = xui.Color_Blue
End Sub

Private Sub AddGroup2List(Group As ASSettings_Group)
	
	Dim Height As Float = m_GroupHeight
	Dim xpnl_Group As B4XView = xui.CreatePanel("")
	xpnl_Group.SetLayoutAnimated(0,0,0,mBase.Width,Height)
	xpnl_Group.Color = m_BackgroundColor
	xclv_main.Add(xpnl_Group,Group)
	
	Dim Properties As List = Group.Properties
	
	AddGroupBorder2List(True)
	For i = 0 To Properties.Size -1
		Dim Property As ASSettings_Property = Properties.Get(i)
		Property.Group = Group
		Property.isLast = IIf(i = Properties.Size -1,True,False)
		'AddInternProperty(Group,Property,IIf(i = Properties.Size -1,True,False))
		AddProperty2List(Property)
	Next
	AddGroupBorder2List(False)
	
End Sub

Private Sub AddProperty2List(Property As ASSettings_Property)
	
	Dim xpnl_Background As B4XView = xui.CreatePanel("")
	xpnl_Background.SetLayoutAnimated(0,0,0,mBase.Width,m_PropertyHeight)
	xpnl_Background.Color = m_BackgroundColor
	
	If Property.Description <> "" Then

		Dim Gap As Float = 5dip

		Dim xlbl_Name As B4XView = CreateLabel("")
		xlbl_Name.Font = xui.CreateDefaultBoldFont(18)
		xlbl_Name.Text = Property.DisplayName
		xlbl_Name.Width = mBase.Width/2 - Gap
			#If B4I
		xlbl_Name.As(Label).Multiline = True
	#Else If B4J
	xlbl_Name.As(Label).WrapText = True
	#Else B4A
	xlbl_Name.As(Label).SingleLine = False
	#End If
		
		Dim xlbl_Description As B4XView = CreateLabel("")
		xlbl_Description.Font = xui.CreateDefaultFont(15)
		xlbl_Description.Text = Property.Description
		xlbl_Description.Width = mBase.Width/2 - Gap
			#If B4I
		xlbl_Description.As(Label).Multiline = True
	#Else If B4J
	xlbl_Description.As(Label).WrapText = True
	#Else B4A
	xlbl_Description.As(Label).SingleLine = False
	#End If

		Dim NameHeight As Float = MeasureMultilineTextHeight(xlbl_Name) + IIf(xui.IsB4A,xlbl_Name.Font.Size + 5dip,0)
		Dim DescriptionHeight As Float = MeasureMultilineTextHeight(xlbl_Description) + IIf(xui.IsB4A,xlbl_Description.Font.Size + 5dip,0)
		
		If NameHeight + DescriptionHeight >= m_PropertyHeight Then
			xpnl_Background.Height = NameHeight + DescriptionHeight + 10dip
		End If
		
	End If
	
	xclv_main.Add(xpnl_Background,Property)
	
End Sub

Private Sub AddInternGroup(xpnl_Group As B4XView,Group As ASSettings_Group)
		
	Dim Height As Float = m_GroupHeight
	
	Dim xlbl_GroupName As B4XView = CreateLabel("")
	xlbl_GroupName.Text = Group.Name
	xlbl_GroupName.Font = xui.CreateDefaultBoldFont(20)
	xlbl_GroupName.TextColor = xui.Color_White
	xlbl_GroupName.SetTextAlignment("CENTER","LEFT")
	xpnl_Group.Color = m_GroupNameBackgroundColor
		
	xpnl_Group.AddView(xlbl_GroupName,m_Padding,0,mBase.Width - (m_Padding*2),Height)
		
End Sub

Private Sub AddInternProperty(xpnl_Background As B4XView,Property As ASSettings_Property)
	
	Dim Gap As Float = 5dip
	
	Dim xpnl_Property As B4XView = xui.CreatePanel("")
	xpnl_Background.AddView(xpnl_Property,m_Padding,0,mBase.Width - (m_Padding*2),xpnl_Background.Height)
	#if b4j
	xpnl_Property.Width = xpnl_Property.Width - 20dip
	#End If
	xpnl_Property.Color = m_PropertyColor
	Dim xlbl_PropertyName As B4XView = CreateLabel("")
	xlbl_PropertyName.Text = Property.DisplayName
	xlbl_PropertyName.Font = xui.CreateDefaultBoldFont(18)
	xlbl_PropertyName.TextColor = xui.Color_White
	xlbl_PropertyName.SetTextAlignment("CENTER","LEFT")
	#If B4I
	xlbl_PropertyName.As(Label).Multiline = True
	#Else If B4J
	xlbl_PropertyName.As(Label).WrapText = True
	#Else B4A
	xlbl_PropertyName.As(Label).SingleLine = False
	#End If
		
	xpnl_Property.AddView(xlbl_PropertyName,m_Padding,0,xpnl_Property.Width/2 - Gap,xpnl_Background.Height)
	
	If Property.Description <> "" Then
		Dim xlbl_Description As B4XView = CreateLabel("")
		xlbl_Description.Text = Property.Description
		xlbl_Description.Font = xui.CreateDefaultFont(15)
		xlbl_Description.TextColor = xui.Color_ARGB(152,255,255,255)
		xlbl_Description.SetTextAlignment("TOP","LEFT")
	#If B4I
		xlbl_Description.As(Label).Multiline = True
	#Else If B4J
		xlbl_Description.As(Label).WrapText = True
	#Else B4A
	xlbl_Description.As(Label).SingleLine = False
	#End If
		
		xlbl_PropertyName.SetTextAlignment("TOP","LEFT")
		xlbl_PropertyName.Height = MeasureTextHeight(xlbl_PropertyName.Text,xlbl_PropertyName.Font) + 5dip
		
		xpnl_Property.AddView(xlbl_Description,m_Padding,xlbl_PropertyName.Height,xpnl_Property.Width/2 - Gap,xpnl_Background.Height - xlbl_PropertyName.Height)
		
	End If
		
	Dim xpnl_PropertyBackground As B4XView = xui.CreatePanel("")
	xpnl_PropertyBackground.Color = xui.Color_Transparent
	xpnl_Property.AddView(xpnl_PropertyBackground,xpnl_Property.Width/2,0,xpnl_Property.Width/2,xpnl_Property.Height)
		
	Dim xiv_Icon As B4XView = CreateImageView("")
	If Property.Icon.IsInitialized Then
		
		xpnl_Property.AddView(xiv_Icon,m_Padding,(xpnl_Background.Height)/2 - ((xpnl_Background.Height)/2)/2,(xpnl_Background.Height)/2,(xpnl_Background.Height)/2)
		xlbl_PropertyName.Left = xiv_Icon.Left + xiv_Icon.Width + 5dip
		xlbl_PropertyName.Width = xlbl_PropertyName.Width - xiv_Icon.Width - 5dip
		xiv_Icon.SetBitmap(Property.Icon)
	End If
		
	If m_PropertySeperator And Property.isLast = False Then
		
		Dim xpnl_PropertySeperator As B4XView = xui.CreatePanel("")
		xpnl_PropertySeperator.Color = m_PropertySeperatorColor
		xpnl_Property.AddView(xpnl_PropertySeperator,m_Padding,xpnl_Property.Height - 1dip,xpnl_Property.Width - m_Padding,1dip)
		
	End If
		
	Dim PropertySettingViews As ASSettings_PropertySettingViews
	PropertySettingViews.Initialize
		
	If Property.ValueType <> getValueType_Boolean Then
		If m_SaveMode = getSaveMode_Automatic Then
			Dim Value As Object = AS_Properties.GetProperty(Property.PropertyName)
			Dim DisplayValueText As Object = AS_Properties.GetPropertyDisplayValueText(Property.PropertyName)
			Property.Value = IIf(Value = Null,Property.Value,Value)
			Property.DisplayValueText = IIf(DisplayValueText = Null,"",DisplayValueText)
		End If
	End If
		
	Select Property.ValueType
		Case getValueType_Boolean
			
			If m_SaveMode = getSaveMode_Automatic Then
				Dim Value As Object = AS_Properties.GetProperty(Property.PropertyName)
				'Property.Value = IIf(Value = Null,Property.Value,IIf(0 = Value,False,True))
				Property.Value = IIf(Value = Null,Property.Value,Value)
			End If
			
			Dim SwitchWidth As Float = 55dip
			Dim SwitchHeight As Float = 31dip
			
			Dim Switch As B4XSwitch
			Switch.Initialize(Me,"SwitchBoolean")
			
			Dim mSwitchProperties As Map
			mSwitchProperties.Initialize
			mSwitchProperties.Put("Value",Property.Value)
			mSwitchProperties.Put("OnColor",m_SwitchTrueColor)
			mSwitchProperties.Put("OffColor",m_SwitchFalseColor)
			mSwitchProperties.Put("ThumbColor",m_SwitchThumbColor)
			mSwitchProperties.Put("HapticFeedback",m_HapticFeedback)
			
			Dim xpnl_SwitchBase As B4XView = xui.CreatePanel("")
			xpnl_PropertyBackground.AddView(xpnl_SwitchBase,xpnl_PropertyBackground.Width - SwitchWidth - 10dip,xpnl_PropertyBackground.Height/2 - SwitchHeight/2,SwitchWidth,SwitchHeight)
			
			Switch.DesignerCreateView(xpnl_SwitchBase,CreateLabel(""),mSwitchProperties)
			
		Case getValueType_Action, getValueType_ActionClean
			
			Dim xpnl_ActionClickPanel As B4XView = xui.CreatePanel("xpnl_ActionClickPanel")
			xpnl_ActionClickPanel.Color = xui.Color_Transparent
			xpnl_PropertyBackground.AddView(xpnl_ActionClickPanel,0,0,xpnl_Property.Width,xpnl_Property.Height)
			
			If Property.ValueType = getValueType_Action Then
				Dim ActionIconWidth As Float = 30dip
				Dim ActionIconHeight As Float = xpnl_PropertyBackground.Height/2
				Dim xlbl_ActionIcon As B4XView = CreateLabel("")
				xlbl_ActionIcon.Text = Chr(0xE315)
				xlbl_ActionIcon.Font = xui.CreateMaterialIcons(24)
				xlbl_ActionIcon.TextColor = xui.Color_ARGB(152,255,255,255)
				xpnl_PropertyBackground.AddView(xlbl_ActionIcon,xpnl_Property.Width - ActionIconWidth/2-ActionIconWidth/2,xpnl_Property.Height/2 - ActionIconHeight/2,ActionIconWidth,ActionIconHeight)
			
				Dim xlbl_ActionValue As B4XView = CreateLabel("")
				xlbl_ActionValue.Text = Property.Value
				xlbl_ActionValue.Font = xui.CreateDefaultFont(15)
				xlbl_ActionValue.TextColor = xui.Color_White
				xlbl_ActionValue.SetTextAlignment("CENTER","RIGHT")
			#If B4I
				xlbl_ActionValue.As(Label).Multiline = True
				#Else If B4J
				xlbl_ActionValue.As(Label).WrapText = True
			#End If
				xpnl_PropertyBackground.AddView(xlbl_ActionValue,xpnl_Property.Width/2 + Gap,0,xlbl_ActionIcon.Left - xpnl_Property.Width/2 - Gap*2,xpnl_Property.Height)
			
			#If B4J
				xlbl_ActionIcon.As(JavaObject).RunMethod("setMouseTransparent",Array As Object(True))
				xlbl_ActionValue.As(JavaObject).RunMethod("setMouseTransparent",Array As Object(True))
			#End If
			
			End If
			xpnl_PropertyBackground.Left = 0
			xpnl_PropertyBackground.Width = xpnl_Property.Width
			
			PropertySettingViews.ActionButtonArrowLabel = xlbl_ActionIcon
			PropertySettingViews.ActionValueLabel = xlbl_ActionValue
			
		Case getValueType_Chooser
			
			Dim xlbl_TextField As B4XView = CreateLabel("xlbl_TextField")
			xlbl_TextField.SetColorAndBorder(Property.ValueTypeTextProperties.Color,0,0,Property.ValueTypeTextProperties.CornerRadius)
			xlbl_TextField.Font = Property.ValueTypeTextProperties.xFont
			xlbl_TextField.SetTextAlignment("CENTER","CENTER")
			If Property.DisplayValueText = "" Then
				xlbl_TextField.Text = Property.Value
			Else
				xlbl_TextField.Text = Property.DisplayValueText
			End If
			xlbl_TextField.Tag = Property.ValueTypeTextProperties
			xlbl_TextField.TextColor = Property.ValueTypeTextProperties.TextColor
			
			If Property.ValueTypeTextProperties.Width = 0 Then
				Property.ValueTypeTextProperties.Width = xpnl_Property.Width/2 - m_Padding
			End If
			
			xpnl_PropertyBackground.AddView(xlbl_TextField,xpnl_PropertyBackground.Width - Property.ValueTypeTextProperties.Width - m_Padding,xpnl_PropertyBackground.Height/2 - Property.ValueTypeTextProperties.Height/2,Property.ValueTypeTextProperties.Width,Property.ValueTypeTextProperties.Height)
		
		Case getValueType_Text
			
			Dim xtf_TextBox As B4XView = CreateEditText("xtf_TextBox",Property.ValueTypeTextProperties.InputType)
			xtf_TextBox.TextColor = Property.ValueTypeTextProperties.TextColor
			xtf_TextBox.SetColorAndBorder(Property.ValueTypeTextProperties.Color,0,0,Property.ValueTypeTextProperties.CornerRadius)
			xtf_TextBox.Font = Property.ValueTypeTextProperties.xFont
			xtf_TextBox.SetTextAlignment("CENTER","CENTER")
			xtf_TextBox.Text = Property.Value
			xtf_TextBox.Tag = Property.ValueTypeTextProperties
			xpnl_PropertyBackground.AddView(xtf_TextBox,xpnl_PropertyBackground.Width - Property.ValueTypeTextProperties.Width - m_Padding,xpnl_PropertyBackground.Height/2 - Property.ValueTypeTextProperties.Height/2,Property.ValueTypeTextProperties.Width,Property.ValueTypeTextProperties.Height)
		
		#If SETTINGS_SegmentedTab
		Case getValueType_SegmentedTab
			
			Dim ValueTypeSegmentedTabProperties As ASSettings_ValueTypeSegmentedTabProperties = Property.ValueTypeSegmentedTabProperties
			
			Dim xpnl_SegmentedTabBackground As B4XView = xui.CreatePanel("")
			xpnl_PropertyBackground.AddView(xpnl_SegmentedTabBackground,IIf(ValueTypeSegmentedTabProperties.Width = 0,Gap,xpnl_PropertyBackground.Width-ValueTypeSegmentedTabProperties.Width - Gap),xpnl_PropertyBackground.Height/2 - (xpnl_PropertyBackground.Height/2)/2,IIf(ValueTypeSegmentedTabProperties.Width = 0,xpnl_PropertyBackground.Width - Gap*2,ValueTypeSegmentedTabProperties.Width),xpnl_PropertyBackground.Height/2)
			
			Dim SegmentedTab As ASSegmentedTab
			SegmentedTab.Initialize(Me,"SegmentedTab")
			
			Dim mSegmentedTab As Map
			mSegmentedTab.Initialize
			mSegmentedTab.Put("CornerRadiusBackground",ValueTypeSegmentedTabProperties.CornerRadius)
			mSegmentedTab.Put("CornerRadiusSelectionPanel",ValueTypeSegmentedTabProperties.CornerRadius)
			mSegmentedTab.Put("PaddingSelectionPanel",0)
			mSegmentedTab.Put("ShowSeperators",ValueTypeSegmentedTabProperties.ShowSeperators)
			mSegmentedTab.Put("BackgroundColor",ValueTypeSegmentedTabProperties.BackgroundColor)
			mSegmentedTab.Put("SelectionColor",ValueTypeSegmentedTabProperties.SelectionColor)
			mSegmentedTab.Put("SeperatorColor",ValueTypeSegmentedTabProperties.SeperatorColor)
			mSegmentedTab.Put("TextColor",ValueTypeSegmentedTabProperties.TextColor)
			
			SegmentedTab.DesignerCreateView(xpnl_SegmentedTabBackground,CreateLabel(""),mSegmentedTab)
		
			SegmentedTab.ItemTextProperties.TextFont = ValueTypeSegmentedTabProperties.xFont
			
			SegmentedTab.CornerRadiusBackground = ValueTypeSegmentedTabProperties.CornerRadius
			SegmentedTab.CornerRadiusSelectionPanel = ValueTypeSegmentedTabProperties.CornerRadius
			SegmentedTab.AutoDecreaseTextSize = True
			
			For Each k As String In Property.ItemMap.Keys
				SegmentedTab.AddTab2(k,Null,Property.ItemMap.Get(k))
			Next
			
			For i = 0 To SegmentedTab.Size -1
				Dim SegTab As ASSegmentedTab_Tab = SegmentedTab.GetTab(i)
				If SegTab.Value = Property.Value Then
					SegmentedTab.Index = i
					Exit
				End If
			Next
			
	
			'SegmentedTab.RefreshTabs
			
		#End If
		#If SETTINGS_PlusMinus

		Case getValueType_PlusMinus
			
			Dim Width As Float = 110dip
			
			Dim ValueTypePlusMinusProperties As ASSettings_ValueTypePlusMinusProperties = Property.ValueTypePlusMinusProperties
			
			Dim xpnl_PlusMinusBackground As B4XView = xui.CreatePanel("")
			xpnl_PropertyBackground.AddView(xpnl_PlusMinusBackground,IIf(Width = 0,Gap,xpnl_PropertyBackground.Width-Width - Gap),xpnl_PropertyBackground.Height/2-40dip/2,IIf(Width = 0,xpnl_PropertyBackground.Width - Gap*2,Width),40dip)
			
			Dim PlusMinus As AS_PlusMinus
			PlusMinus.Initialize(Me,"PlusMinus")
			
			Dim mPlusMinus As Map
			mPlusMinus.Initialize
			mPlusMinus.Put("MinusText","-")
			mPlusMinus.Put("PlusText","+")
			mPlusMinus.Put("Round",False)
			mPlusMinus.Put("CornerRadius",ValueTypePlusMinusProperties.CornerRadius)
			mPlusMinus.Put("BackgroundColor",ValueTypePlusMinusProperties.BackgroundColor)
			mPlusMinus.Put("MinusColor",ValueTypePlusMinusProperties.BackgroundColor)
			mPlusMinus.Put("MinusTextColor",ValueTypePlusMinusProperties.TextColor)
			mPlusMinus.Put("PlusColor",ValueTypePlusMinusProperties.BackgroundColor)
			mPlusMinus.Put("PlusTextColor",ValueTypePlusMinusProperties.TextColor)
			mPlusMinus.Put("Divider",ValueTypePlusMinusProperties.ShowDivider)
			mPlusMinus.Put("DividerColor",ValueTypePlusMinusProperties.DividerColor)
			mPlusMinus.Put("HaloEffect",ValueTypePlusMinusProperties.ShowHaloEffect)
			mPlusMinus.Put("HaloColor",ValueTypePlusMinusProperties.HaloColor)
			mPlusMinus.Put("HapticFeedback",m_HapticFeedback)
			
			PlusMinus.DesignerCreateView(xpnl_PlusMinusBackground,CreateLabel(""),mPlusMinus)
			
			PlusMinus.lblMinus.Font = ValueTypePlusMinusProperties.xFont
			PlusMinus.lblPlus.Font = ValueTypePlusMinusProperties.xFont
			
			PlusMinus.Tag = ValueTypePlusMinusProperties
			
			Dim xlbl_Value As B4XView = CreateLabel("")
			xlbl_Value.TextColor = xui.Color_White
			xlbl_Value.Font = xui.CreateDefaultFont(15)
			xlbl_Value.SetTextAlignment("CENTER","RIGHT")
			xlbl_Value.Text = ValueTypePlusMinusProperties.Prefix &  Property.Value & ValueTypePlusMinusProperties.Suffix

			
			Dim ValueWidth As Float = MeasureTextWidth(xlbl_Value.Text,xlbl_Value.Font) +2dip

			xpnl_PropertyBackground.AddView(xlbl_Value,xpnl_PlusMinusBackground.Left - ValueWidth - 10dip,0,ValueWidth,xpnl_PropertyBackground.Height)

		#End If
		Case getValueType_ComboBox
				
			Dim ActionIconWidth As Float = 30dip
			Dim ActionIconHeight As Float = xpnl_PropertyBackground.Height/2
			
			Dim xlbl_ComboBoxIcon_Up As B4XView = CreateLabel("")
			xlbl_ComboBoxIcon_Up.Text = Chr(0xE316)
			xlbl_ComboBoxIcon_Up.Font = xui.CreateMaterialIcons(24)
			xlbl_ComboBoxIcon_Up.TextColor = xui.Color_ARGB(152,255,255,255)
			
			Dim IconHeight As Float = 20dip'MeasureTextHeight("T",xui.CreateDefaultBoldFont(15))
			
			xpnl_PropertyBackground.AddView(xlbl_ComboBoxIcon_Up,xpnl_PropertyBackground.Width - ActionIconWidth/2-ActionIconWidth/2,xpnl_PropertyBackground.Height/2-IconHeight,ActionIconWidth,IconHeight)
				
			Dim xlbl_ComboBoxIcon_Down As B4XView = CreateLabel("")
			xlbl_ComboBoxIcon_Down.Text = Chr(0xE313)
			xlbl_ComboBoxIcon_Down.Font = xui.CreateMaterialIcons(24)
			xlbl_ComboBoxIcon_Down.TextColor = xui.Color_ARGB(152,255,255,255)
			xpnl_PropertyBackground.AddView(xlbl_ComboBoxIcon_Down,xpnl_PropertyBackground.Width - ActionIconWidth/2-ActionIconWidth/2,xpnl_PropertyBackground.Height/2,ActionIconWidth,IconHeight)
				
			Dim xpnl_ComboBoxBackground As B4XView = xui.CreatePanel("")
			xpnl_PropertyBackground.AddView(xpnl_ComboBoxBackground,Gap,0,xpnl_PropertyBackground.Width - Gap*2 - xlbl_ComboBoxIcon_Up.Width,xpnl_PropertyBackground.Height)
				
			Dim xComboBox As B4XComboBox
			xComboBox.Initialize(Me,"xComboBox")
				
			Dim mComboBox As Map
			mComboBox.Initialize
			
			xComboBox.DesignerCreateView(xpnl_ComboBoxBackground,CreateLabel(""),mComboBox)
			xComboBox.SetItems(Property.ItemList)
				
			Dim xlbl_ComboBox As B4XView = CreateLabel("")
			xlbl_ComboBox.Color = m_PropertyColor
			xlbl_ComboBox.Tag = Property
			xlbl_ComboBox.Font = xui.CreateDefaultBoldFont(15)
			xlbl_ComboBox.TextColor = xui.Color_White
			xlbl_ComboBox.SetTextAlignment("CENTER","RIGHT")
			xComboBox.Tag = xlbl_ComboBox
			#If B4J
			xlbl_ComboBox.As(JavaObject).RunMethod("setMouseTransparent",Array As Object(True))
			#Else If B4I
			xlbl_ComboBox.As(Label).UserInteractionEnabled = False
			#End If
			
			xpnl_PropertyBackground.AddView(xlbl_ComboBox,Gap,0,xpnl_PropertyBackground.Width - Gap*2 - xlbl_ComboBoxIcon_Up.Width,xpnl_PropertyBackground.Height)
		
			Dim SelectedIndex As Int = 0
			For i = 0 To Property.ItemList.Size -1
				If Property.Value = Property.ItemList.Get(i) Then
					SelectedIndex = i
					Exit
				End If
			Next
				
			xComboBox.SelectedIndex = SelectedIndex
			
			xlbl_ComboBox.Text = Property.ItemList.Get(SelectedIndex)
				
		Case getValueType_Custom
			

			
	End Select
	
	Dim PropertyViews As ASSettings_PropertyViews = CreateASSettings_PropertyViews(xpnl_Background,xpnl_Property,xpnl_PropertyBackground,xiv_Icon,xlbl_PropertyName)
	PropertySettingViews.BackgroundPanel = xpnl_PropertyBackground
	CustomDrawProperty(CreateASSettings_CustomDrawProperty(Property.Group,Property,PropertyViews,PropertySettingViews))
	
End Sub

Private Sub AddGroupBorder2List(Top As Boolean)
	
	Dim xpnl_Background As B4XView = xui.CreatePanel("")
	xpnl_Background.Color = m_BackgroundColor
	xpnl_Background.SetLayoutAnimated(0,0,0,mBase.Width,m_CornerRadius)
	
	#if b4j
	xpnl_Background.Width = xpnl_Background.Width - 20dip
	#End If
	
	If Top Then
		xclv_main.Add(xpnl_Background,"GroupBorderTop")
	Else
		xclv_main.Add(xpnl_Background,"GroupBorderBottom")
	End If
	
End Sub

Private Sub AddInternGroupBorder(xpnl_Background As B4XView,Top As Boolean)
	
	Dim BorderItem As B4XView = xui.CreatePanel("")
	xpnl_Background.AddView(BorderItem,m_Padding,IIf(Top,0,-m_CornerRadius),xpnl_Background.Width - (m_Padding*2),m_CornerRadius*2)
	BorderItem.SetColorAndBorder(m_PropertyColor,0,0,m_CornerRadius)
	
	Dim xpnl As B4XView = xui.CreatePanel("")
	xpnl_Background.AddView(xpnl,m_Padding,IIf(Top,m_CornerRadius,-(m_CornerRadius*2)),xpnl_Background.Width - (m_Padding*2),m_CornerRadius)
	xpnl.Color = m_PropertyColor
	
End Sub

Public Sub Refresh
	
	For i = 0 To xclv_main.Size -1
		xclv_main.GetPanel(i).RemoveAllViews
	Next
	xclv_main.Refresh
	
End Sub

#Region CustomDrawProperty

Public Sub CustomDrawProperty_Add(Parent As B4XView,View As B4XView,Width As Float,Height As Float) As B4XView
	
	Parent.AddView(View,0,Parent.Height/2 - Height/2,Width,Height)
	
	For i = Parent.NumberOfViews -1 To 0 Step -1
		
		Parent.GetView(i).Left = IIf(i = (Parent.NumberOfViews-1),Parent.Width - m_Padding - Parent.GetView(i).Width,Parent.GetView(i+1).Left - m_Padding - Parent.GetView(i).Width)
		
	Next

	Return View
	
End Sub
'Creates a label view int he style of the textfield
'Event Example:
'Private Sub EventName_Clicked(Property As ASSettings_Property,View As Object)
'	Log("CustomDrawProperty Chooser Clicked")
'End Sub
Public Sub CustomDrawProperty_AddChooser(Callback As Object, EventName As String) As B4XView
	
	Dim xlbl_TextField As B4XView = CreateLabel("xlbl_CustomDrawTextField")
	xlbl_TextField.SetColorAndBorder(getValueTypeTextProperties.Color,0,0,getValueTypeTextProperties.CornerRadius)
	xlbl_TextField.Font = getValueTypeTextProperties.xFont
	xlbl_TextField.SetTextAlignment("CENTER","CENTER")
	xlbl_TextField.Text = ""
'	If Property.DisplayValueText = "" Then
'		xlbl_TextField.Text = Property.Value
'	Else
'		xlbl_TextField.Text = Property.DisplayValueText
'	End If
	'xlbl_TextField.Tag = getValueTypeTextProperties
	xlbl_TextField.TextColor = getValueTypeTextProperties.TextColor
	xlbl_TextField.Tag = CreateMap("Callback":Callback,"EventName":EventName)
	Return xlbl_TextField
	
End Sub
'Creates a normal text label without a style
Public Sub CustomDrawProperty_AddText(Callback As Object, EventName As String, Text As String) As B4XView
	
	Dim xlbl_Separator As B4XView = CreateLabel("xlbl_CustomDrawText")
	xlbl_Separator.TextColor = getValueTypeTextProperties.TextColor
	xlbl_Separator.Text = Text
	xlbl_Separator.Font = getValueTypeTextProperties.xFont
	xlbl_Separator.SetTextAlignment("CENTER","CENTER")
	xlbl_Separator.Tag = CreateMap("Callback":Callback,"EventName":EventName)
	Return xlbl_Separator
	
End Sub
#If B4J
Private Sub xlbl_CustomDrawTextField_MouseClicked (EventData As MouseEvent)
#Else
Private Sub xlbl_CustomDrawTextField_Click
#End If
	Dim xlbl_TextField As B4XView = Sender
	Dim m_Map As Map = xlbl_TextField.Tag
	If xui.SubExists(m_Map.Get("Callback"), m_Map.Get("EventName") & "_Clicked",2) Then
		CallSub3(m_Map.Get("Callback"), m_Map.Get("EventName") & "_Clicked",xclv_main.GetValue(xclv_main.GetItemFromView(xlbl_TextField)),xlbl_TextField)
	End If
End Sub

#End Region

#Region Properties

Public Sub getBottomTextProperties As ASSettings_BottomTextProperty
	Return g_BottomTextProperties
End Sub

Public Sub setBottomText(Text As String)
	m_BottomText = Text
End Sub

Public Sub getBottomText As String
	Return m_BottomText
End Sub

Public Sub getValueTypeTextProperties As ASSettings_ValueTypeTextProperties
	Return g_ValueTypeTextProperties
End Sub

#If SETTINGS_SegmentedTab
Public Sub getValueTypeSegmentedTabProperties As ASSettings_ValueTypeSegmentedTabProperties
	Return g_ValueTypeSegmentedTabProperties
End Sub
#End If

#If SETTINGS_PlusMinus
Public Sub getValueTypePlusMinusProperties As ASSettings_ValueTypePlusMinusProperties
	Return g_ValueTypePlusMinusProperties
End Sub
#End If

'Haptic feedback of the switches and click actions
Public Sub setHapticFeedback(Enabled As Boolean)
	m_HapticFeedback = Enabled
End Sub

Public Sub getHapticFeedback As Boolean
	Return m_HapticFeedback
End Sub
'The Background Color of the group name
Public Sub setGroupNameBackgroundColor(Color As Int)
	m_GroupNameBackgroundColor = Color
End Sub

Public Sub getGroupNameBackgroundColor As Int
	Return m_GroupNameBackgroundColor
End Sub
'Height of a group name
Public Sub setGroupHeight(Height As Float)
	m_GroupHeight= Height
End Sub

Public Sub getGroupHeight As Float
	Return m_GroupHeight
End Sub
'The corner radius of a group
Public Sub setCornerRadius(Radius As Int)
	m_CornerRadius = Radius
End Sub

Public Sub getCornerRadius As Int
	Return m_CornerRadius
End Sub
'Color of the seperator
Public Sub setPropertySeperatorColor(Color As Int)
	m_PropertySeperatorColor = Color
End Sub

Public Sub getPropertySeperatorColor As Int
	Return m_PropertySeperatorColor
End Sub
'If true a seperator is shown under a property
Public Sub setPropertySeperator(Show As Boolean)
	m_PropertySeperator = Show
End Sub

Public Sub getPropertySeperator As Boolean
	Return m_PropertySeperator
End Sub

Public Sub setSwitchFalseColor(Color As Int)
	m_SwitchFalseColor = Color
End Sub

Public Sub getSwitchFalseColor As Int
	Return m_SwitchFalseColor
End Sub

Public Sub setSwitchTrueColor(Color As Int)
	m_SwitchTrueColor = Color
End Sub

Public Sub getSwitchTrueColor As Int
	Return m_SwitchTrueColor
End Sub

Public Sub setSwitchThumbColor(Color As Int)
	m_SwitchThumbColor = Color
End Sub

Public Sub getSwitchThumbColor As Int
	Return m_SwitchThumbColor
End Sub
'The Padding Left and Right
'Default value: 10dip
Public Sub setPadding(Padding As Float)
	m_Padding = Padding
End Sub

Public Sub getPadding As Float
	Return m_Padding
End Sub
'Background Color of a property
Public Sub setPropertyColor(Color As Int)
	m_PropertyColor = Color
End Sub

Public Sub getPropertyColor As Int
	Return m_PropertyColor
End Sub
'Background Color of the view
Public Sub setBackgroundColor(Color As Int)
	m_BackgroundColor = Color
End Sub

Public Sub getBackgroundColor As Int
	Return m_BackgroundColor
End Sub

'<code>AS_Settings1.SaveMode = AS_Settings1.SaveMode_Automatic</code>
Public Sub getSaveMode As String
	Return m_SaveMode
End Sub

Public Sub setSaveMode(Mode As String)
	m_SaveMode = Mode
End Sub

Public Sub getPropertyHeight As Float
	Return m_PropertyHeight
End Sub

'Public Sub setPropertyHeight(Height As Float)
'	m_PropertyHeight = Height
'End Sub

#End Region

#Region Enums

'Switch or Checkbox
Public Sub getValueType_Boolean As String
	Return "Boolean"
End Sub

'Displays an arrow, the user can click on it and can be redirected to another page
Public Sub getValueType_Action As String
	Return "Action"
End Sub
'Same as Action, but without an arrow and description
Public Sub getValueType_ActionClean As String
	Return "ActionClean"
End Sub

Public Sub getValueType_Text As String
	Return "Text"
End Sub

Public Sub getValueType_ComboBox As String
	Return "ComboBox"
End Sub

Public Sub getValueType_Chooser As String
	Return "Chooser"
End Sub

Public Sub getValueType_Custom As String
	Return "Custom"
End Sub

#If SETTINGS_SegmentedTab

Public Sub getValueType_SegmentedTab As String
	Return "SegmentedTab"
End Sub

#End If

#If SETTINGS_PlusMinus
Public Sub getValueType_PlusMinus As String
	Return "PlusMinus"
End Sub
#End If

'**************************************************************

Public Sub getInputType_Text As String
	Return "Text"
End Sub

Public Sub getInputType_Numeric As String
	Return "Numeric"
End Sub

Public Sub getInputType_Decimal As String
	Return "Decimal"
End Sub

'Public Sub getInputType_IPv4 As String
'	Return "IPv4"
'End Sub
'
'Public Sub getInputType_IPv6 As String
'	Return "IPv6"
'End Sub

'*************************************************************

Public Sub getSaveMode_Automatic As String
	Return "Automatic"
End Sub

Public Sub getSaveMode_Manual As String
	Return "Manual"
End Sub

#End Region

#Region Events

Private Sub ValueChanged(Property As ASSettings_Property, Value As Object)
	
'	If m_SaveMode = getSaveMode_Automatic Then
'		AS_Properties.PutProperty(Property.PropertyName,Value)
'	End If
	
	If xui.SubExists(mCallBack, mEventName & "_ValueChanged",2) Then
		CallSub3(mCallBack, mEventName & "_ValueChanged",Property,Value)
	End If
End Sub

Private Sub ActionClicked(Property As ASSettings_Property)
	If xui.SubExists(mCallBack, mEventName & "_ActionClicked",1) Then
		CallSub2(mCallBack, mEventName & "_ActionClicked",Property)
	End If
End Sub

Private Sub ChooserTextFieldClicked(Property As ASSettings_Property)
	If xui.SubExists(mCallBack, mEventName & "_ChooserTextFieldClicked",1) Then
		CallSub2(mCallBack, mEventName & "_ChooserTextFieldClicked",Property)
	End If
End Sub

Private Sub CustomDrawProperty(Property As ASSettings_CustomDrawProperty)
	If xui.SubExists(mCallBack, mEventName & "_CustomDrawProperty",1) Then
		CallSub2(mCallBack, mEventName & "_CustomDrawProperty",Property)
	End If
End Sub

#End Region

#Region ViewEvents

Private Sub xclv_main_VisibleRangeChanged (FirstIndex As Int, LastIndex As Int)

	Dim ExtraSize As Int = 10
	For i = 0 To xclv_main.Size - 1
		Dim p As B4XView = xclv_main.GetPanel(i)
		If i > FirstIndex - ExtraSize And i < LastIndex + ExtraSize Then
			'visible+
			If p.NumberOfViews = 0 Then
				
				If xclv_main.GetValue(i) Is ASSettings_Group Then
					AddInternGroup(p,xclv_main.GetValue(i))
				else If xclv_main.GetValue(i) Is ASSettings_Property Then
					AddInternProperty(p,xclv_main.GetValue(i))
				Else If xclv_main.GetValue(i) = "GroupBorderTop" Then
					AddInternGroupBorder(p,True)
				Else If xclv_main.GetValue(i) = "GroupBorderBottom" Then
					AddInternGroupBorder(p,False)
				Else If xclv_main.GetValue(i) = "BottomText" Then
					AddInternBottomText(p)
				Else If xclv_main.GetValue(i) = "MadeWithLove" Then
					AdInternMadeWithLove(p)
 				End If
				
			End If
		Else
			'not visible
			If p.NumberOfViews > 0 Then
				p.RemoveAllViews '<--- remove the layout
			End If
		End If
	Next

End Sub

#If B4J
Private Sub xlbl_TextField_MouseClicked (EventData As MouseEvent)
	Dim xlbl_TextField As B4XView = Sender 'Ignore
	If m_HapticFeedback Then XUIViewsUtils.PerformHapticFeedback(xlbl_TextField)
	ChooserTextFieldClicked(xclv_main.GetValue(xclv_main.GetItemFromView(xlbl_TextField)))
End Sub
#Else
Private Sub xlbl_TextField_Click
	Dim xlbl_TextField As B4XView = Sender 'Ignore
	If m_HapticFeedback Then XUIViewsUtils.PerformHapticFeedback(xlbl_TextField)
	ChooserTextFieldClicked(xclv_main.GetValue(xclv_main.GetItemFromView(xlbl_TextField)))
End Sub
#End If

#If B4I

Private Sub xtf_TextBox_BeginEdit
	Dim xtf_TextBox As B4XView = Sender
	xtf_TextBox.SelectAll
End Sub

#Else If B4A

Private Sub xtf_TextBox_FocusChanged (HasFocus As Boolean)
	Dim xtf_TextBox As B4XView = Sender
	If HasFocus Then
		xtf_TextBox.SelectAll
	End If
End Sub

#End If

Private Sub xtf_TextBox_TextChanged (Old As String, New As String)
	Dim xtf_TextBox As B4XView = Sender
	If xtf_TextBox.IsInitialized = False Or xtf_TextBox.Tag = Null Then Return

	'Dim ValueTypeTextProperties As ASSettings_ValueTypeTextProperties = xtf_TextBox.Tag
	
'	If ValueTypeTextProperties.InputType = getInputType_IPv4 Then
'		
'
'		
''		xtf_TextBox.Text = New
''		xtf_TextBox.SelectionStart = xtf_TextBox.Text.Length
'		
'	else If ValueTypeTextProperties.InputType = getInputType_IPv6 Then
'		
'	End If

	Dim Property As ASSettings_Property = xclv_main.GetValue(xclv_main.GetItemFromView(xtf_TextBox))
	
	If m_SaveMode = getSaveMode_Automatic Then
		AS_Properties.PutProperty(Property.PropertyName,xtf_TextBox.Text)
	End If

	If isReady Then ValueChanged(Property,xtf_TextBox.Text)
End Sub

#If B4J
Private Sub xpnl_ActionClickPanel_MouseClicked (EventData As MouseEvent)
#Else
Private Sub xpnl_ActionClickPanel_Click
#End If
	Dim xpnl_ActionClickPanel As B4XView = Sender 'Ignore
	If m_HapticFeedback Then XUIViewsUtils.PerformHapticFeedback(xpnl_ActionClickPanel)
	ActionClicked(xclv_main.GetValue(xclv_main.GetItemFromView(xpnl_ActionClickPanel)))
End Sub

Private Sub xComboBox_SelectedIndexChanged (Index As Int)
	Dim xComboBox As B4XComboBox = Sender 'Ignore
	Dim xlbl_ComboBox As B4XView = xComboBox.Tag
	xlbl_ComboBox.Text = xComboBox.GetItem(Index)
	
	Dim Property As ASSettings_Property = xclv_main.GetValue(xclv_main.GetItemFromView(xComboBox.mBase))
	
	If m_SaveMode = getSaveMode_Automatic Then
		AS_Properties.PutProperty(Property.PropertyName,xComboBox.GetItem(Index))
	End If
	
	ValueChanged(Property,xComboBox.GetItem(Index))
End Sub

Private Sub SwitchBoolean_ValueChanged (Value As Boolean)
	Dim SwitchBoolean As B4XSwitch = Sender 'Ignore
	Dim Property As ASSettings_Property = xclv_main.GetValue(xclv_main.GetItemFromView(SwitchBoolean.mBase))
	
	If m_SaveMode = getSaveMode_Automatic Then
		AS_Properties.PutProperty(Property.PropertyName,Value)
	End If
	
	ValueChanged(Property,Value)
End Sub

#IF SETTINGS_SegmentedTab
Private Sub SegmentedTab_TabChanged(index As Int)
	Dim SegmentedTab As ASSegmentedTab = Sender 'Ignore
		Dim Property As ASSettings_Property = xclv_main.GetValue(xclv_main.GetItemFromView(SegmentedTab.mBase))
	
		If m_SaveMode = getSaveMode_Automatic Then
		AS_Properties.PutProperty(Property.PropertyName,SegmentedTab.GetValue(index))
	End If
	
	ValueChanged(Property,SegmentedTab.GetValue(index))
End Sub
#End If

#If SETTINGS_PlusMinus

Private Sub PlusMinus_LeftClick
	PlusMinusChangeValue(Sender,False)
End Sub

Private Sub PlusMinus_RightClick
	PlusMinusChangeValue(Sender,True)
End Sub

Private Sub PlusMinusChangeValue(PlusMinus As AS_PlusMinus,isAdding As Boolean)
	Dim ValueTypePlusMinusProperties As ASSettings_ValueTypePlusMinusProperties = PlusMinus.Tag
	Dim Property As ASSettings_Property = xclv_main.GetValue(xclv_main.GetItemFromView(PlusMinus.mBase))
	
	Dim FinalValue As Int = 0
	If isAdding Then
		FinalValue = Property.Value + ValueTypePlusMinusProperties.Increment
		Else
		FinalValue = Property.Value - ValueTypePlusMinusProperties.Increment
	End If
	
	If FinalValue <= ValueTypePlusMinusProperties.MaxValue And FinalValue >= ValueTypePlusMinusProperties.MinValue Then
	
		Property.Value = FinalValue

		Dim xlbl As B4XView = PlusMinus.mBase.Parent.GetView(1)
		xlbl.Text = ValueTypePlusMinusProperties.Prefix &  FinalValue & ValueTypePlusMinusProperties.Suffix
	
		Dim ValueWidth As Float = MeasureTextWidth(xlbl.Text,xlbl.Font) +2dip
		
		xlbl.Width = ValueWidth
		xlbl.Left = PlusMinus.mBase.Left - ValueWidth - 10dip
	
	End If
	
		If m_SaveMode = getSaveMode_Automatic Then
		AS_Properties.PutProperty(Property.PropertyName,Property.Value)
	End If
	
	ValueChanged(Property,Property.Value)
End Sub

#End If

#End Region

#Region InternFunctions

Private Sub GetGroup(Key As String) As ASSettings_Group
	For Each Group As ASSettings_Group In lstGroups
		If Group.Key = Key Then
			Return Group
		End If
	Next
	Return Null
End Sub

Private Sub CreateLabel(EventName As String) As B4XView
	Dim lbl As Label
	lbl.Initialize(EventName)
	Return lbl
End Sub

Private Sub CreateImageView(EventName As String) As B4XView
	Dim iv As ImageView
	iv.Initialize(EventName)
	Return iv
End Sub

Private Sub CreateEditText(EventName As String,InputType As String) As B4XView'Ignore
	'Text|Numbers|Decimal
#if B4J
	Dim tf As TextField
	tf.Initialize(EventName)
	CSSUtils.SetStyleProperty(tf, "-fx-padding", "0 0 0 0")
	tf.As(JavaObject).RunMethod("setFocusTraversable", Array As Object(True))
	Return tf
#else if B4A
	Dim tf As EditText
	tf.Initialize(EventName)
	tf.SingleLine = True
	tf.Padding = Array As Int (0, 0, 0, 0)
		Select InputType
			Case getInputType_Numeric
				tf.InputType = tf.INPUT_TYPE_NUMBERS
			Case getInputType_Decimal
				tf.InputType = tf.INPUT_TYPE_DECIMAL_NUMBERS
		End Select
	Return tf

#else if B4i
	Dim tf As TextField
	tf.Initialize(EventName)
	tf.BorderStyle = tf.STYLE_NONE
	tf.ShowClearButton = False
	tf.Autocorrect = tf.AUTOCORRECT_NO
	Select InputType
		Case getInputType_Numeric
			tf.KeyboardType = tf.TYPE_NUMBER_PAD
		Case getInputType_Decimal
			tf.KeyboardType = tf.TYPE_NUMBERS_AND_PUNCTUATIONS
	End Select
	Return tf
#end if
End Sub

'https://www.b4x.com/android/forum/threads/fontawesome-to-bitmap.95155/post-603250
Public Sub FontToBitmap (text As String, IsMaterialIcons As Boolean, FontSize As Float, color As Int) As B4XBitmap
	Dim xui As XUI
	Dim p As B4XView = xui.CreatePanel("")
	p.SetLayoutAnimated(0, 0, 0, 32dip, 32dip)
	Dim cvs1 As B4XCanvas
	cvs1.Initialize(p)
	Dim fnt As B4XFont
	If IsMaterialIcons Then fnt = xui.CreateMaterialIcons(FontSize) Else fnt = xui.CreateFontAwesome(FontSize)
	Dim r As B4XRect = cvs1.MeasureText(text, fnt)
	Dim BaseLine As Int = cvs1.TargetRect.CenterY - r.Height / 2 - r.Top
	cvs1.DrawText(text, cvs1.TargetRect.CenterX, BaseLine, fnt, color, "CENTER")
	Dim b As B4XBitmap = cvs1.CreateBitmap
	cvs1.Release
	Return b
End Sub

Private Sub MeasureTextWidth(Text As String, Font1 As B4XFont) As Int 'Ignore
#If B4A
    Private bmp As Bitmap
    bmp.InitializeMutable(2dip, 2dip)
    Private cvs As Canvas
    cvs.Initialize2(bmp)
    Return cvs.MeasureStringWidth(Text, Font1.ToNativeFont, Font1.Size)
#Else If B4i
	Return Text.MeasureWidth(Font1.ToNativeFont)
#Else If B4J
    Dim jo As JavaObject
    jo.InitializeNewInstance("javafx.scene.text.Text", Array(Text))
    jo.RunMethod("setFont",Array(Font1.ToNativeFont))
    jo.RunMethod("setLineSpacing",Array(0.0))
    jo.RunMethod("setWrappingWidth",Array(0.0))
    Dim Bounds As JavaObject = jo.RunMethod("getLayoutBounds",Null)
    Return Bounds.RunMethod("getWidth",Null)
#End If
End Sub

Private Sub MeasureTextHeight(Text As String, Font1 As B4XFont) As Int 'ignore
#If B4A    
    Private bmp As Bitmap
    bmp.InitializeMutable(2dip, 2dip)
    Private cvs As Canvas
    cvs.Initialize2(bmp)
    Return cvs.MeasureStringHeight(Text, Font1.ToNativeFont, Font1.Size)
#Else If B4i
	Return Text.MeasureHeight(Font1.ToNativeFont)
#Else If B4J
    Dim jo As JavaObject
    jo.InitializeNewInstance("javafx.scene.text.Text", Array(Text))
    jo.RunMethod("setFont",Array(Font1.ToNativeFont))
    jo.RunMethod("setLineSpacing",Array(0.0))
    jo.RunMethod("setWrappingWidth",Array(0.0))
    Dim Bounds As JavaObject = jo.RunMethod("getLayoutBounds",Null)
    Return Bounds.RunMethod("getHeight",Null)
#End If
End Sub

Private Sub MeasureMultilineTextHeight(xLabel As B4XView) As Double
	#If B4J
	'https://www.b4x.com/android/forum/threads/measure-multiline-text-height.84331/#content
	Dim jo As JavaObject = Me
	Return jo.RunMethod("MeasureMultilineTextHeight", Array(xLabel.Font, xLabel.Text, xLabel.Width))
	#Else if B4A
	Dim su As StringUtils
	Return su.MeasureMultilineTextHeight(xLabel,xLabel.Text)
	#Else if B4I
	Dim tmpLabel As Label
	tmpLabel.Initialize("")
	tmpLabel.Font = xLabel.Font
	tmpLabel.Width = xLabel.Width
	tmpLabel.Text = xLabel.Text
	tmpLabel.Multiline = True
	tmpLabel.SizeToFit
	Return tmpLabel.Height
	#End IF
End Sub

#If B4J
#if Java
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javafx.scene.text.Font;
import javafx.scene.text.TextBoundsType;
public static double MeasureMultilineTextHeight(Font f, String text, double width) throws Exception {
  Method m = Class.forName("com.sun.javafx.scene.control.skin.Utils").getDeclaredMethod("computeTextHeight",
  Font.class, String.class, double.class, TextBoundsType.class);
  m.setAccessible(true);
  return (Double)m.invoke(null, f, text, width, TextBoundsType.LOGICAL_VERTICAL_CENTER);
  }
#End If
#End If

#End Region

#Region Types

Public Sub CreateASSettings_Group (Key As String, Name As String, Properties As List) As ASSettings_Group
	Dim t1 As ASSettings_Group
	t1.Initialize
	t1.Key = Key
	t1.Name = Name
	t1.Properties = Properties
	Return t1
End Sub

Public Sub CreateASSettings_ValueTypeTextProperties (Width As Float, Height As Float, xFont As B4XFont, TextColor As Int, Color As Int, InputType As String, Format As String, CornerRadius As Float) As ASSettings_ValueTypeTextProperties
	Dim t1 As ASSettings_ValueTypeTextProperties
	t1.Initialize
	t1.Width = Width
	t1.Height = Height
	t1.xFont = xFont
	t1.TextColor = TextColor
	t1.Color = Color
	t1.InputType = InputType
	t1.Format = Format
	t1.CornerRadius = CornerRadius
	Return t1
End Sub

#If SETTINGS_SegmentedTab
Public Sub CreateASSettings_ValueTypeSegmentedTabProperties (Width As Float, CornerRadius As Float, ShowSeperators As Boolean, BackgroundColor As Int, SelectionColor As Int, SeperatorColor As Int, TextColor As Int, xFont As B4XFont) As ASSettings_ValueTypeSegmentedTabProperties
	Dim t1 As ASSettings_ValueTypeSegmentedTabProperties
	t1.Initialize
	t1.Width = Width
	t1.CornerRadius = CornerRadius
	t1.ShowSeperators = ShowSeperators
	t1.BackgroundColor = BackgroundColor
	t1.SelectionColor = SelectionColor
	t1.SeperatorColor = SeperatorColor
	t1.TextColor = TextColor
	t1.xFont = xFont
	Return t1
End Sub
#End If

#If SETTINGS_PlusMinus
Public Sub CreateASSettings_ValueTypePlusMinusProperties (CornerRadius As Float, ShowDivider As Boolean, BackgroundColor As Int, DividerColor As Int, HaloColor As Int, TextColor As Int, xFont As B4XFont, ShowHaloEffect As Boolean) As ASSettings_ValueTypePlusMinusProperties
	Dim t1 As ASSettings_ValueTypePlusMinusProperties
	t1.Initialize
	t1.CornerRadius = CornerRadius
	t1.ShowDivider = ShowDivider
	t1.BackgroundColor = BackgroundColor
	t1.DividerColor = DividerColor
	t1.HaloColor = HaloColor
	t1.TextColor = TextColor
	t1.xFont = xFont
	t1.ShowHaloEffect = ShowHaloEffect
	Return t1
End Sub
#End If

Public Sub CreateASSettings_BottomTextProperty (xFont As B4XFont, TextColor As Int) As ASSettings_BottomTextProperty
	Dim t1 As ASSettings_BottomTextProperty
	t1.Initialize
	t1.xFont = xFont
	t1.TextColor = TextColor
	Return t1
End Sub

#End Region

Public Sub CreateASSettings_PropertyViews (RootBackgroundPanel As B4XView, LeftBackgroundPanel As B4XView, RightBackgroundPanel As B4XView, IconImageView As B4XView, NameLabel As B4XView) As ASSettings_PropertyViews
	Dim t1 As ASSettings_PropertyViews
	t1.Initialize
	t1.RootBackgroundPanel = RootBackgroundPanel
	t1.LeftBackgroundPanel = LeftBackgroundPanel
	t1.RightBackgroundPanel = RightBackgroundPanel
	t1.IconImageView = IconImageView
	t1.NameLabel = NameLabel
	Return t1
End Sub

Public Sub CreateASSettings_CustomDrawProperty (Group As ASSettings_Group, Property As ASSettings_Property, PropertyViews As ASSettings_PropertyViews, PropertySettingViews As ASSettings_PropertySettingViews) As ASSettings_CustomDrawProperty
	Dim t1 As ASSettings_CustomDrawProperty
	t1.Initialize
	t1.Group = Group
	t1.Property = Property
	t1.PropertyViews = PropertyViews
	t1.PropertySettingViews = PropertySettingViews
	Return t1
End Sub