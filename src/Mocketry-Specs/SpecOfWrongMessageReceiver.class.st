"
I represent failure of SpecOfMessageReceiver when actual message receiver was wrong
"
Class {
	#name : #SpecOfWrongMessageReceiver,
	#superclass : #SpecOfWrongMessageSend,
	#category : 'Mocketry-Specs'
}

{ #category : #printing }
SpecOfWrongMessageReceiver >> description [
	^subject printMessage, ' is sent to "', subject receiver stringForSpecValidation
			, '" but it ', spec receiverDescription
]
