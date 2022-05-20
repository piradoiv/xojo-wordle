#tag Class
Protected Class MultiplayerGamePlayer
	#tag Method, Flags = &h0
		Function Copy() As MultiplayerGamePlayer
		  Var result As New MultiplayerGamePlayer
		  result.Attempts = Attempts
		  result.AttemptSquares = AttemptSquares
		  result.BestAttempt = BestAttempt
		  result.CompletedAt = CompletedAt
		  result.GamesWon = GamesWon
		  result.Id = Id
		  result.Name = Name
		  result.Score = Score
		  
		  Return result
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Attempts As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		AttemptSquares() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		BestAttempt As String = "⬜️⬜️⬜️⬜️⬜️"
	#tag EndProperty

	#tag Property, Flags = &h0
		CompletedAt As DateTime
	#tag EndProperty

	#tag Property, Flags = &h0
		GamesWon As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Id As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Score As Integer = 0
	#tag EndProperty


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
			Name="Id"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Score"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BestAttempt"
			Visible=false
			Group="Behavior"
			InitialValue="⬜️⬜️⬜️⬜️⬜️"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Attempts"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GamesWon"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
