#tag Class
Protected Class ApiApplication
Inherits WebApplication
	#tag CompatibilityFlags = ( TargetWeb and ( Target32Bit or Target64Bit ) )
	#tag Event
		Function HandleURL(request As WebRequest, response As WebResponse) As Boolean
		  // handle api requests
		  If Request.Path.BeginsWith(ApiRootPath + "/") Then
		    
		    // return error 500 if no api-handler has been configured
		    If Self.Controllers.Count = 0 Then
		      Response.Write("No ApiHandler configured at all.")
		      Response.Status = 500
		      Return True
		    End
		    
		    // find api-handler and hand-over request
		    For Each cntrlReg As RestApi.ApiControllerDef In Self.Controllers
		      If Request.Path.BeginsWith(cntrlReg.ApiRootPath) Then
		        InvokeApiController(cntrlReg, request, response)
		        Return True
		      End
		    Next
		    
		    // no api-handler found
		    Response.Status = 404
		    Response.Write("No ApiHandler found for resource path.")
		    Return True
		    
		  End
		  
		  Return RaiseEvent HandleNoneApiUrl(Request, Response)
		End Function
	#tag EndEvent

	#tag Event
		Sub Opening(args() As String)
		  MakeDemon(args)
		  
		  RaiseEvent ApiStartup
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function Authenticate(request as WebRequest) As RestApi.AuthResult
		  return RaiseEvent Authenticate(request)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ExecuteRequestHandler(request As WebRequest, response As WebResponse, handlerDef As ApiRequestHandlerDef)
		  System.Log(System.LogLevelInformation, "Path '" + handlerDef.RequestPath + "' called by Agent '" + request.Header("User-Agent") + "'")
		  
		  Var controllerSections() As String = handlerDef.RequestPath.Split("/")
		  Var requestSections() As String = request.Path.Split("/")
		  Var querySections() As String = request.QueryString.Split("&")
		  
		  Var r As IApiResponse = handlerDef.RequestHandlerMethod.invoke(GetParameter(controllerSections, requestSections, querySections))
		  
		  If r <> Nil Then
		    response.Reset
		    For Each header As String In r.GetResponseHeaders
		      Var elem() As String = header.Split(":")
		      response.Header(elem(0)) = elem(1)
		    Next
		    response.Status = r.GetHttpStatus
		    response.Write(r.GetContentBody)
		    response.MIMEType = r.GetContentType
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetControllerInstance(cntrlDef as RestApi.ApiControllerDef) As RestApi.ApiController
		  Using RestApi
		  
		  Var constructors() As Introspection.ConstructorInfo = cntrlDef.ControllerType.GetConstructors()
		  Var instance As Variant = constructors(0).Invoke()
		  Var cntrl As ApiController = instance
		  
		  cntrl.ApiRootPath = cntrlDef.ApiRootPath
		  cntrl.ControllerStartup
		  
		  Return cntrl
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetParameter(controllerSections() as String, requestSections() as string, querySections() as string) As Dictionary
		  Using RestApi
		  
		  Var d As New Dictionary
		  
		  Var i As Integer = 0
		  For Each section As String In requestSections
		    If i < controllerSections.Count And _
		      controllerSections(i).BeginsWith("{") And _
		      controllerSections(i).EndsWith("}") Then
		      d.Value(controllerSections(i).Replace("{", "").Replace("}", "")) = section
		    Else
		      d.Value(i) = section
		    End
		    i = i + 1
		  Next
		  
		  For Each query As String In querySections
		    Var item() As String = query.Split("=")
		    d.Value(item(0)) = item(1)
		  Next
		  
		  Return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InvokeApiController(cntrlDef as RestApi.ApiControllerDef, request as WebRequest, response as WebResponse)
		  Using RestApi
		  
		  Try
		    
		    // check authentication
		    If Self.Authenticate(request) = AuthResult.denied Then
		      response.Reset
		      response.Status = 401
		      response.Write("unauthorized")
		      response.MIMEType = ContentType.text_plain.StringValue
		      Return
		    End
		    
		    // initialize Api-Controller
		    Var cntrl As ApiController = GetControllerInstance(cntrlDef)
		    
		    cntrl.Request = request
		    cntrl.Response = response
		    
		    // return status 405 if no handler implements http method or current request
		    If Not RequestedMethodImplemented(cntrl) Then
		      response.Reset
		      response.Status = 405
		      response.Write("method not allowed")
		      response.MIMEType = ContentType.text_plain.StringValue
		      Return
		    End
		    
		    // has controller authorized current request?
		    If cntrl.Authorize = AuthResult.denied Then
		      response.Reset
		      response.Status = 403
		      response.Write("unauthorized request")
		      response.MIMEType = ContentType.text_plain.StringValue
		      Return
		    End
		    
		    // request-handler that matches the current url
		    Var matchingApiHandler As ApiRequestHandlerDef
		    
		    // find matching request-handler
		    For Each handlerDef As ApiRequestHandlerDef In cntrl.RequestHandler
		      //cntrl.CurrentRequestHandler = handlerDef
		      
		      If IsMatchingRoute(request, handlerDef) Then
		        
		        If matchingApiHandler <> Nil Then
		          Raise New RuntimeException("Current path matches to more than one route, don't know which to call.")
		        End
		        
		        matchingApiHandler = handlerDef
		      End
		    Next
		    
		    If matchingApiHandler = Nil Then
		      Raise New RuntimeException("Current path does not match to any route.")
		    End
		    
		    ExecuteRequestHandler(request, response, matchingApiHandler)
		    
		  Catch err As RuntimeException
		    response.Reset
		    response.Status = 500
		    response.Write("server error (" + err.Message + ")")
		    response.MIMEType = ContentType.text_plain.StringValue
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsMatchingRoute(request as WebRequest, handlerDef as ApiRequestHandlerDef) As boolean
		  Var cntrlSections() As String = handlerDef.RequestPath.Split("/")
		  Var requestSections() As String = request.Path.Split("/")
		  
		  Var handlerPath As String = handlerDef.RequestPath
		  Var handlerMethod As String = handlerDef.Method.StringValue
		  
		  Var requestPath As String = request.Path
		  Var requestMethod As String = request.Method
		  
		  System.DebugLog("request: " + requestMethod + " " + requestPath + ", handler: " + handlerMethod + " " + handlerPath)
		  
		  If requestSections.Count = cntrlSections.Count And RequestMethod = handlerMethod Then
		    
		    Var sectionMatching() As Boolean
		    
		    For i As Integer = 0 To requestSections.Count - 1
		      If requestSections(i) = cntrlSections(i) Or _
		        (cntrlSections(i).BeginsWith("{") And cntrlSections(i).EndsWith("}")) Then
		        sectionMatching.Add(True)
		      End
		    Next 
		    
		    If sectionMatching.Count = cntrlSections.Count Then
		      For Each match As Boolean In sectionMatching
		        If Not match Then
		          Return False
		        End
		      Next
		      
		      Return True
		    End
		    
		  End
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MakeDemon(args() as string)
		  #If Not DebugBuild Then // Do not try to daemonize a debug build
		    If args.Count > 1 Then
		      If (args(1) = "start" Or args(1) = "-d") Then // Check for command-line parameter to daemonize
		        If Not App.Daemonize Then
		          System.Log( System.LogLevelCritical, "Could not daemonize the app.")
		          Quit (-1)
		        End If
		      End If
		    End
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RegisterApi(controllerType as Introspection.TypeInfo)
		  Var path As String = ApiRootPath + "/" + controllerType.Name.Replace("api", "")
		  Self.RegisterApi(path, controllerType)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RegisterApi(apiRootPath as string, controllerType as Introspection.TypeInfo)
		  Var crtlReg As New RestApi.ApiControllerDef 
		  crtlReg.ApiRootPath = apiRootPath
		  crtlReg.ControllerType = controllerType
		  
		  Self.Controllers.Add(crtlReg)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RequestedMethodImplemented(cntrl as RestApi.ApiController) As Boolean
		  Using RestApi
		  
		  For Each handlerDef As ApiRequestHandlerDef In cntrl.RequestHandler
		    If handlerDef.Method.StringValue = cntrl.Request.Method Then
		      Return True
		    End
		  Next
		  
		  Return False
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ApiStartup()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Authenticate(request as WebRequest) As RestApi.AuthResult
	#tag EndHook

	#tag Hook, Flags = &h0
		Event HandleNoneApiUrl(Request as WebRequest, Response as WebResponse) As Boolean
	#tag EndHook


	#tag Property, Flags = &h0, Description = 526F6F7420656C656D656E74206F66207468652041504920706174682C2064656661756C742069732022617069222E
		ApiRootPath As String = "api"
	#tag EndProperty

	#tag Property, Flags = &h0
		Controllers() As ApiControllerDef
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ApiRootPath"
			Visible=false
			Group="Behavior"
			InitialValue="api"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
