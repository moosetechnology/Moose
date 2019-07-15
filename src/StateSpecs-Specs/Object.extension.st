Extension { #name : #Object }

{ #category : #'*StateSpecs-Specs' }
Object >> asStateSpec [
	^SpecOfEquality requiredValue: self
]

{ #category : #'*StateSpecs-Specs' }
Object >> checkStateSpecsEqualityTo: anObject [
	self class == anObject retriveClassForStateSpecs ifFalse: [ ^false ].
	
	^self = anObject
]

{ #category : #'*StateSpecs-Specs' }
Object >> isStateSpec [
	^false
]

{ #category : #'*StateSpecs-Specs' }
Object >> retriveClassForStateSpecs [
	^self class
]

{ #category : #'*StateSpecs-Specs' }
Object >> stringForSpecTitle [
	^self printString
]

{ #category : #'*StateSpecs-Specs' }
Object >> stringForSpecValidation [
	^self stringForSpecTitle
]
