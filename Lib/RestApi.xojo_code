#tag Module
 Attributes ( "@Version" = "1.0.10", "@Copyright" = "(c) 2023 - watermann-it.de", "@Guid" = "44F4F2FA-2A86-4640-B3C6-C24914E2F933", "@Author" = "Stefan Watermann", "@Description" = "Create REST API services with XOJO. Fix multiple call of controller-methods. V1.0.6: additional Content-Types", "@PackageUrl" = "https://github.com/stefanwatermann/Rest-API" ) Protected Module RestApi
	#tag Method, Flags = &h0
		Sub AddLine(extends s() as string, line as string)
		  s.Add(line + EndOfLine)
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1, Description = 5573656420666F72206D6574686F647320746861742077696C6C2068616E646C652052455354207265717565737473
		Protected Delegate Function ApiRequestHandlerDelegate(params as Dictionary) As RestApi.IApiResponse
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function StringValue(extends e as RestApi.ContentType) As string
		  // return readable string from HttpMethod enum value
		  
		  Select Case e
		    
		  Case RestApi.ContentType.text_plain
		    Return "text/plain"
		    
		  Case RestApi.ContentType.text_json
		    Return "text/json"
		    
		  Case RestApi.ContentType.text_xml
		    Return "text/xml"
		    
		  Case RestApi.ContentType.application_xml
		    Return "application/xml"
		    
		  Case RestApi.ContentType.application_json
		    Return "application/json"
		    
		  Case RestApi.ContentType.application_base64
		    Return "application/base64"
		    
		  Case RestApi.ContentType.image_png
		    Return "image/png"
		    
		  Case RestApi.ContentType.image_jpg
		    Return "image/jpeg"
		    
		  Case RestApi.ContentType.text_html
		    Return "text/html"
		    
		  Case RestApi.ContentType.application_pdf
		    Return "application/pdf"
		    
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue(extends e as RestApi.HttpMethod) As string
		  // return readable string from HttpMethod enum value
		  
		  Select Case e
		    
		  Case RestApi.HttpMethod.GET
		    Return "GET"
		    
		  Case RestApi.HttpMethod.POST
		    Return "POST"
		    
		  Case RestApi.HttpMethod.PUT
		    Return "PUT"
		    
		  Case RestApi.HttpMethod.DELETE
		    Return "DELETE"
		    
		  Case RestApi.HttpMethod.HEAD
		    Return "HEAD"
		    
		  Case RestApi.HttpMethod.PATCH
		    Return "PATCH"
		    
		  Case RestApi.HttpMethod.TRACE
		    Return "TRACE"
		    
		  End
		End Function
	#tag EndMethod


	#tag Note, Name = Copyright
		(c) 2025 - watermann-it.de (Germany) - all rights reserved.
		
	#tag EndNote

	#tag Note, Name = History
		v1.0.10 - 2023-11-08
		--------------------
		- Uncomplete Swagger Integration removed
		
		v1.0.9 - 2023-10-02
		-------------------
		- New EventHandler "HandleNoneApiRequest", called if a regular we requst has been made and not an Api request.
		 
		
	#tag EndNote

	#tag Note, Name = License
		MIT License
		
		Copyright (c) 2025 Stefann Watermann
		
		Permission is hereby granted, free of charge, to any person obtaining a copy
		of this software and associated documentation files (the "Software"), to deal
		in the Software without restriction, including without limitation the rights
		to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
		copies of the Software, and to permit persons to whom the Software is
		furnished to do so, subject to the following conditions:
		
		The above copyright notice and this permission notice shall be included in all
		copies or substantial portions of the Software.
		
		THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
		IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
		FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
		AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
		LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
		OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
		SOFTWARE.
		
	#tag EndNote

	#tag Note, Name = Readme
		Rest-API
		--------
		
		Create RESTful services with XOJO.
		
	#tag EndNote

	#tag Note, Name = Usage
		On App level
		------------
		 - replace Super WebApplication by "RestApi.ApiApplication" class.
		
		 - Implement event "ApiStartup" and register ApiController classes
		
		  e.g.
		   ApiStartup()
		     Self.RegisterApi(GetTypeInfo(PingApi))
		
		
		ApiController 
		-------------
		   Add class and set Super to RestApi.ApiController
		
		   Implement event "ControllerStatup"
		     e.g.
		      ControllerStartup()
		        Using RestApi
		        Self.AddRequestHandler(HttpMethod.GET, "/", AddressOf Self.Get)
		
		   Add request-handler methods 
		
		Protected Function Get(params as Dictionary) As RestApi.IApiResponse
		  Using RestApi
		  
		  Var json As New JSONItem
		  json.Value("apiVersion") = app.LongVersion
		  json.Value("serverDate") = DateTime.now.ToString
		  
		  Return New OkResponse(json)
		End Function
	#tag EndNote


	#tag Enum, Name = AuthResult, Type = Integer, Flags = &h0
		undefined
		  permitted
		denied
	#tag EndEnum

	#tag Enum, Name = ContentType, Type = Integer, Flags = &h0
		text_plain
		  text_json
		  text_xml
		  application_xml
		  application_json
		  application_base64
		  image_png
		  image_jpg
		  text_html
		application_pdf
	#tag EndEnum

	#tag Enum, Name = HttpMethod, Type = Integer, Flags = &h0
		GET
		  PUT
		  POST
		  DELETE
		  HEAD
		  PATCH
		TRACE
	#tag EndEnum


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
End Module
#tag EndModule
