#tag Class
Protected Class MultiplayerGame
	#tag Method, Flags = &h0
		Sub AddPlayer(player As MultiplayerGamePlayer)
		  For index As Integer = 0 To Players.LastIndex
		    If Players(index).Id = player.Id Then Return
		  Next index
		  
		  Players.Add(player)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAllPlayers() As MultiplayerGamePlayer()
		  Return Players
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPlayer(playerId As String) As MultiplayerGamePlayer
		  For index As Integer = 0 To Players.LastIndex
		    Var player As MultiplayerGamePlayer = Players(index)
		    If player.Id = playerId Then Return player
		  Next index
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemovePlayer(playerId As String)
		  For index As Integer = Players.LastIndex DownTo 0
		    Var player As MultiplayerGamePlayer = Players(index)
		    If player.Id <> playerId Then Continue
		    
		    Players.RemoveAt(index)
		    Return
		  Next index
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RestartGame()
		  For index As Integer = Players.LastIndex DownTo 0
		    Var player As MultiplayerGamePlayer = Players(index)
		    player.Score = 0
		    player.Attempts = 0
		    player.BestAttempt = "⬜️⬜️⬜️⬜️⬜️"
		    player.CompletedAt = Nil
		  Next index
		  
		  State = States.WaitingForPlayers
		  Var now As DateTime = DateTime.Now
		  StartTime = now.AddInterval(0, 0, 0, 0, 0, 30)
		  FinishTime = now.AddInterval(0, 0, 0, 0, 3, 30)
		  
		  PeriodicTimer = New Timer
		  AddHandler PeriodicTimer.Action, WeakAddressOf TimerActionHandler
		  PeriodicTimer.Period = 1000
		  PeriodicTimer.RunMode = Timer.RunModes.Multiple
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TimerActionHandler(sender As Timer)
		  Var now As DateTime = DateTime.Now
		  Var diff As DateInterval
		  Var diffSeconds As Integer = FinishTime.SecondsFrom1970 - now.SecondsFrom1970
		  
		  If now <= StartTime Then
		    diff = StartTime - now
		    RemainingTimeLabelText = "Game will begin in: " + diff.Minutes.ToString("00") + ":" + diff.Seconds.ToString("00")
		    State = MultiplayerGame.States.WaitingForPlayers
		    Return
		  End If
		  
		  diff = FinishTime - now
		  RemainingTimeLabelText = "Time to guess the word: " + diff.Minutes.ToString("00") + ":" + diff.Seconds.ToString("00")
		  
		  Select Case diffSeconds
		  Case Is > 0
		    State = MultiplayerGame.States.InProgress
		  Case Is <= 0
		    State = MultiplayerGame.States.Finished
		    If diffSeconds <= -5 Then
		      RestartGame
		    End If
		  End Select
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private FinishTime As DateTime
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mState As States = States.WaitingForPlayers
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PeriodicTimer As Timer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Players() As MultiplayerGamePlayer
	#tag EndProperty

	#tag Property, Flags = &h0
		RemainingTimeLabelText As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private StartTime As DateTime
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
			End Set
		#tag EndSetter
		State As States
	#tag EndComputedProperty


	#tag Enum, Name = States, Type = Integer, Flags = &h0
		WaitingForPlayers
		  Starting
		  InProgress
		Finished
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="mState"
			Visible=false
			Group="Behavior"
			InitialValue="States.WaitingForPlayers"
			Type="States"
			EditorType="Enum"
			#tag EnumValues
				"0 - WaitingForPlayers"
				"1 - Starting"
				"2 - InProgress"
				"3 - Finished"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass