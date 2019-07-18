Class {
	#name : #SmaCCErrorTerminalSymbol,
	#superclass : #SmaCCTerminalSymbol,
	#category : #'SmaCC_Development-Model'
}

{ #category : #accessing }
SmaCCErrorTerminalSymbol >> modelTypes: anIdentitySet [
	^ Set with: (self model classFor: SmaCCErrorNode)
]
