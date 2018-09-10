"
I represent failure of SpecOfAsynchMessage when actual message was occurred on wrong process
"
Class {
	#name : #SpecOfWrongMessageProcess,
	#superclass : #SpecOfWrongMessageSend,
	#category : 'Mocketry-Specs'
}

{ #category : #printing }
SpecOfWrongMessageProcess >> description [

	| desc |
	desc := subject receiver stringForSpecValidation, ' should receive ', subject printMessage.
	spec denial 
		ifTrue: [ desc := desc , ' in original process' ]
		ifFalse: [ desc := desc , ' in another process' ].
	^desc
]
