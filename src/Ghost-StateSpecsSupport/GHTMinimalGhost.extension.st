Extension { #name : #GHTMinimalGhost }

{ #category : #'*Ghost-StateSpecsSupport' }
GHTMinimalGhost >> asStateSpec [
	^SpecOfIdentity to: self.
]

{ #category : #'*Ghost-StateSpecsSupport' }
GHTMinimalGhost >> checkStateSpecsEqualityTo: anObject [
	^self == anObject
]

{ #category : #'*Ghost-StateSpecsSupport' }
GHTMinimalGhost >> isStateSpec [
	^false
]

{ #category : #'*Ghost-StateSpecsSupport' }
GHTMinimalGhost >> retriveClassForStateSpecs [
	^GHMetaMessages extractClassOf: self
]

{ #category : #'*Ghost-StateSpecsSupport' }
GHTMinimalGhost >> should [
	^SpecOfShouldExpression startingAt: self
]

{ #category : #'*Ghost-StateSpecsSupport' }
GHTMinimalGhost >> stringForSpecTitle [
	^self ghostPrintString
]

{ #category : #'*Ghost-StateSpecsSupport' }
GHTMinimalGhost >> stringForSpecValidation [
	^self stringForSpecTitle
]
