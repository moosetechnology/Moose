Class {
	#name : #SmaCCSpecificErrorNodeHandler,
	#superclass : #SmaCCErrorNodeHandler,
	#category : #'SmaCC_Runtime'
}

{ #category : #'private-error handling' }
SmaCCSpecificErrorNodeHandler >> errorShiftActionsForState: stateIndex [
	| actions |
	actions := self actionsForState: stateIndex and: self errorTokenId.
	^ (actions select: [ :each | (each bitAnd: self actionMask) = self shiftAction ]) collect: [ :each | each bitShift: -2 ]
]

{ #category : #'private-error handling' }
SmaCCSpecificErrorNodeHandler >> finishErrorParse: errorToken dismissed: dismissedTokens [
	| handlerStates |
	handlerStates := self errorHandlerStates reverse.
	(self finishErrorParse: errorToken dismissed: dismissedTokens handlerStates: handlerStates)
		ifFalse: [ super finishErrorParse: errorToken dismissed: dismissedTokens ]
]

{ #category : #'private-error handling' }
SmaCCSpecificErrorNodeHandler >> performErrorReductions [
	| action actions |
	[ actions := self actionsForState: self stateStack last and: self errorTokenId.
	action := actions detect: [ :each | (each bitAnd: self actionMask) = self reduceAction ] ifNone: [ 0 ].
	(action bitAnd: self actionMask) == self reduceAction ] whileTrue: [ self reduce: (action bitShift: -2) ]
]
