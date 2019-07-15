"
I represent failure of SpecOfMessageArgument when actual message argument was wrong
"
Class {
	#name : #SpecOfWrongMessageArgument,
	#superclass : #SpecOfWrongMessageSend,
	#category : 'Mocketry-Specs'
}

{ #category : #printing }
SpecOfWrongMessageArgument >> description [
	^subject receiver stringForSpecValidation, ' received ', subject printMessage, ' but ', spec argumentDescription
]
