#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Sub Opening(args() as String)
		  GlobalGame = New MultiplayerGame
		  AddHandler GlobalGame.NewState, WeakAddressOf NewStateHandler
		  GlobalGame.RestartGame
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub NewStateHandler(sender As MultiplayerGame, newState As MultiplayerGame.States)
		  Select Case newState
		  Case MultiplayerGame.States.InProgress
		    Var players() As MultiplayerGamePlayer = GlobalGame.GetAllPlayers
		    Var idsToRemove() As String
		    
		    For Each player As MultiplayerGamePlayer In players
		      If SessionWithIdentifier(player.Id) = Nil Then idsToRemove.Add(player.Id)
		    Next
		    
		    For Each id As String In idsToRemove
		      GlobalGame.RemovePlayer(id)
		    Next
		  End Select
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		GlobalGame As MultiplayerGame
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
