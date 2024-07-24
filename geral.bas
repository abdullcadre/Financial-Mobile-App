B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=9.3
@EndOfDesignText@
'Sub Process_Globals
'	Private xui As XUI
''	Dim access As Accessibility
'	Dim provider As FileProvider
'End Sub
'
'
'Sub SetStatusNavBarColor(statusbarcolor As Int, navcolor As Int)
'	Dim p As Phone
'	If p.SdkVersion > 20 Then
'		Dim jo As JavaObject
'		jo.InitializeContext
'		Dim window As JavaObject = jo.RunMethodJO("getWindow", Null)
'		window.RunMethod("addFlags", Array (0x80000000))
'		window.RunMethod("clearFlags", Array (0x04000000))
'		window.RunMethod("setStatusBarColor", Array(statusbarcolor))
'		window.RunMethod("setNavigationBarColor", Array(navcolor))
'	End If	
'End Sub
'
'Sub IsEmail(EmailAddress As String) As Boolean
'	Dim MatchEmail As Matcher = Regex.Matcher("^(?i)[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])$", EmailAddress)
'	If MatchEmail.Find = True Then
'		Log(MatchEmail.Match)
'		Return True
'	Else
'		Return False
'	End If
'End Sub
'
'Sub ver(FileName As String)
'	provider.Initialize
'	File.Copy(File.DirInternal, FileName, provider.SharedFolder, FileName)
'	Dim in As Intent
'	in.Initialize(in.ACTION_VIEW, "")
'	provider.SetFileUriAsIntentData(in, FileName)
'	'Type must be set after calling SetFileUriAsIntentData
'	in.SetType("application/pdf")
'	StartActivity(in)
'End Sub
'
'Sub alertViews(panel As B4XView, edittextv As EditText)
'	panel.SetColorAndBorder(Colors.Transparent,1dip,Colors.Red,40dip)
'	edittextv.HintColor=Colors.Red
'	edittextv.TextColor=Colors.Red
'	Sleep(1500)
'	panel.SetColorAndBorder(Colors.Transparent,1dip,0xff101114,40dip)
'	edittextv.HintColor=0xff101114
'	edittextv.TextColor=0xff101114
'End Sub
'
'  
'Sub colordarkIconsStatusbar'(dar as ARGBColor)
'	Dim jo As JavaObject
'	jo.InitializeContext
'	Dim window As JavaObject = jo.RunMethodJO("getWindow", Null)
'	Dim view As JavaObject = window.RunMethodJO("getDecorView",Null)
'	view.RunMethod("setSystemUiVisibility",Array(Bit.Or(0x00002000,view.RunMethod("getSystemUiVisibility",Null))))
'End Sub
'  
'  
'  Sub colorLigthIconsStatusbar
'	Dim jo As JavaObject
'	jo.InitializeContext
'	Dim window As JavaObject = jo.RunMethodJO("getWindow", Null)
'	Dim view As JavaObject = window.RunMethodJO("getDecorView",Null)
'	view.RunMethod("setSystemUiVisibility",Array(0))	
'End Sub
'
' 
' Public Sub RippleEffectFromCenter (Parent As B4XView, Color As Int, Duration As Int)
'	Dim cvs As B4XCanvas
'	Dim p As B4XView = xui.CreatePanel("")
'	Dim InnerRadius As Int = Max(Parent.Width, Parent.Height) * 1.20
'	p.SetLayoutAnimated(0, 0, 0, InnerRadius, InnerRadius)
'	cvs.Initialize(p)
'	cvs.DrawCircle(cvs.TargetRect.CenterX, cvs.TargetRect.CenterY, cvs.TargetRect.Width / 2, Color, True, 0)
'	cvs.Invalidate
'	cvs.Release
'	Dim bmp As B4XBitmap = cvs.CreateBitmap
'	p.RemoveViewFromParent
'	Dim iv As ImageView
'	iv.Initialize("")
'	Dim p As B4XView = iv
'	Dim Radius As Int = InnerRadius/2
'	Dim x As Int = Parent.Width/2
'	Dim y As Int = Parent.Height/2
'	p.SetBitmap(bmp)
'	Parent.AddView(p, x, y, 0, 0)
'	p.SetLayoutAnimated(Duration , x - Radius, y - Radius, Radius * 2, Radius * 2)
'	p.SetVisibleAnimated(Duration , False)
'	Sleep(Duration )
'	p.RemoveViewFromParent
'End Sub
'
''
''AJUSTA OS FOTOS PARA NÃO FICAREM ESTICADOS
'Sub AjustaImageView(Imv As ImageView, FileName As String)
'	Private bmp As B4XBitmap = LoadBitmap(File.DirAssets, FileName)
'	Dim Delta, Height, Width As Int
'	If bmp.Width / bmp.Height > Imv.Width / Imv.Height Then
'		Height = bmp.Height / bmp.Width * Imv.Width
'		Delta = (Imv.Height - Height) / 2
'		Imv.Height = Height
'		Imv.Top = Imv.Top + Delta
'	Else
'		Width = bmp.Width / bmp.Height * Imv.Height
'		Delta = (Imv.Width - Width) / 2
'		Imv.Width = Width
'		Imv.Left = Imv.Left + Delta
'	End If
'	Imv.Gravity = Gravity.FILL	
'	Imv.Bitmap = bmp
'End Sub
'''AJUSTA OS FOTOS PARA NÃO FICAREM ESTICADOS
''Sub AjustaImageView2(Imv As ImageView, FileName As String)
''	Private bmp As B4XBitmap = LoadBitmap(File.DirInternal, FileName)
''	Dim Delta, Height, Width As Int
''	If bmp.Width / bmp.Height > Imv.Width / Imv.Height Then
''		Height = bmp.Height / bmp.Width * Imv.Width
''		Delta = (Imv.Height - Height) / 2
''		Imv.Height = Height
''		Imv.Top = Imv.Top + Delta
''	Else
''		Width = bmp.Width / bmp.Height * Imv.Height
''		Delta = (Imv.Width - Width) / 2
''		Imv.Width = Width
''		Imv.Left = Imv.Left + Delta
''	End If
''	Imv.Gravity = Gravity.FILL	
''	Imv.Bitmap = bmp
''End Sub
'Public Sub CreateRoundRectBitmap (Input As Bitmap, Radius As Float) As B4XBitmap
'	Dim BorderColor As Int = xui.Color_Transparent
'	Dim BorderWidth As Int = 4dip
'	Dim c As B4XCanvas
'	Dim xview As B4XView = xui.CreatePanel("")
'	xview.SetLayoutAnimated(0, 0, 0, Input.Width, Input.Height)
'	c.Initialize(xview)
'	Dim path As B4XPath
'	path.InitializeRoundedRect(c.TargetRect, Radius)
'	c.ClipPath(path)
'	c.DrawRect(c.TargetRect, BorderColor, True, BorderWidth) 'border
'	c.RemoveClip
'	Dim r As B4XRect
'	r.Initialize(BorderWidth, BorderWidth, c.TargetRect.Width - BorderWidth, c.TargetRect.Height - BorderWidth)
'	path.InitializeRoundedRect(r, Radius - 0.7 * BorderWidth)
'	c.ClipPath(path)
'	c.DrawBitmap(Input, r)
'	c.RemoveClip
'	c.Invalidate
'	Dim res As B4XBitmap = c.CreateBitmap
'	c.Release
'	Return res
'End Sub
'
'
'
''AJUSTA OS FOTOS PARA NÃO FICAREM ESTICADOS
'Sub AdjustImageViewPanel(Imv As Panel, FileName As String)
'	Private bmp As B4XBitmap = LoadBitmap(File.DirAssets, FileName)
''	Dim Delta, Height, Width As Int
''	If bmp.Width / bmp.Height > Imv.Width / Imv.Height Then
''		Height = bmp.Height / bmp.Width * Imv.Width
''		Delta = (Imv.Height - Height) / 2
''		Imv.Height = Height
''		Imv.Top = Imv.Top + Delta
''	Else
''		Width = bmp.Width / bmp.Height * Imv.Height
''		Delta = (Imv.Width - Width) / 2
''		Imv.Width = Width
''		Imv.Left = Imv.Left + Delta
''	End If
'''	Imv.Gravity = Gravity.FILL	
'	Imv.Tag=FileName
'	Imv.SetBackgroundImage( bmp)
'End Sub
'
'
'Sub RotatePanelY(panel As Panel, degreesY As Float)
'	Dim joPanel As JavaObject = panel
'	Dim camera As JavaObject
'	Dim matrix As JavaObject
'
'	' Crie um objeto Camera para aplicar a rotação
'	camera.InitializeNewInstance("android.graphics.Camera", Null)
'
'	' Crie um objeto Matrix para aplicar a transformação ao painel
'	matrix.InitializeNewInstance("android.graphics.Matrix", Null)
'
'	' Defina a rotação ao longo do eixo Y
'	camera.RunMethod("rotateY", Array(degreesY))
'
'	' Aplique a rotação à matriz
'	camera.RunMethod("getMatrix", Array(matrix))
'
'	' Defina o ponto de pivô para a rotação no centro do painel
'	Dim centerX As Float = panel.Width / 2
'	Dim centerY As Float = panel.Height / 2
'	matrix.RunMethod("preTranslate", Array(-centerX, -centerY))
'	matrix.RunMethod("postTranslate", Array(centerX, centerY))
'
'	' Aplique a matriz de transformação ao painel
'	joPanel.RunMethod("setAnimationMatrix", Array(matrix))
'End Sub
'
'
'Sub ImageWithTopCorners (bmp As B4XBitmap, iv As B4XView, Radius As Int)
'	Dim bc As BitmapCreator
'	bc.Initialize(iv.Width, iv.Height)
'	Dim brush As BCBrush = bc.CreateBrushFromBitmap(bmp)
'	Dim rect As B4XRect
'	rect.Initialize(0, 0, bc.mWidth - 1, bc.mHeight)
'	bc.DrawRectRounded2(rect, brush, True, 0, Radius)
'	rect.Initialize(0, bc.mHeight - Radius, bc.mWidth, bc.mHeight)
'	bc.DrawRect2(rect, brush, True, 0)
'	bc.SetBitmapToImageView(bc.Bitmap, iv)
'End Sub
'
'
'Sub SetPanelGradientRightLeft(panel As Panel, colorStart As Int, colorEnd As Int)
'	' Crie um objeto GradientDrawable
'	Dim gradient As GradientDrawable
'	gradient.Initialize("LEFT_RIGHT", Array As Int(colorStart, colorEnd)) ' Defina a orientação e as cores do gradiente
'	' Aplique o gradiente ao plano de fundo do painel
'	panel.Background = gradient
'End Sub
''
'Sub darkiconnav 
'	' Defina a visibilidade do sistema para os ícones da barra de navegação como "dark"
'	Dim flags As Int
'	flags = Bit.Or(flags, 0x00000010) ' Adiciona a flag View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR
'
'	' Obtenha o decorView da página atual
''	Dim decorView As JavaObject = Root1.GetView
'	
'	Dim jo As JavaObject
'	jo.InitializeContext
'	Dim window As JavaObject = jo.RunMethodJO("getWindow", Null)
'	Dim view As JavaObject = window.RunMethodJO("getDecorView",Null)
'	view.RunMethod("setSystemUiVisibility",Array(flags))
'	
''	decorView.RunMethod("setSystemUiVisibility", Array(flags))
'End Sub
'
'
'Sub dividirdata(data As String) As Object()
''	
'
'	' Dividir a data em partes
'	Dim partes() As String
'	partes = Regex.Split("/", data)
'
'	' Extrair o dia, mês e ano
'	Dim dia As Int
'	Dim mes As Int
'	Dim ano As Int
'
'	dia = partes(0) ' O dia está na primeira posição do array
'	mes = partes(1) ' O mês está na segunda posição do array
'	ano = partes(2) ' O ano está na terceira posição do array
''
''	' Exibir os valores
''	Log("Dia: " & dia)
''	Log("Mês: " & mes)
''	Log("Ano: " & ano)
'
'	Return Array As Object(dia, mes, ano)
'End Sub
'




