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
	CustomListView1Noty.Add(CreateCardData,"")
	
	For i=0 To 4
		CustomListView1Noty.Add(CreateCardNoty,"")	
	Next
	
	CustomListView1Noty.Add(CreateCardData,"")
	
	For i=0 To 4
		CustomListView1Noty.Add(CreateCardNoty,"")
	Next
End Sub

'You can see the list of page related events in the B4XPagesManager object. The event name is B4XPage.

Private Sub CustomListView1Noty_ItemClick (Index As Int, Value As Object)
	
End Sub


Sub CreateCardData As B4XView
	Dim xui As XUI
	Dim p As B4XView  = xui.CreatePanel("")
	p.SetLayoutAnimated(0, 0, 0,100%x, 80dip)
	p.LoadLayout("category")
	Return p
End Sub

Sub CreateCardNoty As B4XView
	Dim xui As XUI
	Dim p As B4XView  = xui.CreatePanel("")
	p.SetLayoutAnimated(0, 0, 0,100%x, 80dip)
	p.LoadLayout("cardt")
	Return p
End Sub