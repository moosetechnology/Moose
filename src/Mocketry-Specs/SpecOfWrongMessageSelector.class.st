"
I represent failure of SpecOfMessageSelector when actual message selector was wrong
"
Class {
	#name : #SpecOfWrongMessageSelector,
	#superclass : #SpecOfWrongMessageSend,
	#category : 'Mocketry-Specs'
}

{ #category : #printing }
SpecOfWrongMessageSelector >> description [
	^subject receiver stringForSpecValidation, ' received ', subject printMessage, ' but it ', spec selectorDescription
]
