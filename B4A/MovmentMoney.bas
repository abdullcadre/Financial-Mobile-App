B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12.8
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore
	Private EditText1Amount As EditText
'	Private CustomListView1 As CustomListView
'	Private ImageView1Theme As ImageView
	
	Dim Datepicker As Intellvold_DatePicker
	Dim Mycalendar As Intellvold_Calendar
'	Dim Timepicker As Intellvold_TimePicker
	Private Label1data As Label
	Private Panel1 As Panel
	Public cardid As String
	Private EditText1Nota As EditText
	Private Panel2 As Panel
	
	Dim tipo As String=""
	Private Label17 As Label
	Dim Button1login As Button
	Public  modo As String=""
	Public idmov As Int=0
End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1	
End Sub
Sub loadlayout
	Root.RemoveAllViews
	Root.LoadLayout("mvm")
	EditText1Amount.Color=Colors.Transparent
	EditText1Nota.Color=Colors.Transparent
	Label1data.Text= DateTime.Date(DateTime.Now)
End Sub
Sub B4XPage_Appear
	Try	
	loadlayout
	Log(modo)
	If modo="edit" Then
		Dim Cursor As Cursor
		Cursor = Starter.sql.ExecQuery("SELECT * FROM transacaoo  WHERE id = '"&idmov&"' limit 1")
		For i = 0 To Cursor.RowCount - 1
			Cursor.Position = i
			Log(Cursor.GetString("nota"))
			Log(Cursor.GetString("tipo"))
			Log(Cursor.GetDouble("amount"))
			Log(Cursor.GetString("data"))
			tipo=Cursor.GetString("tipo")
			
			EditText1Amount.Text=Cursor.GetDouble("amount")			
			EditText1Nota.Text=Cursor.GetString("nota")
			Label1data.Text=Cursor.GetString("data")
			Button1login.Text="Edit Money"
		Next
	End If
	
	
	
	Log("ID: "&cardid)
	Log("TIPO: "&tipo)
	If tipo ="in" Then 	Label17.Text="Money deposit"'
	If tipo ="out" Then 	Label17.Text="Money out"
	If tipo ="out" Then 	Button1login.Text="Money out"
	If tipo ="in" Then 	Button1login.Text="Money deposit"'
		
	
	
	geral.SetStatusNavBarColor(0xFFF7F7F7,0xFFF7F7F7)
	geral.colordarkIconsStatusbar
	
	Catch
		Log(LastException)
	End Try
End Sub



Private Sub Label2leftMenu_Click
	B4XPages.ShowPageAndRemovePreviousPages("mp")
End Sub

Private Sub Label1data_Click
	EditText1Amount.Enabled=False
	EditText1Nota.Enabled=False
	EditText1Amount.Enabled=True
	EditText1Nota.Enabled=True
	datashow
End Sub

Sub datashow
	Datepicker.Initialize("Date",DateTime.GetYear(DateTime.Now) ,DateTime.GetMonth(DateTime.Now) ,DateTime.GetDayOfMonth(DateTime.Now))
	Mycalendar.Initialize("dd/MM/yyyy",Mycalendar.PRC,"02/02/1990") 'start date
	Datepicker.SetMinDate(Mycalendar)
	Mycalendar.Initialize("dd/MM/yyyy",Mycalendar.PRC,"02/02/2030") 'end date
	Datepicker.SetMaxDate(Mycalendar)
	Datepicker.CancelColor = Colors.Black
	Datepicker.OkColor = Colors.Black
	Datepicker.CancelText = "cancel"
	Datepicker.OkText = "OK"
	Datepicker.SetOnCancel("can")
	Datepicker.show2("ok")
	Sleep(900)
End Sub


Sub Date_OnDateSet (year As Int ,monthOfYear As Int , dayOfMonth As Int)
	Label1data.Text=(NumberFormat(dayOfMonth,2 ,0))&"/"&NumberFormat(monthOfYear ,2 ,0)&"/"&year
End Sub


Private Sub Button1login_Click
	
	
	
	Log(tipo)	
	Log(cardid)
	EditText1Amount.Enabled=False
	If EditText1Amount.Text="" And EditText1Nota.Text="" Then
		geral.alertViews(Panel2,EditText1Nota)
		geral.alertViews(Panel1,EditText1Amount)
	else If EditText1Amount.Text="" Or EditText1Amount.Text=0 Then
		geral.alertViews(Panel1,EditText1Amount)
	else if  EditText1Nota.Text="" Then
		geral.alertViews(Panel2,EditText1Nota)
	Else
		
		
		If modo="new" Then
			If 	Starter.InsertTransaction(EditText1Amount.Text.Trim,Label1data.Text,EditText1Nota.Text.Trim,tipo,cardid) Then
			Log("sucesso")
			B4XPages.GetPage("mp").As(menuPage).cards1
			EditText1Amount.Text=""
			EditText1Nota.Text=""
			Label1data.Text= DateTime.Date(DateTime.Now)
			ToastMessageShow("Sucessfully 😊😊",False)
		Else
			MsgboxAsync("Error 🥲🥲😒", Label17.Text)
		End If
			
		Else
			
			If 	Starter.UpdateTransaction(idmov,EditText1Amount.Text.Trim,Label1data.Text,EditText1Nota.Text.Trim,tipo,cardid) Then
				Log("sucesso")
				B4XPages.GetPage("mp").As(menuPage).cards1
'				EditText1Amount.Text=""
'				EditText1Nota.Text=""
'				Label1data.Text= DateTime.Date(DateTime.Now)
				ToastMessageShow("Sucessfully 😊😊", False)
			Else
				MsgboxAsync("Error 🥲🥲😒", Label17.Text)
			End If
			
			
			
				
		End If
		
		
	End If
	EditText1Amount.Enabled=True
End Sub

Private Sub Label3noty_Click
	Button1login_Click
End Sub