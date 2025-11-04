#tag Class
Protected Class TestApi
Inherits RestApi.ApiController
	#tag Event
		Function Authorize() As RestApi.AuthResult
		  If Self.Request.Header("X-API-KEY") = "ThisIsMySecureApiKey" Then
		    Return RestApi.AuthResult.permitted
		  Else
		    Return RestApi.AuthResult.denied
		  end
		End Function
	#tag EndEvent

	#tag Event
		Sub ControllerStartup()
		  Using RestApi
		  
		  // register request handler methods
		  Self.AddRequestHandler(HttpMethod.GET, "/", AddressOf Get)
		  
		  Self.AddRequestHandler(HttpMethod.GET, "/{name}", AddressOf GetName)
		  
		  Self.AddRequestHandler(HttpMethod.POST, "/", AddressOf Post)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Get(params as Dictionary) As RestApi.IApiResponse
		  Using RestApi
		  
		  // handles GET requests to /api/test
		  
		  Var json As New JSONItem
		  json.Value("Name") = "Willi"
		  json.Value("Email") = "willi@bla.com"
		  
		  Return new OkResponse(json)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetName(params as Dictionary) As RestApi.IApiResponse
		  Using RestApi
		  
		  // Handles GET requests To /api/test/{name}
		  
		  Var name As String = params.Value("name").StringValue
		  
		  Var json As New JSONItem
		  json.Value("Name") = name
		  json.Value("Email") = name + "@bla.com"
		  
		  Return New OkResponse(json)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Post(params as Dictionary) As RestApi.IApiResponse
		  Using RestApi
		  
		  // handles POST requests to /api/test
		  
		  Var pict As New Picture(200, 200, 32)
		  pict.Graphics.DrawingColor = &c4F8F0000
		  pict.Graphics.FillRectangle(0, 0, pict.Graphics.Width, pict.Graphics.Height)
		  pict.Graphics.DrawingColor = &cFFFC7900
		  pict.Graphics.DrawText("Hello", 50, 50)
		  
		  Var data As MemoryBlock = pict.ToData(Picture.Formats.PNG)
		  Var s As String = EncodeBase64(data, 0)
		  
		  Return new OkResponse(s, ContentType.application_base64)
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
		#tag ViewProperty
			Name="ApiRootPath"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
