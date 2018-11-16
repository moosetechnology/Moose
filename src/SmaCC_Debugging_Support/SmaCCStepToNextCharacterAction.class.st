Class {
	#name : #SmaCCStepToNextCharacterAction,
	#superclass : #SmaCCScannerStepToAction,
	#category : #'SmaCC_Debugging_Support'
}

{ #category : #registration }
SmaCCStepToNextCharacterAction class >> gtActionFor: aDebugger [
	<gtSmaCCDebuggingScannerAction>
	^ (self forDebugger: aDebugger) icon: GLMUIThemeExtraIcons glamorousInto
]

{ #category : #accessing }
SmaCCStepToNextCharacterAction >> defaultLabel [
	^ 'Step Next Character'
]

{ #category : #accessing }
SmaCCStepToNextCharacterAction >> help [
	^ 'Run until we get to the character or a parse error is encountered.'
]

{ #category : #accessing }
SmaCCStepToNextCharacterAction >> stepToIndex [
	^ self session scanner stream position + 1
]
