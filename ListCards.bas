B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12.8
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore
'	Private B4XComboBox1 As B4XComboBox
	Private Panel1Main As B4XView
'	Private  BarChart2 As xChart
	Private CustomListView1recents As CustomListView
'	Private Label1 As Label
'	Private Label2 As Label
'	Private Label3time As Label
'	Private Label4price As Label
'	Private Label5separador As Label
'	Private Panel1 As Panel
'	Private Panel2 As Panel

	Private Label2leftMenu As B4XView
	Private Panel1EmptyCards As Panel
	Private Label5Type As Label
	Private Label9Expdate As Label
	Private Label2Holder As Label
	Private Label1CardNumer As Label
	Private Label6bankname As Label
	Private Panel1Card As Panel
'	Private ImageView1cardSnap As ImageView
End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	Root.LoadLayout("lc")
'	list
End Sub



Sub B4XPage_Appear
	geral.SetStatusNavBarColor(0xFFF7F7F7,0xFF101114)
	geral.colordarkIconsStatusbar	
	fillCLV
'	list
End Sub

Sub CreateLisCat(theme As String,number As String, expdate As String, holdername As String,bankname As String, typecard As String ) As B4XView
	Dim xui As XUI
	Dim p As B4XView  = xui.CreatePanel("")
	p.SetLayoutAnimated(0, 0, 0,100%x, 255dip)
	p.LoadLayout("cardtbank")
	geral.AdjustImageViewPanel(Panel1Card,theme)
	geral.AdjustImageViewPanel(Panel1Card,theme)
	Label1CardNumer.Text=number
	Label9Expdate.Text=expdate
	Label2Holder.Text=holdername
	Label6bankname.Text=bankname
	Private bmp As B4XBitmap = LoadBitmap(File.DirAssets, typecard)
	Label5Type.SetBackgroundImage(bmp)
	
'	ImageView1cardSnap.Bitmap=LoadBitmap(File.DirInternal,name)
	Return p
End Sub


Sub fillCLV
	Panel1EmptyCards.Visible=False
	CustomListView1recents.Clear
	Dim Cursor As Cursor
	Cursor = Starter.sql.ExecQuery("SELECT * FROM card WHERE iduser = '"&Starter.GetIdUser&"' ORDER BY id DESC")
	For i = 0 To Cursor.RowCount - 1
		Cursor.Position = i
		Log(Cursor.GetString("bankname"))
		Log(Cursor.GetString("number"))		
		Log(Cursor.GetString("iduser"))
'		If Cursor.GetString("iduser")=iduser Then
			CustomListView1recents.Add(CreateLisCat(Cursor.GetString("img"),Cursor.GetString("number"),Cursor.GetString("expireddate"),Cursor.GetString("holder"),Cursor.GetString("bankname"),Cursor.GetString("type")),Cursor.GetString("id"))			
'		End If
		
	Next
Log(i)
	If i<>0 Then
		Panel1EmptyCards.SetVisibleAnimated(500,False)
		Else
		Panel1EmptyCards.SetVisibleAnimated(500,True)			
	End If
End Sub

Private Sub B4XComboBox1_SelectedIndexChanged (Index As Int)
	
End Sub

Private Sub Label2leftMenu_Click
	B4XPages.ShowPageAndRemovePreviousPages("mp")
'	B4XPages.ClosePage(Me)
End Sub

Private Sub Label3newCard_Click
	newcardq
End Sub

Private Sub Button1Addcard_Click
	newcardq
End Sub

Private Sub CustomListView1recents_ItemClick (Index As Int, Value As Object)
	Log(Value)
	editCard(Value)
End Sub


Sub newcardq
	B4XPages.ShowPage("nc")
	B4XPages.GetPage("nc").As(NewCard).mode="new"
'	B4XPages.GetPage("nc").As(NewCard).newC
	'remmato da me
	'B4XPages.ShowPage("nc")
End Sub



Sub editCard(id As Int)
	B4XPages.ShowPage("nc")
	B4XPages.GetPage("nc").As(NewCard).mode="edit"
	B4XPages.GetPage("nc").As(NewCard).idCard=id
	Sleep(10)
'	B4XPages.GetPage("nc").As(NewCard).editC	
End Sub


Private Sub B4XPage_CloseRequest As ResumableSub
	Log("MainPage CloseRequest")
	B4XPages.ShowPageAndRemovePreviousPages("mp")
	Return False
End Sub