"
I represent abstract mock expectation action which should be executed when corresponding message send will be intercepted.

My subclasses should define method 
	 executeFor: aMockOccurredMessage
"
Class {
	#name : #MockExpectedAction,
	#superclass : #Object,
	#category : 'Mocketry-Domain'
}

{ #category : #converting }
MockExpectedAction >> asMockExpectationAction [
]

{ #category : #evaluating }
MockExpectedAction >> executeFor: anOccurredMessage [ 
	self subclassResponsibility
]
