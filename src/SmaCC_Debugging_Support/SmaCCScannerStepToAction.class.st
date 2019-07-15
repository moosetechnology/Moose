Class {
	#name : #SmaCCScannerStepToAction,
	#superclass : #SmaCCDebuggingAction,
	#category : #'SmaCC_Debugging_Support'
}

{ #category : #actions }
SmaCCScannerStepToAction >> executeAction [
	| scanner toIndex |
	toIndex := self stepToIndex.
	scanner := self session scanner.
	self
		stepUntil: [ :context | 
			scanner stream position >= toIndex
				and:
					[ (context findContextSuchThat: [ :each | (each receiver isKindOf: SmaCCScanner) and: [ each selector = #step ] ]) isNil ] ]
]

{ #category : #accessing }
SmaCCScannerStepToAction >> stepToIndex [
	^ self subclassResponsibility
]
