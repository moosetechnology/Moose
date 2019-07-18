Class {
	#name : #SmaCCParserSimulationError,
	#superclass : #Error,
	#category : #'SmaCC_Debugging_Support-Simulation'
}

{ #category : #testing }
SmaCCParserSimulationError >> isInputIncomplete [
	self token isSyntaxError
		ifTrue: [ ^ false ].
	^ (self simulator symbolForId: self token ids first) name = 'E O F'
]

{ #category : #accessing }
SmaCCParserSimulationError >> nodeStack [
	^ self simulator currentParserState nodeStack copy
]

{ #category : #accessing }
SmaCCParserSimulationError >> simulator [
	^ self tag first
]

{ #category : #accessing }
SmaCCParserSimulationError >> stateStack [
	^ self simulator currentParserState stateStack copy
]

{ #category : #accessing }
SmaCCParserSimulationError >> token [
	^ self tag last
]
