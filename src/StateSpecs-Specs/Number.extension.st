Extension { #name : #Number }

{ #category : #'*StateSpecs-Specs' }
Number >> checkStateSpecsEqualityTo: aNumber [
	(aNumber retriveClassForStateSpecs includesBehavior: Number) ifFalse: [ ^false ].

	^aNumber isEqual: self within: 0.00000001
]

{ #category : #'*StateSpecs-Specs' }
Number >> isEqual: aNumber within: accuracy [ 
	^(self - aNumber) abs < accuracy
]
