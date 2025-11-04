#tag Class
Protected Class ApiController
	#tag Method, Flags = &h1
		Protected Sub AddRequestHandler(method as RestApi.HttpMethod, relativeApiPath as string, handlerDelegate as RestApi.ApiRequestHandlerDelegate, responseType as Introspection.TypeInfo, summary as string = "", description as string = "")
		  Using RestApi
		  
		  If relativeApiPath.EndsWith("/") Then relativeApiPath = relativeApiPath.Left(relativeApiPath.Length - 2)
		  
		  Var handlerDef As New ApiRequestHandlerDef
		  handlerDef.Method = method
		  handlerDef.RequestPath = ApiRootPath + relativeApiPath
		  handlerDef.RequestHandlerMethod = handlerDelegate
		  handlerDef.ResponseType = responseType
		  handlerDef.Description = description
		  handlerdef.Summary = summary
		  
		  Self.RequestHandler.Add(handlerDef)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub AddRequestHandler(method as RestApi.HttpMethod, relativeApiPath as string, handlerDelegate as RestApi.ApiRequestHandlerDelegate, summary as string = "", description as string = "")
		  Using RestApi
		  
		  If relativeApiPath.EndsWith("/") Then relativeApiPath = relativeApiPath.Left(relativeApiPath.Length - 2)
		  
		  Var handlerDef As New ApiRequestHandlerDef
		  handlerDef.Method = method
		  handlerDef.RequestPath = ApiRootPath + relativeApiPath
		  handlerDef.RequestHandlerMethod = handlerDelegate
		  handlerDef.ResponseType = Nil
		  handlerDef.Description = description
		  handlerdef.Summary = summary
		  
		  Self.RequestHandler.Add(handlerDef)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Authorize() As RestApi.AuthResult
		  Return RaiseEvent Authorize
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ControllerStartup()
		  RaiseEvent ControllerStartup
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Authorize() As RestApi.AuthResult
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ControllerStartup()
	#tag EndHook


	#tag Property, Flags = &h0
		ApiRootPath As string
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentRequestHandler As RestApi.ApiRequestHandlerDef
	#tag EndProperty

	#tag Property, Flags = &h0
		Request As WebRequest
	#tag EndProperty

	#tag Property, Flags = &h0
		RequestHandler() As RestApi.ApiRequestHandlerDef
	#tag EndProperty

	#tag Property, Flags = &h0
		Response As WebResponse
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