Sub Process_Globals
	Private xui As XUI
	'    Dim access As Accessibility
	Dim provider As FileProvider
End Sub

' Sets the status bar and navigation bar colors
Sub SetStatusNavBarColor(statusbarcolor As Int, navcolor As Int)
	Dim p As Phone
	If p.SdkVersion > 20 Then
		Dim jo As JavaObject
		jo.InitializeContext
		Dim window As JavaObject = jo.RunMethodJO("getWindow", Null)
		window.RunMethod("addFlags", Array (0x80000000))
		window.RunMethod("clearFlags", Array (0x04000000))
		window.RunMethod("setStatusBarColor", Array(statusbarcolor))
		window.RunMethod("setNavigationBarColor", Array(navcolor))
	End If
End Sub

' Validates if an email address is in the correct format
Sub IsEmail(EmailAddress As String) As Boolean
	Dim MatchEmail As Matcher = Regex.Matcher("^(?i)[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])$", EmailAddress)
	If MatchEmail.Find = True Then
		Log(MatchEmail.Match)
		Return True
	Else
		Return False
	End If
End Sub

' Opens a PDF file using an external viewer
Sub view(FileName As String)
	provider.Initialize
	File.Copy(File.DirInternal, FileName, provider.SharedFolder, FileName)
	Dim in As Intent
	in.Initialize(in.ACTION_VIEW, "")
	provider.SetFileUriAsIntentData(in, FileName)
	' Type must be set after calling SetFileUriAsIntentData
	in.SetType("application/pdf")
	StartActivity(in)
