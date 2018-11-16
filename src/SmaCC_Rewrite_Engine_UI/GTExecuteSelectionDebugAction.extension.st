Extension { #name : #GTExecuteSelectionDebugAction }

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
GTExecuteSelectionDebugAction class >> gtTransformationActionFor: aDebugger [
	<gtContextSmaCCTransformationStack>
	^ (self forDebugger: aDebugger)
		codePresentationSelector: #rewriteCode;
		icon: GLMUIThemeExtraIcons glamorousInspect
]
