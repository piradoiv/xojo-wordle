#tag WebPage
Begin WebPage MultiplayerGameWebPage
   AllowTabOrderWrap=   True
   Compatibility   =   ""
   ControlID       =   ""
   Enabled         =   False
   Height          =   938
   ImplicitInstance=   True
   Index           =   -2147483648
   Indicator       =   0
   IsImplicitInstance=   False
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   LockVertical    =   False
   MinimumHeight   =   630
   MinimumWidth    =   960
   TabIndex        =   0
   Title           =   "Multiplayer Wordle"
   Top             =   0
   Visible         =   True
   Width           =   1026
   _ImplicitInstance=   False
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebRectangle Rectangle1
      BackgroundColor =   &cFFFFFF00
      ControlID       =   ""
      Enabled         =   True
      HasBackgroundColor=   False
      Height          =   725
      Index           =   -2147483648
      Indicator       =   ""
      LayoutDirection =   0
      LayoutType      =   0
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   True
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Scope           =   0
      TabIndex        =   8
      Tooltip         =   ""
      Top             =   140
      Visible         =   True
      Width           =   986
      _mDesignHeight  =   0
      _mDesignWidth   =   0
      _mPanelIndex    =   -1
      Begin WebLabel PlayerPositionLabel
         Bold            =   False
         ControlID       =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   0.0
         Height          =   38
         Index           =   -2147483648
         Indicator       =   ""
         Italic          =   False
         Left            =   40
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         Multiline       =   False
         Parent          =   "Rectangle1"
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Your position: n/a"
         TextAlignment   =   2
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   160
         Underline       =   False
         Visible         =   True
         Width           =   380
         _mPanelIndex    =   -1
      End
      Begin GameGrid Grid
         ControlID       =   ""
         Enabled         =   True
         Height          =   456
         Index           =   "-2147483648"
         Indicator       =   0
         LayoutDirection =   0
         LayoutType      =   0
         Left            =   40
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         Parent          =   "Rectangle1"
         Scope           =   2
         ScrollDirection =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   206
         Visible         =   True
         Width           =   380
         _mDesignHeight  =   0
         _mDesignWidth   =   0
         _mPanelIndex    =   -1
      End
      Begin WebLabel GameRankingLabel
         Bold            =   False
         ControlID       =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   0.0
         Height          =   38
         Index           =   -2147483648
         Indicator       =   ""
         Italic          =   False
         Left            =   440
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         Multiline       =   False
         Parent          =   "Rectangle1"
         Scope           =   2
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Current game ranking:"
         TextAlignment   =   2
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   160
         Underline       =   False
         Visible         =   True
         Width           =   546
         _mPanelIndex    =   -1
      End
      Begin WebListBox PlayerListBox
         ColumnCount     =   5
         ColumnWidths    =   "0%,0%,0%,0%,0%"
         ControlID       =   ""
         Enabled         =   True
         HasHeader       =   True
         Height          =   630
         HighlightSortedColumn=   True
         Index           =   -2147483648
         Indicator       =   ""
         InitialValue    =   "Score	Name	Best Attempt	Attempts	Games Won"
         LastAddedRowIndex=   0
         Left            =   440
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         LockVertical    =   False
         NoRowsMessage   =   ""
         Parent          =   "Rectangle1"
         ProcessingMessage=   ""
         RowCount        =   0
         RowSelectionType=   0
         Scope           =   2
         SearchCriteria  =   ""
         SelectedRowColor=   &c0272D300
         SelectedRowIndex=   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   206
         Visible         =   True
         Width           =   546
         _mPanelIndex    =   -1
      End
      Begin GameKeyboard Keyboard
         ControlID       =   ""
         Enabled         =   True
         Height          =   120
         Index           =   "-2147483648"
         Indicator       =   0
         LayoutDirection =   0
         LayoutType      =   0
         Left            =   40
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         Parent          =   "Rectangle1"
         Scope           =   2
         ScrollDirection =   0
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   686
         Visible         =   True
         Width           =   380
         _mDesignHeight  =   0
         _mDesignWidth   =   0
         _mPanelIndex    =   -1
      End
   End
   Begin WebLabel RemainingTimeLabel
      Bold            =   True
      ControlID       =   ""
      Enabled         =   True
      FontName        =   "Courier New"
      FontSize        =   30.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   2
      TabIndex        =   3
      Text            =   "Remaining Time: --:--"
      TextAlignment   =   2
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   80
      Underline       =   False
      Visible         =   True
      Width           =   986
      _mPanelIndex    =   -1
   End
   Begin GameController Controller
      BestAttempt     =   "⬜️⬜️⬜️⬜️⬜️"
      BestGuessScore  =   0
      ControlID       =   ""
      Enabled         =   False
      GreenKeys       =   0
      Index           =   -2147483648
      LockedInPosition=   False
      Scope           =   2
      WordToGuess     =   ""
      YellowKeys      =   0
      _mPanelIndex    =   -1
   End
   Begin MultiplayerWordleToolbar PageToolbar
      ControlID       =   ""
      Enabled         =   True
      FullWidth       =   False
      Height          =   56
      Index           =   -2147483648
      Indicator       =   0
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Position        =   0
      Scope           =   2
      TabIndex        =   4
      Title           =   ""
      Tooltip         =   ""
      Top             =   0
      Visible         =   True
      Width           =   1026
      _mPanelIndex    =   -1
   End
   Begin WebTimer RefreshPlayerListTimer
      ControlID       =   ""
      Enabled         =   True
      Index           =   -2147483648
      Location        =   1
      LockedInPosition=   False
      Period          =   2500
      RunMode         =   2
      Scope           =   0
      _mPanelIndex    =   -1
   End
   Begin WebTimer SecondsTimer
      ControlID       =   ""
      Enabled         =   True
      Index           =   -2147483648
      Location        =   1
      LockedInPosition=   False
      Period          =   500
      RunMode         =   2
      Scope           =   2
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Event
		Sub Opening()
		  Controller.Keyboard = Keyboard
		  Controller.Grid = Grid
		  Controller.WordToGuess = WordleDictionary.GetRandomWord
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub RefreshPlayerList()
		  Var players() As MultiplayerGamePlayer = App.GlobalGame.GetAllPlayers
		  
		  For index As Integer = PlayerListBox.RowCount - 1 DownTo 0
		    Var rowPlayer As MultiplayerGamePlayer = PlayerListBox.RowTagAt(index)
		    For Each player As MultiplayerGamePlayer In players
		      If player.Id = rowPlayer.Id Then Continue For index
		    Next
		    PlayerListBox.RemoveRowAt(index)
		  Next
		  
		  For Each player As MultiplayerGamePlayer In players
		    For index As Integer = PlayerListBox.RowCount - 1 DownTo 0
		      Var rowPlayer As MultiplayerGamePlayer = PlayerListBox.RowTagAt(index)
		      If rowPlayer.Id <> player.Id Then Continue For index
		      
		      PlayerListBox.CellTextAt(index, 0) = player.Score.ToString
		      PlayerListBox.CellTextAt(index, 1) = player.Name
		      PlayerListBox.CellTextAt(index, 2) = player.BestAttempt
		      PlayerListBox.CellTextAt(index, 3) = player.Attempts.ToString + "/6"
		      PlayerListBox.CellTextAt(index, 4) = If(player.GamesWon > 0, "🏆 ", "") + player.GamesWon.ToString
		      Continue For player
		    Next index
		    
		    PlayerListBox.AddRow(player.Score.ToString, player.Name, player.BestAttempt, _
		    player.Attempts.ToString, If(player.GamesWon > 0, "🏆 ", "") + player.GamesWon.ToString)
		    PlayerListBox.RowTagAt(PlayerListBox.LastAddedRowIndex) = player
		  Next player
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RefreshPlayerPosition()
		  Var playerPosition As Integer = 0
		  
		  For index As Integer = PlayerListBox.RowCount - 1 DownTo 0
		    Var player As MultiplayerGamePlayer = PlayerListBox.RowTagAt(index)
		    If player.Id <> Session.Player.Id Then Continue
		    
		    playerPosition = index + 1
		    PlayerPositionLabel.Text = "Your position: " + If(player.Score = 0, "n/a", playerPosition.ToString)
		    Return
		  Next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CurrentState As MultiplayerGame.States = MultiplayerGame.States.Finished
	#tag EndProperty