End Sub

' Alerts the user by changing the color of the panel and edit text
Sub alertViews(panel As B4XView, edittextv As EditText)
	panel.SetColorAndBorder(Colors.Transparent, 1dip, Colors.Red, 40dip)
	edittextv.HintColor = Colors.Red
	edittextv.TextColor = Colors.Red
	Sleep(1500)
	panel.SetColorAndBorder(Colors.Transparent, 1dip, 0xff101114, 40dip)
	edittextv.HintColor = 0xff101114
	edittextv.TextColor = 0xff101114
End Sub

' Sets the status bar icons to dark color
Sub colorDarkIconsStatusbar
	Dim jo As JavaObject
	jo.InitializeContext
	Dim window As JavaObject = jo.RunMethodJO("getWindow", Null)
	Dim vieww As JavaObject = window.RunMethodJO("getDecorView", Null)
	vieww.RunMethod("setSystemUiVisibility", Array(Bit.Or(0x00002000, vieww.RunMethod("getSystemUiVisibility", Null))))
End Sub

' Sets the status bar icons to light color
Sub colorLightIconsStatusbar
	Dim jo As JavaObject
	jo.InitializeContext
	Dim window As JavaObject = jo.RunMethodJO("getWindow", Null)
	Dim vieww As JavaObject = window.RunMethodJO("getDecorView", Null)
	vieww.RunMethod("setSystemUiVisibility", Array(0))
