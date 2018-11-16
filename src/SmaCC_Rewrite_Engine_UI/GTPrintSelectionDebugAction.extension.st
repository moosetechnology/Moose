Extension { #name : #GTPrintSelectionDebugAction }

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
GTPrintSelectionDebugAction class >> gtTransformationActionFor: aDebugger [
	<gtContextSmaCCTransformationStack>
	^ (self forDebugger: aDebugger)
		codePresentationSelector: #rewriteCode;
		icon: GLMUIThemeExtraIcons glamorousInspect
]
