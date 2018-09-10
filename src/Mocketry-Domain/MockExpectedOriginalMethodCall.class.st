"
I represent expected message result which will execute original method of stubbed real object
"
Class {
	#name : #MockExpectedOriginalMethodCall,
	#superclass : #MockExpectedAction,
	#category : 'Mocketry-Domain'
}

{ #category : #evaluating }
MockExpectedOriginalMethodCall >> executeFor: anOccurredMessage [ 

	^GHVictimMetaMessages executeOriginalMethodOf: anOccurredMessage receiver for: anOccurredMessage
]