End Sub

' Creates a ripple effect from the center of the parent view
Public Sub RippleEffectFromCenter(Parent As B4XView, Color As Int, Duration As Int)
	Dim cvs As B4XCanvas
	Dim p As B4XView = xui.CreatePanel("")
	Dim InnerRadius As Int = Max(Parent.Width, Parent.Height) * 1.20
	p.SetLayoutAnimated(0, 0, 0, InnerRadius, InnerRadius)
	cvs.Initialize(p)
	cvs.DrawCircle(cvs.TargetRect.CenterX, cvs.TargetRect.CenterY, cvs.TargetRect.Width / 2, Color, True, 0)
	cvs.Invalidate
	cvs.Release
	Dim bmp As B4XBitmap = cvs.CreateBitmap
	p.RemoveViewFromParent
	Dim iv As ImageView
	iv.Initialize("")
	Dim p As B4XView = iv
	Dim Radius As Int = InnerRadius / 2
	Dim x As Int = Parent.Width / 2
	Dim y As Int = Parent.Height / 2
	p.SetBitmap(bmp)
	Parent.AddView(p, x, y, 0, 0)
	p.SetLayoutAnimated(Duration, x - Radius, y - Radius, Radius * 2, Radius * 2)
	p.SetVisibleAnimated(Duration, False)
	Sleep(Duration)
	p.RemoveViewFromParent
End Sub

' Adjusts the image view to avoid stretching the image
Sub AdjustImageView(Imv As ImageView, FileName As String)
	Private bmp As B4XBitmap = LoadBitmap(File.DirAssets, FileName)
	Dim Delta, Height, Width As Int
	If bmp.Width / bmp.Height > Imv.Width / Imv.Height Then
		Height = bmp.Height / bmp.Width * Imv.Width
		Delta = (Imv.Height - Height) / 2
		Imv.Height = Height
		Imv.Top = Imv.Top + Delta
	Else
		Width = bmp.Width / bmp.Height * Imv.Height
		Delta = (Imv.Width - Width) / 2
		Imv.Width = Width
		Imv.Left = Imv.Left + Delta
	End If
	Imv.Gravity = Gravity.FILL
	Imv.Bitmap = bmp
End Sub

' Creates a rounded rectangle bitmap
Public Sub CreateRoundRectBitmap(Input As Bitmap, Radius As Float) As B4XBitmap
	Dim BorderColor As Int = xui.Color_Transparent
	Dim BorderWidth As Int = 4dip
	Dim c As B4XCanvas
	Dim xview As B4XView = xui.CreatePanel("")
	xview.SetLayoutAnimated(0, 0, 0, Input.Width, Input.Height)
	c.Initialize(xview)
	Dim path As B4XPath
	path.InitializeRoundedRect(c.TargetRect, Radius)
	c.ClipPath(path)
	c.DrawRect(c.TargetRect, BorderColor, True, BorderWidth) ' border
	c.RemoveClip
	Dim r As B4XRect
	r.Initialize(BorderWidth, BorderWidth, c.TargetRect.Width - BorderWidth, c.TargetRect.Height - BorderWidth)
	path.InitializeRoundedRect(r, Radius - 0.7 * BorderWidth)
	c.ClipPath(path)
	c.DrawBitmap(Input, r)
	c.RemoveClip
	c.Invalidate
	Dim res As B4XBitmap = c.CreateBitmap
	c.Release
	Return res
