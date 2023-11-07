#tag WebContainerControl
Begin WebContainer GameGridWithKeyboard
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   Enabled         =   True
   Height          =   620
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
   Width           =   420
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebPagePanel StatesPanel
      ControlCount    =   0
      ControlID       =   ""
      Enabled         =   True
      Height          =   620
      Index           =   -2147483648
      Indicator       =   ""
      LayoutDirection =   0
      LayoutType      =   0
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      PanelCount      =   2
      Scope           =   2
      SelectedPanelIndex=   0
      TabIndex        =   0
      Tooltip         =   ""
      Top             =   0
      Visible         =   True
      Width           =   420
      _mDesignHeight  =   0
      _mDesignWidth   =   0
      _mPanelIndex    =   -1
      Begin WebLabel GameWillStartSoonLabel
         Bold            =   False
         ControlID       =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   42.0
         Height          =   135
         Index           =   -2147483648
         indicator       =   0
         Italic          =   False
         Left            =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         Multiline       =   True
         PanelIndex      =   "0"
         Parent          =   "StatesPanel"
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "The next game will begin soon."
         TextAlignment   =   2
         TextColor       =   &c000000FF
         Top             =   44
         Underline       =   False
         Visible         =   True
         Width           =   420
         _mPanelIndex    =   -1
      End
      Begin GameGrid Grid
         ControlCount    =   0
         ControlID       =   ""
         Enabled         =   True
         Height          =   456
         Index           =   -2147483648
         Indicator       =   0
         LayoutDirection =   0
         LayoutType      =   0
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         PanelIndex      =   "1"
         Parent          =   "StatesPanel"
         Scope           =   0
         ScrollDirection =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   20
         Visible         =   True
         Width           =   380
         _mDesignHeight  =   0
         _mDesignWidth   =   0
         _mPanelIndex    =   -1
      End
      Begin GameKeyboard Keyboard
         ControlCount    =   0
         ControlID       =   ""
         Enabled         =   True
         Height          =   120
         Index           =   -2147483648
         Indicator       =   0
         LayoutDirection =   0
         LayoutType      =   0
         Left            =   50
         LockBottom      =   True
         LockedInPosition=   False
         LockHorizontal  =   True
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         LockVertical    =   False
         PanelIndex      =   "1"
         Parent          =   "StatesPanel"
         Scope           =   0
         ScrollDirection =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   484
         Visible         =   True
         Width           =   320
         _mDesignHeight  =   0
         _mDesignWidth   =   0
         _mPanelIndex    =   -1
      End
      Begin WebLabel IntroductionLabel
         Bold            =   False
         ControlID       =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   0.0
         Height          =   179
         Index           =   -2147483648
         Indicator       =   ""
         Italic          =   False
         Left            =   89
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   True
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         Multiline       =   True
         PanelIndex      =   "0"
         Parent          =   "StatesPanel"
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "We are waiting for more players.\n\nEveryone will start at the same time and will have to guess the same word.\n\nGood luck!"
         TextAlignment   =   0
         TextColor       =   &c000000FF
         Top             =   187
         Underline       =   False
         Visible         =   True
         Width           =   243
         _mPanelIndex    =   -1
      End
      Begin WebProgressWheel WaitingForPlayersProgressWheel
         Colorize        =   False
         ControlID       =   ""
         Enabled         =   True
         Height          =   32
         Index           =   -2147483648
         Indicator       =   ""
         Left            =   194
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   True
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         PanelIndex      =   "0"
         Parent          =   "StatesPanel"
         Scope           =   0
         SVGColor        =   &c00000000
         SVGData         =   ""
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   402
         Visible         =   True
         Width           =   32
         _mPanelIndex    =   -1
      End
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Hook, Flags = &h0
		Event KeyboardPressed(caption As String)
	#tag EndHook


	#tag Property, Flags = &h21
		Private mState As States = States.Waiting
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mState
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mState = value Then Return
			  mState = value
			  StatesPanel.SelectedPanelIndex = Integer(value)
			End Set
		#tag EndSetter
		State As States
	#tag EndComputedProperty


	#tag Enum, Name = States, Type = Integer, Flags = &h0
		Waiting
		Playing
	#tag EndEnum


#tag EndWindowCode

#tag Events Keyboard
	#tag Event
		Sub Pressed(caption As String)
		  KeyboardPressed(caption)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
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
	#tag ViewProperty
		Name="State"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="States"
		EditorType="Enum"
		#tag EnumValues
			"0 - Waiting"
			"1 - Playing"
		#tag EndEnumValues
	#tag EndViewProperty
#tag EndViewBehavior
