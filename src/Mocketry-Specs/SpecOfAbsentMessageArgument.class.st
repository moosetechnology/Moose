"
I represent failure of SpecOfMessageArgument when given message had no particular argument number
"
Class {
	#name : #SpecOfAbsentMessageArgument,
	#superclass : #SpecOfWrongMessageSend,
	#category : 'Mocketry-Specs'
}

{ #category : #printing }
SpecOfAbsentMessageArgument >> description [
	^subject receiver stringForSpecValidation, ' received ', subject printMessage, ' but it ', spec absentArgumentDescription
]
