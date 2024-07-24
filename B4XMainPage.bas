B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=9.85
@EndOfDesignText@
#Region Shared Files
'#CustomBuildAction: folders ready, %WINDIR%\System32\Robocopy.exe,"..\..\Shared Files" "..\Files"
'Ctrl + click to sync files: ide://run?file=%WINDIR%\System32\Robocopy.exe&args=..\..\Shared+Files&args=..\Files&FilesSync=True
#End Region

'Ctrl + click to export as zip: ide://run?File=%B4X%\Zipper.jar&Args=ProjectFinancialMobileApp02_19_2024.zip

Sub Class_Globals
	Dim tr As Transaction
	Dim nt As Notification_c
	Dim login As loginAndCreate
	Dim menuP As menuPage
	Dim nc As NewCard
	Dim lc As ListCards
	Dim pf As Profile
	Dim mvm As MovmentMoney
	Dim st As Settings
End Sub

Public Sub Initialize
	B4XPages.GetManager.LogEvents = True
	B4XPages.GetManager.TransitionAnimationDuration=0' = True
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	tr.Initialize
	nt.Initialize
	login.Initialize
	menuP.Initialize
	nc.Initialize
	lc.Initialize
	pf.Initialize
	mvm.Initialize
	st.Initialize
	B4XPages.AddPage("tr",tr)
	B4XPages.AddPage("nt",nt)
	B4XPages.AddPage("lg",login)
	B4XPages.AddPage("mp",menuP)
	B4XPages.AddPage("nc",nc)		
	B4XPages.AddPage("lc",lc)		
	B4XPages.AddPage("pf",pf)		
	B4XPages.AddPage("mvm",mvm)
	B4XPages.AddPage("st",st)
End Sub

Sub B4XPage_Appear
	Dim NumberOfMatches As Int
	NumberOfMatches = Starter.sql.ExecQuerySingleResult("SELECT count(*) FROM user")	
	Log(NumberOfMatches)	
	If File.ReadString(File.DirInternal, "actualuser")="nulo" Or NumberOfMatches=0 Then
		B4XPages.ShowPageAndRemovePreviousPages("lg")		
		Else
		B4XPages.ShowPageAndRemovePreviousPages("mp")
	End If	
End Sub
