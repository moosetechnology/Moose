"
I specify required result for occurred message send. I am abstract class for differed kind of results: returned value and raised exception

My subclasses should just implement usual method basicMatches: and validation result will be correct
"
Class {
	#name : #SpecOfMessageResult,
	#superclass : #SpecOfMessagePart,
	#category : 'Mocketry-Specs'
}

{ #category : #printing }
SpecOfMessageResult >> printResultDescription [
	^requiredValue description
]

{ #category : #validation }
SpecOfMessageResult >> validationFailureFor: anOccurredMessage [

	^SpecOfWrongMessageResult of: anOccurredMessage spec: self
]
