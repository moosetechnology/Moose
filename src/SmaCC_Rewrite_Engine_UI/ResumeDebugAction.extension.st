Extension { #name : #ResumeDebugAction }

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
ResumeDebugAction class >> gtSmaCCTransformationStackActionFor: aDebugger [
	<gtSmaCCTransformationStack>
	^ (self forDebugger: aDebugger) icon: GLMUIThemeExtraIcons glamorousPlay
]
