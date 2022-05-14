#tag Module
Protected Module Extensions
	#tag Method, Flags = &h0
		Function Sanitize(Extends value As String) As String
		  value = value.ReplaceAll("<", "&lt;")
		  value = value.ReplaceAll(">", "&gt;")
		  Return value
		End Function
	#tag EndMethod


End Module
#tag EndModule
