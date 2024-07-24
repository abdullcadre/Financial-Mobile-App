B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=8.5
@EndOfDesignText@
'version 1.52*
Sub Class_Globals
	Private mEventName As String 'ignore
	Private mCallBack As Object 'ignore
	Private xui As XUI 'ignore
	Private mSideWidth As Int
	Public mLeftPanel As B4XView
	Public mRightPanel As B4XView
	Public mDarkPanel As B4XView
	Public mBasePanel As B4XView
	Public mCenterPanel As B4XView
	Private ExtraWidth As Int = 50dip
	Private TouchXStart, TouchYStart As Float 'ignore
	Private IsOpenLeft As Boolean
	Private IsOpenRight As Boolean
	Private HandlingLSwipe As Boolean
	Private HandlingRSwipe As Boolean
	Private StartAtScrim As Boolean 'ignore
	Private mEnabled As Boolean = True
	Private mRightPanelEnabled As Boolean = False
	Public mDarkPanel_Color As Int=Colors.Transparent
End Sub

Public Sub Initialize (Callback As Object, EventName As String, Parent As B4XView, SideWidth As Int)
	mEventName = EventName
	mCallBack = Callback
	mSideWidth = SideWidth
	#if B4A
	Dim creator As TouchPanelCreator
	mBasePanel = creator.CreateTouchPanel("base")
	#else if B4i
	mBasePanel = xui.CreatePanel("")
	Dim nme As NativeObject = Me
	Dim no As NativeObject = mBasePanel
	no.RunMethod("addGestureRecognizer:", Array(nme.RunMethod("CreateRecognizer", Null)))
	#End If
	Parent.AddView(mBasePanel, 0, 0, Parent.Width, Parent.Height)
	mCenterPanel = xui.CreatePanel("")
	mBasePanel.AddView(mCenterPanel, 0, 0, mBasePanel.Width, mBasePanel.Height)
	mDarkPanel = xui.CreatePanel("dark")
	mBasePanel.AddView(mDarkPanel, 0, 0, mBasePanel.Width, mBasePanel.Height)
	mLeftPanel = xui.CreatePanel("LeftPanel")
	mBasePanel.AddView(mLeftPanel, -SideWidth, 0, SideWidth, mBasePanel.Height)
	mLeftPanel.Color = xui.Color_Red
	mRightPanel = xui.CreatePanel("RightPanel")
	mBasePanel.AddView(mRightPanel, mBasePanel.Width, 0, SideWidth, mBasePanel.Height)
	mRightPanel.Color = xui.Color_Red
	#if B4A
	Dim pL As Panel = mLeftPanel
	pL.Elevation = 0dip
	Dim pR As Panel = mRightPanel
	pR.Elevation = 0dip
	#Else If B4i
	Dim p As Panel = mDarkPanel
	p.UserInteractionEnabled = False
	p.SetBorder(0, 0, 0)
	p = mLeftPanel
	
	p = mCenterPanel
	p.SetBorder(0, 0, 0)
	p = mBasePanel
	p.SetBorder(0, 0, 0)
	#End If
End Sub

Private Sub LeftPanel_Click
	
End Sub

#if B4A

Private Sub Base_OnTouchEvent (Action As Int, X As Float, Y As Float, MotionEvent As Object) As Boolean
	If mEnabled = False Then Return False
	Dim LeftPanelRightSide As Int = mLeftPanel.Left + mLeftPanel.Width
	Dim RightPanelLeftSide As Int = mRightPanel.Left
	
	If HandlingLSwipe = False And HandlingRSwipe = False Then
		If LeftPanelRightSide < x And x < RightPanelLeftSide Then
			If IsOpenLeft Then
				TouchXStart = X
				If Action = mBasePanel.TOUCH_ACTION_UP Then setLeftOpen(False)
				Return True
			End If
			If IsOpenRight Then
				TouchXStart = X
				If Action = mBasePanel.TOUCH_ACTION_UP Then setRightOpen(False)
				Return True
			End If
			If IsOpenLeft = False And x > LeftPanelRightSide + ExtraWidth And IsOpenRight = False And x < RightPanelLeftSide - ExtraWidth Then
				Return False
			End If
		End If
	End If
	Select Action
		Case mBasePanel.TOUCH_ACTION_MOVE
			Dim dx As Float = x - TouchXStart
			TouchXStart = X
			If HandlingLSwipe Or ( x <= ExtraWidth And Abs(dx) > 3dip And Not(IsOpenRight) ) Then
				HandlingLSwipe = True
				LeftChangeOffset(mLeftPanel.Left + dx, True, False)
			End If
			If HandlingRSwipe Or ( x >= mBasePanel.Width - ExtraWidth And Abs(dx) > 3dip And Not(IsOpenLeft) ) Then
				HandlingRSwipe = True
				RightChangeOffset(mRightPanel.Left + dx, True, False)
			End If
		Case mBasePanel.TOUCH_ACTION_UP
			If HandlingLSwipe Then
				LeftChangeOffset(mLeftPanel.Left, False, False)
			End If
			If HandlingRSwipe Then
				RightChangeOffset(mRightPanel.Left, False, False)
			End If
			HandlingLSwipe = False
			HandlingRSwipe = False
	End Select
	Return True
