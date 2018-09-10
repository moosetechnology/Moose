"
I specify required returned value from occurred message send. 
"
Class {
	#name : #SpecOfMessageReturnedValue,
	#superclass : #SpecOfMessageResult,
	#category : 'Mocketry-Specs'
}

{ #category : #testing }
SpecOfMessageReturnedValue >> basicMatches: anOccurredMessage [

	^(anOccurredMessage hasReturnedValueLike: requiredValue) ~= denial

		
]
