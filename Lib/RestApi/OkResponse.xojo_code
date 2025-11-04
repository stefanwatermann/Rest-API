#tag Class
Protected Class OkResponse
Implements RestApi.IApiResponse
	#tag Method, Flags = &h0, Description = 52657475726E7320687474702D7374617475732032303020616E6420636F6E74656E742D7479706520546578742F706C61696E
		Sub Constructor()
		  Self.Content = ""
		  Self.ContentType = RestApi.ContentType.text_plain.StringValue
		  Self.HttpStatus = 200
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320687474702D7374617475732032303020616E6420636F6E74656E742D7479706520546578742F706C61696E
		Sub Constructor(json as JSONItem)
		  Self.Content = json.ToString
		  Self.ContentType = RestApi.ContentType.application_json.StringValue
		  Self.HttpStatus = 200
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(doc as PDFDocument)
		  Self.Content = doc.ToData
		  Self.ContentType = RestApi.ContentType.application_pdf.StringValue
		  Self.HttpStatus = 200
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320687474702D7374617475732032303020616E6420636F6E74656E742D7479706520546578742F706C61696E
		Sub Constructor(content as string)
		  Self.Content = content
		  Self.ContentType = RestApi.ContentType.text_plain.StringValue
		  Self.HttpStatus = 200
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320687474702D7374617475732032303020616E6420636F6E74656E742D7479706520546578742F706C61696E
		Sub Constructor(content as string, contentType as RestApi.ContentType)
		  Self.Content = content
		  Self.ContentType = contentType.StringValue
		  Self.HttpStatus = 200
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(content as string, headers() as string)
		  Self.Content = content
		  Self.ContentType = RestApi.ContentType.text_plain.StringValue
		  Self.HttpStatus = 200
		  self.ResponseHeader = headers
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320687474702D7374617475732032303020616E6420636F6E74656E742D7479706520546578742F706C61696E
		Sub Constructor(content as string, contentType as string)
		  Self.Content = content
		  Self.ContentType = contentType
		  Self.HttpStatus = 200
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
		  If Self.ResponseHeader.IsArray Then
		    Var a() As String = Self.ResponseHeader
		    Return a
		  End
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
