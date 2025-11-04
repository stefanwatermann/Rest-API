#tag Class
Protected Class NotFoundResponse
Implements RestApi.IApiResponse
	#tag Method, Flags = &h0, Description = 52657475726E7320687474702D73746174757320343034
		Sub Constructor(content as string)
		  Self.Content = content
		  Self.ContentType = RestApi.ContentType.text_plain.StringValue
		  Self.HttpStatus = 404
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetContentBody() As string
		  return self.Content
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetContentType() As string
		  return self.ContentType
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetHttpStatus() As integer
		  Return self.HttpStatus
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetResponseHeaders() As string()
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Content As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ContentType As string = "text/plain"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private HttpStatus As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ResponseHeader As Variant
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
	#tag EndViewBehavior
End Class
#tag EndClass
