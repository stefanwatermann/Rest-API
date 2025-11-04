#tag Interface
Protected Interface IApiDocumentationGenerator
	#tag Method, Flags = &h0
		Sub Constructor(title as string, version as string, description as string)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GenerateDocumentation(app as RestApi.ApiApplication) As string
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetApiClientPath() As string
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetApiDocumentationMimeType() As string
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetApiDocumentationPath() As string
		  
		End Function
	#tag EndMethod


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
End Interface
#tag EndInterface
