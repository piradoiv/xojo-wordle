#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Sub Closed()
		  stdout.WriteLine(CurrentMethodName)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function HandleURL(Request As WebRequest, Response As WebResponse) As Boolean
		  stdout.WriteLine(CurrentMethodName)
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Opening(args() as String)
		  #If Not DebugBuild
		    Call Daemonize
		  #Endif
		  
		  GlobalGame = New MultiplayerGame
		  AddHandler GlobalGame.NewState, WeakAddressOf NewStateHandler
		  GlobalGame.RestartGame
		End Sub
	#tag EndEvent

	#tag Event
		Sub Pausing()
		  stdout.WriteLine(CurrentMethodName)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resumed()
		  stdout.WriteLine(CurrentMethodName)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Stopping(ShuttingDown as Boolean)
		  stdout.WriteLine(CurrentMethodName)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(Error As RuntimeException) As Boolean
		  stdout.WriteLine("-----")
		  stdout.WriteLine(CurrentMethodName)
		  stdout.WriteLine(error.Message)
		  stdout.WriteLine(String.FromArray(error.Stack))
		  For Each frame As StackFrame In Error.StackFrames
		    stdout.WriteLine(frame.Name)
		  Next frame
		  stdout.WriteLine("-----")
		End Function
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
