Extension { #name : #TestAsserter }

{ #category : #'*Famix-Pharo7' }
TestAsserter >> assertEmpty: aCollection [
	^ self assert: aCollection isEmpty description: aCollection asString , ' should have been empty'
]

{ #category : #'*Famix-Pharo7' }
TestAsserter >> denyEmpty: aCollection [
	^ self assert: aCollection isNotEmpty description: aCollection asString , ' should not have been empty'
]
