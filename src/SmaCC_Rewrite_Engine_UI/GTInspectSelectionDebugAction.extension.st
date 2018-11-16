Extension { #name : #GTInspectSelectionDebugAction }

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
GTInspectSelectionDebugAction class >> gtTransformationActionFor: aDebugger [
	<gtContextSmaCCTransformationStack>
	^ (self forDebugger: aDebugger)
		codePresentationSelector: #rewriteCode;
		icon: GLMUIThemeExtraIcons glamorousInspect
]
