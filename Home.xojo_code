#tag WebPage
Begin WebPage Home
   AllowTabOrderWrap=   True
   Compatibility   =   ""
   ControlID       =   ""
   Enabled         =   False
   Height          =   400
   ImplicitInstance=   True
   Index           =   -2147483648
   Indicator       =   0
   IsImplicitInstance=   False
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   LockVertical    =   False
   MinimumHeight   =   400
   MinimumWidth    =   600
   TabIndex        =   0
   Title           =   "Untitled"
   Top             =   0
   Visible         =   True
   Width           =   600
   _ImplicitInstance=   False
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mName          =   ""
   _mPanelIndex    =   -1
   Begin WebLabel lbAppVersion
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   12.0
      Height          =   30
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   50
      LockBottom      =   False
      LockedInPosition=   True
      LockHorizontal  =   True
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   2
      TabIndex        =   0
      Text            =   "-"
      TextAlignment   =   2
      TextColor       =   &c00905100
      Tooltip         =   ""
      Top             =   85
      Underline       =   False
      Visible         =   True
      Width           =   500
      _mPanelIndex    =   -1
   End
   Begin WebLabel lbAppCopyright
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   12.0
      Height          =   31
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   50
      LockBottom      =   False
      LockedInPosition=   True
      LockHorizontal  =   True
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   2
      TabIndex        =   1
      Text            =   "-"
      TextAlignment   =   2
      TextColor       =   &c91919100
      Tooltip         =   ""
      Top             =   119
      Underline       =   False
      Visible         =   True
      Width           =   500
      _mPanelIndex    =   -1
   End
   Begin WebLabel lbAppDescription
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   20.0
      Height          =   40
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   50
      LockBottom      =   False
      LockedInPosition=   True
      LockHorizontal  =   True
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   2
      TabIndex        =   2
      Text            =   "-"
      TextAlignment   =   2
      TextColor       =   &c00905100
      Tooltip         =   ""
      Top             =   40
      Underline       =   False
      Visible         =   True
      Width           =   500
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
#tag EndWindowCode

#tag Events lbAppVersion
	#tag Event
		Sub Opening()
		  me.Text = "v" + App.LongVersion
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lbAppCopyright
	#tag Event
		Sub Opening()
		  me.Text = App.Copyright
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lbAppDescription
	#tag Event
		Sub Opening()
		  me.Text = App.Description
		End Sub
	#tag EndEvent
#tag EndEvents
