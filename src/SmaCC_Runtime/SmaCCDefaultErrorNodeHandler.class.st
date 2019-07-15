Class {
	#name : #SmaCCDefaultErrorNodeHandler,
	#superclass : #SmaCCErrorNodeHandler,
	#category : #'SmaCC_Runtime'
}

{ #category : #'private-error handling' }
SmaCCDefaultErrorNodeHandler >> errorShiftActionsForState: stateIndex [
	^ self nodeShiftActionsFor: stateIndex
]

{ #category : #'private-error handling' }
SmaCCDefaultErrorNodeHandler >> performErrorReductions [
	| onlyAction actions |
	[ actions := Set new.
	self actionsAndSymbolsForState: self stateStack last do: [ :action :symbol | actions add: action ].
	actions size = 1 and: [ ((onlyAction := actions anyOne) bitAnd: self actionMask) == self reduceAction ] ]
		whileTrue: [ self reduce: (onlyAction bitShift: -2) ]
]
