Extension { #name : #Interval }

{ #category : #'*StateSpecs-Specs' }
Interval >> checkStateSpecsEqualityTo: anotherCollection [

	(anotherCollection isKindOf: Interval) ifFalse: [^false].
	
	^self = anotherCollection 
]

{ #category : #'*StateSpecs-Specs' }
Interval >> checkStateSpecsOrderedEqualityTo: anotherCollection [

	^self checkStateSpecsOrderedEqualityTo: anotherCollection
]

{ #category : #'*StateSpecs-Specs' }
Interval >> stringForSpecTitle [
	^self printString 
]
