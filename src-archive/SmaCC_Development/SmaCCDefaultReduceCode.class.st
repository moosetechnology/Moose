"
SmaCCDefaultReduceCode represents a reduce action that returns a collection of all items in the rhs.
"
Class {
	#name : #SmaCCDefaultReduceCode,
	#superclass : #SmaCCReduceCode,
	#category : #'SmaCC_Development'
}

{ #category : #private }
SmaCCDefaultReduceCode >> basicModelTypes: aSet [
	^ Array with: (self model classFor: OrderedCollection)
]

{ #category : #testing }
SmaCCDefaultReduceCode >> hasReduceAction [
	^ false
]

{ #category : #accessing }
SmaCCDefaultReduceCode >> source [
	^ self codeGenerator defaultReductionSource
]
