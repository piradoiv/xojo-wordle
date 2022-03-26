#tag WebContainerControl
Begin WebContainer GameGrid
   Compatibility   =   ""
   ControlID       =   ""
   Enabled         =   True
   Height          =   456
   Indicator       =   0
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   LockVertical    =   False
   ScrollDirection =   0
   TabIndex        =   0
   Top             =   0
   Visible         =   True
   Width           =   380
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mName          =   ""
   _mPanelIndex    =   -1
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  LayoutType = LayoutTypes.Flex
		  LayoutDirection = LayoutDirections.LeftToRight
		  
		  Var letterSize As Integer = Me.Width / 5
		  
		  Letters = New Dictionary
		  For row As Integer = 0 To 5
		    For col As Integer = 0 To 4
		      Var letter As New GridLetter
		      letter.State = GridLetter.States.Empty
		      letter.EmbedWithin(Self, letterSize, letterSize)
		      letter.Style.AddTransition("background-color", 0.25)
		      letter.Style.AddTransition("color", 0.25)
		      Letters.Value(row.ToString + "_" + col.ToString) = letter
		    Next col
		  Next row
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function GetLetter(row As Integer, col As Integer) As GridLetter
		  Var key As String = row.ToString + "_" + col.ToString
		  If Letters.HasKey(key) Then
		    Return Letters.Value(key)
		  End If
		  
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShakeRow(row As Integer, reason As String = "")
		  Const duration = 60
		  Var script() As String
		  Var js As String
		  Var easing As String = "swing"
		  
		  For col As Integer = 0 To 4
		    Var letter As GridLetter = GetLetter(row, col)
		    Var control As String = "$('#" + letter.ControlID + "')"
		    script.Add(control + ".clearQueue();")
		    For i As Integer = 0 To 8
		      Var newLeft As Integer = System.Random.InRange(-10, 10)
		      Var newTop As Integer = System.Random.InRange(-10, 10)
		      Var position As String = "{left: '" + newLeft.ToString + "', top: '" + newTop.ToString + "'}"
		      script.Add(control + ".animate(" + position + ", " + Str(duration) + ", '" + easing + "');")
		    Next i
		    script.Add(control + ".animate({left: '0', top: '0'}, " + Str(duration) + ", '" + easing + "');")
		    script.Add(js)
		  Next col
		  
		  If reason <> "" Then
		    Var letter As GridLetter = GetLetter(row, 2)
		    Var control As String = "$('#" + letter.ControlID + "')"
		    script.Add(control + ".off('hidden.bs.tooltip');")
		    script.Add(control + ".on('hidden.bs.tooltip', () => " + control + ".tooltip('dispose'));")
		    script.Add(control + ".tooltip({title: '" + reason + "'});")
		    script.Add(control + ".tooltip('show');")
		    script.Add("setTimeout(() => " + control + ".tooltip('hide'), 2000);")
		  End If
		  
		  ExecuteJavaScript(String.FromArray(script))
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Letters As Dictionary
	#tag EndProperty


#tag EndWindowCode

#tag ViewBehavior
	#tag ViewProperty
		Name="_mPanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue="-1"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockHorizontal"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockVertical"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignHeight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignWidth"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mName"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ScrollDirection"
		Visible=true
		Group="Behavior"
		InitialValue="ScrollDirections.None"
		Type="WebContainer.ScrollDirections"
		EditorType="Enum"
		#tag EnumValues
			"0 - None"
			"1 - Horizontal"
			"2 - Vertical"
			"3 - Both"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Visual Controls"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Indicator"
		Visible=false
		Group="Visual Controls"
		InitialValue=""
		Type="WebUIControl.Indicators"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Primary"
			"2 - Secondary"
			"3 - Success"
			"4 - Danger"
			"5 - Warning"
			"6 - Info"
			"7 - Light"
			"8 - Dark"
			"9 - Link"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutType"
		Visible=true
		Group="View"
		InitialValue="LayoutTypes.Fixed"
		Type="LayoutTypes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Fixed"
			"1 - Flex"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutDirection"
		Visible=true
		Group="View"
		InitialValue="LayoutDirections.LeftToRight"
		Type="LayoutDirections"
		EditorType="Enum"
		#tag EnumValues
			"0 - LeftToRight"
			"1 - RightToLeft"
			"2 - TopToBottom"
			"3 - BottomToTop"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=false
		Group=""
		InitialValue="250"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=false
		Group=""
		InitialValue="250"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