End Sub

' Adjusts the image view in a panel to avoid stretching the image
Sub AdjustImageViewPanel(Imv As Panel, FileName As String)
	Private bmp As B4XBitmap = LoadBitmap(File.DirAssets, FileName)
	'    Dim Delta, Height, Width As Int
	'    If bmp.Width / bmp.Height > Imv.Width / Imv.Height Then
	'        Height = bmp.Height / bmp.Width * Imv.Width
	'        Delta = (Imv.Height - Height) / 2
	'        Imv.Height = Height
	'        Imv.Top = Imv.Top + Delta
	'    Else
	'        Width = bmp.Width / bmp.Height * Imv.Height
	'        Delta = (Imv.Width - Width) / 2
	'        Imv.Width = Width
	'        Imv.Left = Imv.Left + Delta
	'    End If
	'    Imv.Gravity = Gravity.FILL
	Imv.Tag = FileName
	Imv.SetBackgroundImage(bmp)
End Sub

' Rotates a panel along the Y axis
Sub RotatePanelY(panel As Panel, degreesY As Float)
	Dim joPanel As JavaObject = panel
	Dim camera As JavaObject
	Dim matrix As JavaObject

	' Create a Camera object to apply the rotation
	camera.InitializeNewInstance("android.graphics.Camera", Null)

	' Create a Matrix object to apply the transformation to the panel
	matrix.InitializeNewInstance("android.graphics.Matrix", Null)

	' Set the rotation along the Y axis
	camera.RunMethod("rotateY", Array(degreesY))

	' Apply the rotation to the matrix
	camera.RunMethod("getMatrix", Array(matrix))

	' Set the pivot point for the rotation at the center of the panel
	Dim centerX As Float = panel.Width / 2
	Dim centerY As Float = panel.Height / 2
	matrix.RunMethod("preTranslate", Array(-centerX, -centerY))
	matrix.RunMethod("postTranslate", Array(centerX, centerY))

	' Apply the transformation matrix to the panel
	joPanel.RunMethod("setAnimationMatrix", Array(matrix))
End Sub

' Applies rounded corners to the top of an image
Sub ImageWithTopCorners(bmp As B4XBitmap, iv As B4XView, Radius As Int)
	Dim bc As BitmapCreator
	bc.Initialize(iv.Width, iv.Height)
	Dim brush As BCBrush = bc.CreateBrushFromBitmap(bmp)
	Dim rect As B4XRect
	rect.Initialize(0, 0, bc.mWidth - 1, bc.mHeight)
	bc.DrawRectRounded2(rect, brush, True, 0, Radius)
	rect.Initialize(0, bc.mHeight - Radius, bc.mWidth, bc.mHeight)
	bc.DrawRect2(rect, brush, True, 0)
	bc.SetBitmapToImageView(bc.Bitmap, iv)
End Sub

' Sets a gradient background from right to left on a panel
Sub SetPanelGradientRightLeft(panel As Panel, colorStart As Int, colorEnd As Int)
	' Create a GradientDrawable object
	Dim gradient As GradientDrawable
	gradient.Initialize("LEFT_RIGHT", Array As Int(colorStart, colorEnd)) ' Set the orientation and colors of the gradient
	' Apply the gradient to the panel's background
	panel.Background = gradient
End Sub

' Sets the navigation bar icons to dark color
Sub darkIconNav
	' Set the system UI visibility to dark icons for the navigation bar
	Dim flags As Int
	flags = Bit.Or(flags, 0x00000010) ' Adds the flag View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR

	' Get the decorView of the current window
	Dim jo As JavaObject
	jo.InitializeContext
	Dim window As JavaObject = jo.RunMethodJO("getWindow", Null)
	Dim vieww As JavaObject = window.RunMethodJO("getDecorView", Null)
	vieww.RunMethod("setSystemUiVisibility", Array(flags))
End Sub

' Splits a date string into day, month, and year
Sub splitDate(data As String) As Object()
	' Split the date into parts
	Dim parts() As String
	parts = Regex.Split("/", data)

	' Extract the day, month, and year
	Dim day As Int
	Dim month As Int
	Dim year As Int

	day = parts(0) ' The day is in the first position of the array
	month = parts(1) ' The month is in the second position of the array
	year = parts(2) ' The year is in the third position of the array

	' Return the values as an array
	Return Array As Object(day, month, year)
End Sub
