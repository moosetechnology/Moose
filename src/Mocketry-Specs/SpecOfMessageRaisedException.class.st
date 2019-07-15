"
I specify required exception which should be raised from occurred message send. 
"
Class {
	#name : #SpecOfMessageRaisedException,
	#superclass : #SpecOfMessageResult,
	#category : 'Mocketry-Specs'
}

{ #category : #testing }
SpecOfMessageRaisedException >> basicMatches: anOccurredMessage [

	^(anOccurredMessage hasRaisedExceptionLike: requiredValue) ~= denial
]
