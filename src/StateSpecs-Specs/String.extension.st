Extension { #name : #String }

{ #category : #'*StateSpecs-Specs' }
String >> checkStateSpecsEqualityTo: anotherString [

	^self = anotherString
]

{ #category : #'*StateSpecs-Specs' }
String >> stringForSpecTitle [
	^self printString
]