#tag EndWindowCode

#tag Events PlayerListBox
	#tag Event
		Sub Opening()
		  PlayerListBox.ColumnSortDirectionAt(0) = WebListBox.SortDirections.Descending
		  RefreshPlayerList
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Keyboard
	#tag Event
		Sub Pressed(caption As String)
		  If Not Grid.Enabled Then Return
		  
		  Select Case caption
		  Case GameKeyboardKey.kEnterCaption
		    Controller.Guess
		  Case GameKeyboardKey.kDeleteCaption
		    Controller.DeleteOneLetter
		  Else
		    Controller.AddOneLetter(caption)
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Controller
	#tag Event
		Sub GameOver()
		  MessageBox("Game over! The next game will start soon.")
		End Sub
	#tag EndEvent
	#tag Event
		Sub Guess(bestScore As Integer, bestAttempt As String)
		  Session.Player.Attempts = Session.Player.Attempts + 1
		  Session.Player.BestAttempt = bestAttempt
		  Session.Player.Score = bestScore
		  Session.Player.AttemptSquares = Controller.Attempts
		End Sub
	#tag EndEvent
	#tag Event
		Sub WordDiscovered()
		  MessageBox("Nice one! the word was: " + Me.WordToGuess + ".")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RefreshPlayerListTimer
	#tag Event
		Sub Run()
		  RefreshPlayerList
		  RefreshPlayerPosition
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SecondsTimer
	#tag Event
		Sub Run()
		  Var state As MultiplayerGame.States = App.GlobalGame.State
		  Var shouldEnable As Boolean = state = MultiplayerGame.States.InProgress
		  
		  If CurrentState <> state And state = MultiplayerGame.States.WaitingForPlayers Then
		    Var winner As MultiplayerGamePlayer = App.GlobalGame.LastWinner
		    If winner <> Nil Then
		      MessageBox(If(winner.Id = Session.Player.Id, "You", winner.Name) + " won this game!" + _
		      EndOfLine + EndOfLine + "The word was '" + Controller.WordToGuess + "'." + _
		      EndOfLine + String.FromArray(winner.AttemptSquares, EndOfLine))
		    End If
		  End If
		  CurrentState = state
		  
		  If Controller.Enabled <> shouldEnable Then
		    Controller.ResetGui
		    Controller.Enabled = shouldEnable
		    Controller.WordToGuess = App.GlobalGame.WordToGuess
		  End If
		  
		  If Grid.Enabled <> shouldEnable Then
		    Grid.Enabled = shouldEnable
		  End If
		  
		  If RemainingTimeLabel.Text = App.GlobalGame.RemainingTimeLabelText Then Return
		  RemainingTimeLabel.Text = App.GlobalGame.RemainingTimeLabelText
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.Period = System.Random.InRange(250, 450)
		End Sub
	#tag EndEvent
#tag EndEvents
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
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
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
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutType"
		Visible=true
		Group="Behavior"
		InitialValue="LayoutTypes.Fixed"
		Type="LayoutTypes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Fixed"
			"1 - Flex"
		#tag EndEnumValues
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
		Name="MinimumHeight"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_ImplicitInstance"
		Visible=false
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
		Name="IsImplicitInstance"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabOrderWrap"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
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
		Name="LayoutDirection"
		Visible=true
		Group="WebView"
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
		Name="CurrentState"
		Visible=false
		Group="Behavior"
		InitialValue="MultiplayerGame.States.Finished"
		Type="MultiplayerGame.States"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
