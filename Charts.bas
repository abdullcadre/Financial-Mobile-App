Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=1.80
@EndOfDesignText@
'Code module
Sub Process_Globals
	'VERSION: 1.04
	Type PieItem (Name As String, Value As Float, Color As Int) 
	Type PieData (Items As List, Target As Panel, Canvas As Canvas, GapDegrees As Int, _
		LegendTextSize As Float, LegendBackColor As Int)
	Type GraphInternal (originX As Int, zeroY As Int, originY As Int, maxY As Int, intervalX As Float, gw As Int, gh As Int)
	Type Graph (GI As GraphInternal, Title As String, YAxis As String, XAxis As String, YStart As Float, _ 
		YEnd As Float, YInterval As Float, AxisColor As Int)
	Type LinePoint (X As String, Y As Float, YArray() As Float, ShowTick As Boolean)
	Type LineData (Points As List, LinesColors As List, Target As Panel, Canvas As Canvas)
	Type BarData (Points As List, BarsColors As List, Target As Panel, Canvas As Canvas, Stacked As Boolean, BarsWidth As Int)
End Sub

#Region Bar chart methods
Sub AddBarPoint (BD As BarData, X As String, YArray() As Float)
	If BD.Points.IsInitialized = False Then 
		BD.Points.Initialize
		'Add a "dummy" point as the first point to avoid drawing on the Y axis.
		Dim b As LinePoint
		b.Initialize
		b.X = ""
		b.ShowTick = False
		BD.Points.Add(b)
	End If
	Dim b As LinePoint 'using the same structure of Line charts
	b.Initialize
	b.X = X
	b.YArray = YArray
	b.ShowTick = True
	BD.Points.Add(b)
End Sub

Sub AddBarColor(BD As BarData, Color As Int)
	If BD.BarsColors.IsInitialized = False Then BD.BarsColors.Initialize
	BD.BarsColors.Add(Color)
End Sub

Sub DrawBarsChart(G As Graph, BD As BarData, BackColor As Int)
	If BD.Points.Size = 0 Then
		ToastMessageShow("Missing bars points.", True)
		Return
	End If
	BD.Canvas.Initialize(BD.Target)
	BD.Canvas.DrawColor(BackColor)
	Dim point As LinePoint
	point = BD.Points.Get(1)
	If BD.Stacked = False Then
		drawGraph(G, BD.Canvas, BD.Target, BD.Points, True, BD.BarsWidth)
	Else
		'In stacked mode we don't need to leave space for all the bars.
		drawGraph(G, BD.Canvas, BD.Target, BD.Points, True, BD.BarsWidth / point.YArray.Length)
	End If
	'Draw bars
	
	Dim Rect As Rect
	Rect.Initialize(0, 0, 0, G.GI.originY)
	Dim numberOfBars As Int
	numberOfBars = point.YArray.Length
	'draw all bars
	For i = 1 To BD.Points.Size - 1
		point = BD.Points.Get(i)
		For a = 0 To numberOfBars - 1
			If BD.Stacked = False Then
				Rect.Left = G.GI.originX + G.GI.intervalX * i + (a - numberOfBars / 2) * BD.BarsWidth
				Rect.Right = Rect.Left + BD.BarsWidth
				If G.YStart < 0 And G.YEnd > 0 Then
					If point.YArray(a) > 0 Then
						Rect.Top = calcPointToPixel(point.YArray(a), G)
						Rect.Bottom = G.GI.zeroY
					Else
						Rect.Bottom = calcPointToPixel(point.YArray(a), G)
						Rect.Top = G.GI.zeroY
					End If
				Else
					Rect.Top = calcPointToPixel(point.YArray(a), G)
					Rect.Bottom = G.GI.originY
				End If
			Else
				Rect.Left = G.GI.originX + G.GI.intervalX * i - BD.BarsWidth / 2
				Rect.Right = Rect.Left + BD.BarsWidth
				If a = 0 Then
					Rect.Top = calcPointToPixel(0, G)
				End If
				Rect.Bottom = Rect.Top
				Rect.Top = Rect.Bottom + calcPointToPixel(point.YArray(a), G) - G.GI.originY
			End If
			BD.Canvas.DrawRect(Rect, BD.BarsColors.Get(a), True, 1dip)
		Next
	Next
	BD.Target.Invalidate
End Sub

