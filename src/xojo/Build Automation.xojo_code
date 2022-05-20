#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopyResources
					AppliesTo = 0
					Architecture = 0
					Target = 0
					Destination = 1
					Subdirectory = js
					FolderItem = Li4vLi4vanMvZGlzdC9Xb3JkbGVHYW1lQ29udHJvbGxlci5qcw==
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
				Begin SignProjectStep Sign
				  DeveloperID=
				End
				Begin CopyFilesBuildStep CopyJavaScriptCode
					AppliesTo = 0
					Architecture = 0
					Target = 0
					Destination = 1
					Subdirectory = js
					FolderItem = Li4vLi4vanMvZGlzdC9Xb3JkbGVHYW1lQ29udHJvbGxlci5qcw==
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Xojo Cloud
				Begin BuildProjectStep Build
				End
			End
#tag EndBuildAutomation
