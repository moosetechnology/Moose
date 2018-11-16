Class {
	#name : #SmaCCErrorTerminalSymbol,
	#superclass : #SmaCCTerminalSymbol,
	#category : #'SmaCC_Development'
}

{ #category : #accessing }
SmaCCErrorTerminalSymbol >> modelTypes: anIdentitySet [
	^ Set with: (self model classFor: SmaCCError)
]
