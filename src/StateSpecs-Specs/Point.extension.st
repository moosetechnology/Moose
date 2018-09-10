Extension { #name : #Point }

{ #category : #'*StateSpecs-Specs' }
Point >> checkStateSpecsEqualityTo: aPoint [
	(aPoint retriveClassForStateSpecs includesBehavior: Point) ifFalse: [ ^false ].

	^aPoint isEqual: self within: 0.00000001
]

{ #category : #'*StateSpecs-Specs' }
Point >> isEqual: aPoint within: accuracy [ 
	^(self dist: aPoint) < accuracy
]
