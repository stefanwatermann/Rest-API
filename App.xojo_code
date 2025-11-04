#tag Class
Protected Class App
Inherits RestApi.ApiApplication
	#tag Event
		Sub ApiStartup()
		  Using RestApi
		  
		  // set api root path
		  Self.ApiRootPath = "api"
		  
		  // register api controller classes
		  Self.RegisterApi(GetTypeInfo(PingApi))
		  Self.RegisterApi(GetTypeInfo(TestApi))
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function Authenticate(request as WebRequest) As RestApi.AuthResult
		  Using RestApi
		  
		  // uncomment below to activate Basic authentication on App level
		  // each ApiController can have its own Authorization setting.
		  // sample request: curl -H "Authorization: Basic SGVsbG86V29ybGQ="  localhost:8080/api/pig
		  If request.Header("Authorization") = "Basic " + Self.DefaultAuthHeader Then
		    Return AuthResult.permitted
		  Else
		    Return AuthResult.denied
		  end
		End Function
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  // TODO handle errors
		End Function
	#tag EndEvent


	#tag Note, Name = Readme
		Sample App to demonstrate how to use the RestApi.
		See Lib/RestApi/Notes for more details...
		
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Var v As String = _
			  Str(app.MajorVersion) + "." + _
			  Str(app.MinorVersion) + "." + _
			  Str(app.BugVersion) + "." + _
			  Str(app.NonReleaseVersion)
			  
			  Return v
			  
			End Get
		#tag EndGetter
		LongVersion As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Var v As String = _
			  Str(app.MajorVersion) + "." + _
			  Str(app.MinorVersion) + "." + _
			  Str(app.BugVersion)
			  
			  Return v
			  
			End Get
		#tag EndGetter
		ShortVersion1 As string
	#tag EndComputedProperty


	#tag Constant, Name = DefaultAuthHeader, Type = String, Dynamic = False, Default = \"SGVsbG86V29ybGQ\x3D", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="ApiRootPath"
			Visible=false
			Group="Behavior"
			InitialValue="api"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShortVersion1"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LongVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
