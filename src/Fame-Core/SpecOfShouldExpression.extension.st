Extension { #name : #SpecOfShouldExpression }

{ #category : #'*Fame-Core' }
SpecOfShouldExpression >> > expected [
	^ self beGreaterThan: expected
]

{ #category : #'*Fame-Core' }
SpecOfShouldExpression >> >= expected [
	^ self beGreaterOrEqualThan: expected
]

{ #category : #'*Fame-Core' }
SpecOfShouldExpression >> beFalse [
	^ self be: false
]

{ #category : #'*Fame-Core' }
SpecOfShouldExpression >> beTrue [
	^ self be: true
]
