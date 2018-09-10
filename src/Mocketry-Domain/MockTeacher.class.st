"
I am mock role which force mocks to learn all intercepted messages as expectation. 
With me MockBehaviour will create new MockExpectedMessage instance to define expected behaviour. 

I am defined as singleton:
	MockTeacher default
"
Class {
	#name : #MockTeacher,
	#superclass : #MockRole,
	#category : 'Mocketry-Domain'
}

{ #category : #processing }
MockTeacher >> processMessageSend: anOccurredMessage by: aMockBehaviour [

	| expectation |
	expectation := MockExpectedMessage from: anOccurredMessage.

	aMockBehaviour addExpectation: expectation.
	
	^expectation
]
