Class {
	#name : #MockExpectedMethodResultStub,
	#superclass : #MockExpectedOriginalMethodCall,
	#category : #'Mocketry-Domain'
}

{ #category : #evaluating }
MockExpectedMethodResultStub >> executeFor: anOccurredMessage [
	| realMethodResult |
	realMethodResult := super executeFor: anOccurredMessage.
	realMethodResult stub.
	^realMethodResult
]
