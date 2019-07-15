"
I am a root of occurred message results.
My subclasses represent different kind of results which was received during occurred message execution
"
Class {
	#name : #MockOccurredMessageResult,
	#superclass : #Object,
	#category : 'Mocketry-Domain'
}

{ #category : #testing }
MockOccurredMessageResult >> isReturnOf: anObjectOrSpec [
	self subclassResponsibility 
]

{ #category : #testing }
MockOccurredMessageResult >> isSignalOf: anExceptionOrSpec [
	self subclassResponsibility 
]