'Draws the graph layout (not including the data)
'This method is used by Bars and Lines charts
Sub drawGraph (G As Graph, Canvas As Canvas, Target As View, Points As List, Bars As Boolean, BarsWidth As Int)
	Dim GI As GraphInternal
	G.GI = GI
	GI.Initialize
	GI.maxY = 40dip		
	GI.originX = 50dip
	GI.originY = Target.Height - 60dip
	GI.gw = Target.Width - 70dip 'graph width
	GI.gh = GI.originY - GI.maxY 'graph height
	If G.YStart < 0 And G.YEnd > 0 Then	
		GI.zeroY = GI.maxY + GI.gh * G.YEnd / (G.YEnd - G.YStart)
	Else
		GI.zeroY = GI.originY
	End If
	If Bars Then
		Dim p As LinePoint
		p = Points.Get(1)
		GI.intervalX = (GI.gw - p.YArray.Length / 2 * BarsWidth) / (Points.Size - 1)
	Else
		GI.intervalX = GI.gw / (Points.Size - 1)
	End If
	'Draw Y axis
	Canvas.DrawLine(GI.originX, GI.originY + 2dip, GI.originX, GI.maxY - 2dip, G.AxisColor, 2dip)
	For i = 0 To (G.YEnd - G.YStart) / G.Yinterval + 1
		Dim y As Int
		Dim yValue As Float
		yValue = G.YStart + G.YInterval * i
		If yValue > G.YEnd Then Continue
		y = calcPointToPixel(yValue, G)
		Canvas.DrawLine(GI.originX, y, GI.originX - 5dip, y, G.AxisColor, 2dip)
		If i < (G.YEnd - G.YStart) / G.Yinterval Then	
			Canvas.DrawLine(GI.originX, y, GI.originX + GI.gw, y, G.AxisColor, 1dip)
		Else
			Canvas.DrawLine(GI.originX, y, GI.originX + GI.gw, y, G.AxisColor, 2dip)
		End If
		Canvas.DrawText(NumberFormat(yValue, 1, 2), GI.originX - 8dip, y + 5dip,Typeface.DEFAULT, 12, G.AxisColor, "RIGHT")
	Next
	'Draw titles
	Canvas.DrawText(G.Title, Target.Width / 2, 30dip, Typeface.DEFAULT_BOLD, 15, G.AxisColor, "CENTER")
	Canvas.DrawText(G.XAxis, Target.Width / 2, GI.originY + 45dip, Typeface.DEFAULT, 14, G.AxisColor, "CENTER")
	Canvas.DrawTextRotated(G.YAxis, 15dip, Target.Height / 2, Typeface.DEFAULT, 14, G.AxisColor, "CENTER", -90)
	'Draw X axis
	Canvas.DrawLine(GI.originX, GI.originY, GI.originX + GI.gw, GI.originY, G.AxisColor, 2dip)
	For i = 0 To Points.Size - 1
		Dim p As LinePoint
		p = Points.Get(i)
		If p.ShowTick Then
			Dim x As Int
			x = GI.originX + i * GI.intervalX
			Canvas.DrawLine(x, GI.originY, x, GI.originY + 5dip, G.AxisColor, 2dip)
			If Bars = False Then 
				If i < Points.Size - 1 Then
					Canvas.DrawLine(x, GI.originY, x, GI.maxY, G.AxisColor, 1dip) 'vertical lines
				Else
					Canvas.DrawLine(x, GI.originY, x, GI.maxY, G.AxisColor, 2dip) 'last vertical line
				End If
			End If
			If p.x.Length > 0 Then
				Canvas.DrawTextRotated(p.x, x, GI.originY + 12dip, Typeface.DEFAULT, 12, G.AxisColor, "RIGHT", -45)
			End If
		End If
	Next
End Sub
#End Region

#Region Line charts related methods
Sub AddLinePoint (LD As LineData, X As String, Y As Float, ShowTick As Boolean)
	If LD.Points.IsInitialized = False Then LD.Points.Initialize
	Dim p As LinePoint
	p.Initialize
	p.X = X
	p.Y = Y
	p.ShowTick = ShowTick
	LD.Points.Add(p)
End Sub

Sub AddLineMultiplePoints(LD As LineData, X As String, YArray() As Float, ShowTick As Boolean)
	If LD.Points.IsInitialized = False Then LD.Points.Initialize
	Dim p As LinePoint
	p.Initialize
	p.X = X
	p.YArray = YArray
	p.ShowTick = ShowTick
	LD.Points.Add(p)
End Sub

Sub AddLineColor(LD As LineData, Color As Int)
	If LD.LinesColors.IsInitialized = False Then LD.LinesColors.Initialize
	LD.LinesColors.Add(Color)
End Sub

Sub DrawLineChart(G As Graph, LD As LineData, BackColor As Int)
	If LD.Points.Size = 0 Then
		ToastMessageShow("Missing line points.", True)
		Return
	End If
	LD.Canvas.Initialize(LD.Target)
	LD.Canvas.DrawColor(BackColor)
	drawGraph(G, LD.Canvas, LD.Target, LD.Points, False, 0)
	'Draw data lines
	Dim point As LinePoint
	point = LD.Points.Get(0)
	If point.YArray.Length > 0 Then
		'multiple lines
		Dim py2(point.YArray.Length) As Float
		'initialize first point
		For i = 0 To py2.Length - 1
			py2(i) = point.YArray(i)
		Next
		'draw all points
		For i = 1 To LD.Points.Size - 1
			point = LD.Points.Get(i)
			For a = 0 To py2.Length - 1
				LD.Canvas.DrawLine(G.GI.originX + G.GI.intervalX * (i - 1), calcPointToPixel(py2(a), G), G.GI.originX + G.GI.intervalX * i, calcPointToPixel(point.YArray(a), G), LD.LinesColors.Get(a), 2dip)
				py2(a) = point.YArray(a)
			Next
		Next
	Else
		'Single line
		Dim py As Float
		py = point.Y
		For i = 1 To LD.Points.Size - 1
			point = LD.Points.Get(i)
			LD.Canvas.DrawLine(G.GI.originX + G.GI.intervalX * (i - 1), calcPointToPixel(py, G) _
				, G.GI.originX + G.GI.intervalX * i, calcPointToPixel(point.Y, G), LD.LinesColors.Get(0), 2dip)
			py = point.Y
		Next
	End If
	LD.Target.Invalidate