End Sub

'Return True to "steal" the event from the child views
Private Sub Base_OnInterceptTouchEvent (Action As Int, X As Float, Y As Float, MotionEvent As Object) As Boolean
	If mEnabled = False Then Return False
	If IsOpenLeft = False And IsOpenRight = False And mLeftPanel.Left + mLeftPanel.Width + ExtraWidth < x And x < mRightPanel.Left - ExtraWidth Then
		HandlingLSwipe = False
		HandlingRSwipe = False
		Return False
	End If
	If IsOpenLeft And x > mLeftPanel.Left + mLeftPanel.Width Then
		'handle all touch events right of the opened side menu
		Return True
	End If
	If IsOpenRight And x < mRightPanel.Left Then
		'handle all touch events left of the opened side menu
		Return True
	End If
	If HandlingLSwipe Or HandlingRSwipe Then Return True
	Select Action
		Case mBasePanel.TOUCH_ACTION_DOWN
			TouchXStart = X
			TouchYStart = Y
			HandlingLSwipe = False
			HandlingRSwipe = False
		Case mBasePanel.TOUCH_ACTION_MOVE
			Dim dx As Float = Abs(x - TouchXStart)
			Dim dy As Float = Abs(y - TouchYStart)
			If dy < 20dip And dx > 10dip Then
				If (( x <= ExtraWidth And IsOpenRight = False ) Or IsOpenLeft ) Then
					HandlingLSwipe = True
				End If
				If (( x >= mBasePanel.Width - ExtraWidth And IsOpenLeft = False ) Or IsOpenRight ) Then
					HandlingRSwipe = True
				End If
			End If
	End Select
	Return HandlingLSwipe Or HandlingRSwipe
End Sub
#End If

#if B4i
Private Sub Pan_Event (pan As Object)
	Dim rec As NativeObject = pan
	Dim points() As Float = rec.ArrayFromPoint(rec.RunMethod("locationInView:", Array(mBasePanel)))
	Dim x As Float = points(0)
	Dim state As Int = rec.GetField("state").AsNumber
	Dim LeftPanelRightSide As Int = mLeftPanel.Left + mLeftPanel.Width
	Select state
		Case 1 'began
			If mEnabled = False Then
				CancelGesture(rec)
				Return
			End If
			If x > LeftPanelRightSide Then
				If IsOpenLeft = False And x > LeftPanelRightSide + ExtraWidth Then
					CancelGesture(rec)
					HandlingSwipe = False
					Return
				End If
			End If
			StartAtScrim = x > LeftPanelRightSide
			HandlingSwipe = True
			TouchXStart = x
		Case 2 'changed
			If mLeftPanel.Left < 0 Or x <= LeftPanelRightSide Then
				Dim dx As Float = x - TouchXStart
				ChangeOffset(mLeftPanel.Left + dx, True, False)
				StartAtScrim = False
			End If
			TouchXStart = X
		Case 3
			HandlingSwipe = False
			If IsOpenLeft And StartAtScrim And x > LeftPanelRightSide Then
				setLeftOpen(False)
			Else
				ChangeOffset(mLeftPanel.Left, False, False)
			End If
	End Select
End Sub

Private Sub CancelGesture (rec As NativeObject)
	rec.SetField("enabled", False)
	rec.SetField("enabled", True)
End Sub

Private Sub Dark_Touch(Action As Int, X As Float, Y As Float)
	If HandlingSwipe = False And Action = mDarkPanel.TOUCH_ACTION_UP Then
		 setLeftOpen(False)
	End If
End Sub
#end if


Private Sub LeftChangeOffset (x As Float, CurrentlyTouching As Boolean, NoAnimation As Boolean)
	x = Max(-mSideWidth, Min(0, x))
	Dim VisibleOffset As Int = mSideWidth + x
	#if B4i
	Dim p As Panel = getLeftPanel
	If mLeftPanel.Left = -mSideWidth And x > -mSideWidth Then
		p.SetShadow(xui.Color_Black, 2, 0, 0.5, True)
	Else If x = -mSideWidth Then
		p.SetShadow(0, 0, 0, 0, True)
	End If
	#End If
	If CurrentlyTouching = False Then
		If (IsOpenLeft And VisibleOffset < 0.8 * mSideWidth) Or (IsOpenLeft = False And VisibleOffset < 0.2 * mSideWidth) Then
			x = -mSideWidth
			IsOpenLeft = False
		Else
			x = 0
			IsOpenLeft = True
		End If
		VisibleOffset = mSideWidth + x
		Dim dx As Int = Abs(mLeftPanel.Left - x)
		Dim duration As Int = Max(0, 200 * dx / mSideWidth)
		If NoAnimation Then duration = 0
		mLeftPanel.SetLayoutAnimated(duration, x, 0, mLeftPanel.Width, mLeftPanel.Height)
		mDarkPanel.SetColorAnimated(duration, mDarkPanel.Color, mDarkPanel_Color)
		#if B4i
		Dim p As Panel = mDarkPanel
		p.UserInteractionEnabled = IsOpenLeft
		p = getLeftPanel
		
		#End If
	Else
		mDarkPanel.Color = mDarkPanel_Color
		mLeftPanel.Left = x
	End If
	
	CallSub(mCallBack, mEventName & "_StateChanged")
