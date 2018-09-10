"
I am root of different kind of message send validation failures.

My subclasses provide suitable description of failure and required information about it.
"
Class {
	#name : #SpecOfWrongMessageSend,
	#superclass : #SpecOfValidationFailure,
	#category : 'Mocketry-Specs'
}

{ #category : #'instance creation' }
SpecOfWrongMessageSend class >> of: aMessageSend spec: aSpecOfMessageSendReceiver [ 
	^self spec: aSpecOfMessageSendReceiver for: aMessageSend 
]
