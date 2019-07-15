Extension { #name : #Object }

{ #category : #'*StateSpecs-DSL-ShouldExpressions' }
Object >> should [
	^SpecOfShouldExpression startingAt: self
]

{ #category : #'*StateSpecs-DSL-ShouldExpressions' }
Object >> where [
	^SpecOfObjectPropertyBuilder for: self
]
