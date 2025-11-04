#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Mac OS X
				Begin IDEScriptBuildStep SaveProject , AppliesTo = 0, Architecture = 0, Target = 0
					DoCommand "SaveFile"
				End
				Begin BuildProjectStep Build
				End
				Begin SignProjectStep Sign
				  DeveloperID=
				End
			End
			Begin BuildStepList Windows
				Begin IDEScriptBuildStep SaveProject1 , AppliesTo = 0, Architecture = 0, Target = 0
					DoCommand "SaveFile"
				End
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Xojo Cloud
				Begin BuildProjectStep Build
				End
			End
#tag EndBuildAutomation
