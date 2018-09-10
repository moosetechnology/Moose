"
I represent failure of SpecOfMessageResult when actual message result was wrong
"
Class {
	#name : #SpecOfWrongMessageResult,
	#superclass : #SpecOfWrongMessageSend,
	#category : 'Mocketry-Specs'
}

{ #category : #printing }
SpecOfWrongMessageResult >> description [

	^'Got ', subject stringForResultSpec, ' but it ', spec printResultDescription
]
