Class {
	#name : #SmaCCParserNextTokenAction,
	#superclass : #SmaCCParserStepAction,
	#category : #'SmaCC_Debugging_Support'
}

{ #category : #registration }
SmaCCParserNextTokenAction class >> gtActionFor: aDebugger [
	<gtSmaCCDebuggingParserAction>
	^ (self forDebugger: aDebugger) icon: GLMUIThemeExtraIcons glamorousInto
]

{ #category : #accessing }
SmaCCParserNextTokenAction >> defaultLabel [
	^ 'Next Token'
]

{ #category : #accessing }
SmaCCParserNextTokenAction >> defaultOrder [
	^ 100
]

{ #category : #actions }
SmaCCParserNextTokenAction >> executeAction [
	| token |
	token := self session parser currentToken.
	self stepUntil: [ :context | self session parser currentToken ~~ token and: [ self session parser currentToken notNil ] ]
]

{ #category : #accessing }
SmaCCParserNextTokenAction >> help [
	^ 'Run until we get the next token or a parse error is encountered.'
]
