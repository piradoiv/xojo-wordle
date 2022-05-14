#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Sub Opening(args() as String)
		  GlobalGame = New MultiplayerGame
		  GlobalGame.RestartGame
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		GlobalGame As MultiplayerGame
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
