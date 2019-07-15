"
I represent expected message action which will log received message send into transcript
"
Class {
	#name : #MockExpectedMessageLogging,
	#superclass : #MockExpectedAction,
	#category : 'Mocketry-Domain'
}

{ #category : #evaluating }
MockExpectedMessageLogging >> executeFor: anOccurredMessage [ 
	Transcript show: anOccurredMessage printString; cr.
	^anOccurredMessage receiver
]
