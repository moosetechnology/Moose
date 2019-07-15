Extension { #name : #SpecOfObjectPropertyShouldExpression }

{ #category : #'*Mocketry-Domain' }
SpecOfObjectPropertyShouldExpression >> beReturnedFrom: aBlockWithMessageSpec [

	| should |
	should := receiver value should.
	should withNegation: withNegation.
	
	^should beReturnedFrom: aBlockWithMessageSpec 
]
