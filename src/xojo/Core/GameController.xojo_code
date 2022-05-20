#tag Class
Protected Class GameController
Inherits WebSDKControl
	#tag Event
		Sub Closed()
		  ResetGui
		  CanContinue = False
		  UpdateControl
		End Sub
	#tag EndEvent

	#tag Event
		Function ExecuteEvent(name as string, parameters as JSONItem) As Boolean
		  If Not Enabled Then Return False
		  
		  Select Case name
		  Case "enterPressed"
		    UpdateInternalWord(parameters.Lookup("word", ""))
		    UpdateControl
		    Guess
		  Case "wordUpdated"
		    UpdateInternalWord(parameters.Lookup("word", ""))
		  End Select
		End Function
	#tag EndEvent

	#tag Event
		Function HandleRequest(Request As WebRequest, Response As WebResponse) As Boolean
		  
		End Function
	#tag EndEvent

	#tag Event
		Function JavaScriptClassName() As String
		  Return "Wordle.GameController"
		End Function
	#tag EndEvent

	#tag Event
		Sub Opening()
		  KeyStatuses = New Dictionary
		  Opening
		End Sub
	#tag EndEvent

	#tag Event
		Sub Serialize(js as JSONItem)
		  Var letters() As GridLetter = Grid.GetRowLetters(Row)
		  Var letterIds() As String
		  Var word As String
		  For Each letter As GridLetter In letters
		    letterIds.Add(If(letter <> Nil, letter.ControlID, ""))
		    word = word + If(letter <> Nil, letter.Letter, "")
		  Next
		  
		  js.Value("letters") = letterIds
		  js.Value("row") = Row
		  js.Value("can_continue") = CanContinue
		  js.Value("word") = word
		End Sub
	#tag EndEvent

	#tag Event
		Function SessionHead(session as WebSession) As String
		  
		End Function
	#tag EndEvent

	#tag Event
		Function SessionJavascriptURLs(session as WebSession) As String()
		  If SharedClassFile = Nil Then
		    SharedClassFile = WebFile.Open(SpecialFolder.Resources.Child("js").Child("WordleGameController.js"))
		    SharedClassFile.MIMEType = "text/javascript"
		    SharedClassFile.Session = Nil
		    SharedClassFile.Filename = "WordleGameController.js"
		  End If
		  
		  Return Array(SharedClassFile.URL)
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddOneLetter(caption As String, shouldUpdateControl As Boolean = True)
		  If Not CanContinue Or caption = "" Then Return
		  
		  Var letter As GridLetter = Grid.GetLetter(Row, Column)
		  If letter = Nil Then Return
		  letter.Letter = caption.Uppercase
		  letter.State = GridLetter.States.Unknown
		  Column = Min(5, Column + 1)
		  
		  If shouldUpdateControl Then
		    UpdateControl
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteOneLetter()
		  If Not CanContinue Then Return
		  
		  Column = Max(0, Column - 1)
		  Var letter As GridLetter = Grid.GetLetter(Row, Column)
		  If letter = Nil Or letter.State <> GridLetter.States.Unknown Then Return
		  letter.State = GridLetter.States.Empty
		  UpdateControl
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Guess()
		  If Not CanContinue Then Return
		  Var word As String
		  Var guessScore As Integer = 0
		  For col As Integer = 0 To 4
		    Var rowLetter As GridLetter = Grid.GetLetter(Row, col)
		    word = word + rowLetter.Letter
		  Next col
		  
		  If word.Trim.Length < 5 Then
		    ShakeRow(Row, "Not enough letters")
		    Return
		  End If
		  
		  If Not WordleDictionary.IsValidWord(word) Then
		    ShakeRow(Row, "Not in word list")
		    Return
		  End If
		  
		  Var validLetters() As String = WordToGuess.Split("")
		  Var pendingLetters() As String = WordToGuess.Split("")
		  For col As Integer = 4 DownTo 0
		    Var rowLetter As GridLetter = Grid.GetLetter(Row, col)
		    Var letter As String = rowLetter.Letter
		    If pendingLetters(col) = letter Then
		      pendingLetters.RemoveAt(col)
		    End If
		  Next col
		  
		  Var rowLetters() As GridLetter
		  For col As Integer = 0 To 4
		    Var rowLetter As GridLetter = Grid.GetLetter(Row, col)
		    Var letter As String = rowLetter.Letter
		    rowLetters.Add(rowLetter)
		    Var newValue As String = If(validLetters.IndexOf(rowLetter.Letter) = -1, "failed", "miss")
		    Var newState As GridLetter.States
		    If rowLetter.Letter = validLetters(col) Then
		      newValue = "correct"
		    End If
		    
		    Select Case newValue
		    Case "correct"
		      newState = GridLetter.States.Correct
		      guessScore = guessScore + 10
		    Case "failed"
		      newState = GridLetter.States.Failed
		    Case "miss"
		      newState = If(pendingLetters.IndexOf(letter) <> -1, GridLetter.States.Miss, GridLetter.States.Failed)
		      guessScore = guessScore + 4
		    End Select
		    
		    Var indexToRemove As Integer = pendingLetters.IndexOf(letter)
		    If indexToRemove <> -1 Then pendingLetters.RemoveAt(indexToRemove)
		    rowLetter.State = newState
		    
		    Var currentKeyStatus As String = KeyStatuses.Lookup(letter, "unknown")
		    If currentKeyStatus <> "correct" Then KeyStatuses.Value(letter) = newValue
		  Next col
		  
		  RefreshKeyboard
		  
		  Row = Row + 1
		  Column = 0
		  
		  If word = WordToGuess Then guessScore = guessScore + 50
		  guessScore = guessScore - Attempts.Count
		  
		  Var attemptSquares As String = ""
		  For Each letter As GridLetter In rowLetters
		    Select Case letter.State
		    Case GridLetter.States.Correct
		      attemptSquares = attemptSquares + "🟩"
		    Case GridLetter.States.Miss
		      attemptSquares = attemptSquares + "🟨"
		    Else
		      attemptSquares = attemptSquares + "⬜️"
		    End Select
		  Next
		  
		  If guessScore > BestGuessScore Then
		    BestGuessScore = guessScore
		    BestAttempt = attemptSquares
		  End If
		  
		  Guess(BestGuessScore, BestAttempt)
		  Attempts.Add(attemptSquares)
		  UpdateControl
		  
		  If word = WordToGuess Then
		    CanContinue = False
		    WordDiscovered
		    Return
		  End If
		  
		  If Row > 5 Then
		    CanContinue = False
		    GameOver
		    Return
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RefreshKeyboard()
		  Var newGreenKeys As Integer = 0
		  Var newYellowKeys As Integer = 0
		  
		  For Each keyEntry As DictionaryEntry In KeyStatuses
		    Var key As String = keyEntry.Key
		    key = key.Uppercase
		    Var value As String = keyEntry.Value
		    
		    Var newState As GameKeyboardKey.States
		    Select Case value
		    Case "correct"
		      newState = GameKeyboardKey.States.Correct
		      newGreenKeys = newGreenKeys + 1
		    Case "miss"
		      newState = GameKeyboardKey.States.Miss
		      newYellowKeys = newYellowKeys + 1
		    Case "failed"
		      newState = GameKeyboardKey.States.Failed
		    Else
		      newState = GameKeyboardKey.States.Default
		    End Select
		    
		    Keyboard.GetKey(key).State = newState
		  Next keyEntry
		  
		  GreenKeys = newGreenKeys
		  YellowKeys = newYellowKeys
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetGui()
		  Attempts.RemoveAll
		  BestAttempt = "⬜️⬜️⬜️⬜️⬜️"
		  BestGuessScore = 0
		  GreenKeys = 0
		  YellowKeys = 0
		  
		  Row = 0
		  Column = 0
		  For r As Integer = 0 To 5
		    For c As Integer = 0 To 4
		      Var letter As GridLetter = Grid.GetLetter(r, c)
		      letter.Letter = ""
		      letter.State = GridLetter.States.Unknown
		    Next c
		  Next r
		  
		  For Each keyEntry As DictionaryEntry In KeyStatuses
		    KeyStatuses.Value(keyEntry.Key) = "unknown"
		  Next keyEntry
		  RefreshKeyboard
		  UpdateControl
		  
		  CanContinue = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShakeRow(row As Integer, reason As String)
		  Var script() As String
		  Var letters() As GridLetter = Grid.GetRowLetters(row)
		  For Each letter As GridLetter In letters
		    script.Add("XojoWeb.getNamedControl('" + ControlID + "').shakeLetter('" + letter.ControlID + "');")
		  Next
		  
		  Var letterControlId As String = letters(2).ControlID
		  script.Add("XojoWeb.getNamedControl('" + ControlID + "').showTooltip('" + letterControlId +"', '" + reason + "');")
		  
		  ExecuteJavaScript(String.FromArray(script))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateInternalWord(word As String)
		  Column = 0
		  Var chars() As String = word.Split("")
		  For i As Integer = 0 To 4
		    AddOneLetter(If(chars.LastIndex >= i, chars(i), ""), False)
		  Next
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event GameOver()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Guess(bestScore As Integer, bestAttempt As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Opening()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event WordDiscovered()
	#tag EndHook


	#tag Property, Flags = &h0
		Attempts() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		BestAttempt As String = "⬜️⬜️⬜️⬜️⬜️"
	#tag EndProperty

	#tag Property, Flags = &h0
		BestGuessScore As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CanContinue As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Column As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Enabled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		GreenKeys As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Grid As GameGrid
	#tag EndProperty

	#tag Property, Flags = &h0
		Keyboard As GameKeyboard
	#tag EndProperty

	#tag Property, Flags = &h21
		Private KeyStatuses As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Row As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared SharedClassFile As WebFile
	#tag EndProperty

	#tag Property, Flags = &h0
		WordToGuess As String
	#tag EndProperty

	#tag Property, Flags = &h0
		YellowKeys As Integer = 0
	#tag EndProperty


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
			Name="_mName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Group="Appearance"
			InitialValue=""
			Type="Boolean"
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
			Name="WordToGuess"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GreenKeys"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="YellowKeys"
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
			Name="BestGuessScore"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