End Sub







Private Sub RightChangeOffset (x As Float, CurrentlyTouching As Boolean, NoAnimation As Boolean)
	If mRightPanelEnabled Then
		x = Max(mBasePanel.Width-mSideWidth, Min(mBasePanel.Width, x))
		Dim VisibleOffset As Int = mBasePanel.Width - x
		#if B4i
		Dim p As Panel = getRightPanel
		If mRightPanel.Right = -mSideWidth And x > -mSideWidth Then
			p.SetShadow(xui.Color_Black, 2, 0, 0.5, True)
		Else If x = -mSideWidth Then
			p.SetShadow(0, 0, 0, 0, True)
		End If
		#End If
		If CurrentlyTouching = False Then
			If (IsOpenRight And VisibleOffset < 0.8 * mSideWidth) Or (IsOpenRight = False And VisibleOffset < 0.2 * mSideWidth) Then
				x = mBasePanel.Width
				IsOpenRight = False
			Else
				x = mBasePanel.Width-mSideWidth
				IsOpenRight = True
			End If
			VisibleOffset = mBasePanel.Width - x
			Dim dx As Int = Abs(mRightPanel.Left - x)
			Dim duration As Int = Max(0, 200 * dx / mSideWidth)
			If NoAnimation Then duration = 0
			mRightPanel.SetLayoutAnimated(duration, x, 0, mRightPanel.Width, mRightPanel.Height)
			mDarkPanel.SetColorAnimated(duration, mDarkPanel.Color, mDarkPanel_Color)
			#if B4i
			Dim p As Panel = mDarkPanel
			p.UserInteractionEnabled = IsOpenRight
			p = getRightPanel
			
			#End If
		Else
			
'			mDarkPanel.Color = OffsetToColor(VisibleOffset)
			mDarkPanel.Color = mDarkPanel_Color
			mRightPanel.Left = x
		End If
	End If
End Sub



Public Sub getLeftOpen As Boolean
	Return IsOpenLeft
End Sub

Public Sub setLeftOpen (b As Boolean)
	If b = IsOpenLeft Then Return
	If b Then setRightOpen(False)
	Dim x As Float
	If b Then x = 0 Else x = -mSideWidth
	LeftChangeOffset(x, False, False)
End Sub

Public Sub getLeftPanel As B4XView
	Return mLeftPanel
End Sub

Public Sub getRightOpen As Boolean
	Return IsOpenRight
End Sub

Public Sub setRightOpen (b As Boolean)
	If mRightPanelEnabled Then
		If b = IsOpenRight Then Return
		If b Then setLeftOpen(False)
		Dim x As Float
		If b Then x = mBasePanel.Width-mSideWidth Else x = mBasePanel.Width
		RightChangeOffset(x, False, False)
	End If
End Sub

Public Sub getRightPanel As B4XView
	Return mRightPanel
End Sub

Public Sub getCenterPanel As B4XView
	Return mCenterPanel
End Sub

Public Sub Resize(Width As Int, Height As Int)
	If IsOpenLeft Then LeftChangeOffset(-mSideWidth, False, True)
	If IsOpenRight Then RightChangeOffset(Width, False, True)
	mBasePanel.SetLayoutAnimated(0, 0, 0, Width, Height)
	mLeftPanel.SetLayoutAnimated(0, mLeftPanel.Left, 0, mLeftPanel.Width, mBasePanel.Height)
	mRightPanel.SetLayoutAnimated(0, mRightPanel.Left, 0, mRightPanel.Width, mBasePanel.Height)
	mDarkPanel.SetLayoutAnimated(0, 0, 0, Width, Height)
	mCenterPanel.SetLayoutAnimated(0, 0, 0, Width, Height)
End Sub

Public Sub getGestureEnabled As Boolean
	Return mEnabled
End Sub

Public Sub setGestureEnabled (b As Boolean)
	mEnabled = b
End Sub

Public Sub getRightPanelEnabled As Boolean
	Return mRightPanelEnabled
End Sub

Public Sub setRightPanelEnabled(b As Boolean)
	mRightPanelEnabled = b
End Sub

#if OBJC
- (NSObject*) CreateRecognizer{
 	 UIPanGestureRecognizer *rec = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(action:)];
    [rec setMinimumNumberOfTouches:1];
    [rec setMaximumNumberOfTouches:1];
	return rec;
}
-(void) action:(UIPanGestureRecognizer*)rec {
	[self.bi raiseEvent:nil event:@"pan_event:" params:@[rec]];
}
#End If