End Sub

Sub calcPointToPixel(py As Float, G As Graph) As Int
	If G.YStart < 0 AND G.YEnd > 0 Then
		Return G.GI.zeroY - (G.GI.originY - G.GI.maxY) * py / (G.YEnd - G.YStart)
	Else
		Return G.GI.originY - (G.GI.originY - G.GI.maxY) * (py - G.YStart) / (G.YEnd - G.YStart)
	End If
End Sub
#End Region

#Region  Pie related methods
Sub AddPieItem(PD As PieData, Name As String, Value As Float, Color As Int)
	If PD.Items.IsInitialized = False Then PD.Items.Initialize
	If Color = 0 Then Color = Colors.RGB(Rnd(0, 255), Rnd(0, 255), Rnd(0, 255))
	Dim i As PieItem
	i.Initialize
	i.Name = Name
	i.Value = Value
	i.Color = Color
	PD.Items.Add(i)
End Sub

Sub DrawPie (PD As PieData, BackColor As Int, CreateLegendBitmap As Boolean) As Bitmap
	If PD.Items.Size = 0 Then
		ToastMessageShow("Missing pie values.", True)
		Return
	End If
	PD.Canvas.Initialize(PD.Target)
	PD.Canvas.DrawColor(BackColor)
	Dim Radius As Int
	Radius = Min(PD.Canvas.Bitmap.Width, PD.Canvas.Bitmap.Height) * 0.8 / 2
	Dim total As Int
	For i = 0 To PD.Items.Size - 1
		Dim it As PieItem
		it = PD.Items.Get(i)
		total = total + it.Value
	Next
	Dim startingAngle As Float
	startingAngle = 0
	Dim GapDegrees As Int
	If PD.Items.Size = 1 Then GapDegrees = 0 Else GapDegrees = PD.GapDegrees
	For i = 0 To PD.Items.Size - 1
		Dim it As PieItem
		it = PD.Items.Get(i)
		startingAngle = startingAngle + _ 
			calcSlice(PD.Canvas, Radius, startingAngle, it.Value / total, it.Color, GapDegrees)
	Next
	PD.Target.Invalidate
	If CreateLegendBitmap Then
		Return createLegend(PD)
	Else
		Return Null
	End If
End Sub

'Draws a single slice
Sub calcSlice(Canvas As Canvas, Radius As Int, _ 
		StartingDegree As Float, Percent As Float, Color As Int, GapDegrees As Int) As Float
	Dim b As Float
	b = 360 * Percent
	
	Dim cx, cy As Int
	cx = Canvas.Bitmap.Width / 2
	cy = Canvas.Bitmap.Height / 2 
	Dim p As Path
	p.Initialize(cx, cy)
	Dim gap As Float
	gap = Percent * GapDegrees / 2
	For i = StartingDegree + gap To StartingDegree + b - gap Step 10
		p.LineTo(cx + 2 * Radius * SinD(i), cy + 2 * Radius * CosD(i))
	Next
	p.LineTo(cx + 2 * Radius * SinD(StartingDegree + b - gap), cy + 2 * Radius * CosD(StartingDegree + b - gap))
	p.LineTo(cx, cy)
	Canvas.ClipPath(p) 'We are limiting the drawings to the required slice
	Canvas.DrawCircle(cx, cy, Radius, Color, True, 0)
	Canvas.RemoveClip
	Return b
End Sub

Sub createLegend(PD As PieData) As Bitmap
	Dim bmp As Bitmap
	If PD.LegendTextSize = 0 Then PD.LegendTextSize = 15
	Dim textHeight, textWidth As Float
	textHeight = PD.Canvas.MeasureStringHeight("M", Typeface.DEFAULT_BOLD, PD.LegendTextSize)
	For i = 0 To PD.Items.Size - 1
		Dim it As PieItem
		it = PD.Items.Get(i)
		textWidth = Max(textWidth, PD.Canvas.MeasureStringWidth(it.Name, Typeface.DEFAULT_BOLD, PD.LegendTextSize))
	Next
	bmp.InitializeMutable(textWidth + 20dip, 10dip +(textHeight + 10dip) * PD.Items.Size)
	Dim c As Canvas
	c.Initialize2(bmp)
	c.DrawColor(PD.LegendBackColor)
	For i = 0 To PD.Items.Size - 1
		Dim it As PieItem
		it = PD.Items.Get(i)
		c.DrawText(it.Name, 10dip, (i + 1) * (textHeight + 5dip), Typeface.DEFAULT_BOLD, PD.LegendTextSize, _
			it.Color, "LEFT")
	Next
	Return bmp
End Sub
#End Region




