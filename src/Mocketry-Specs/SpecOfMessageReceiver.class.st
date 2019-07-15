"
I specify required value for receiver of message send.

My instance can be created by 
	SpecOfMessageReceiver requiredValue: anObjectOrSpec
"
Class {
	#name : #SpecOfMessageReceiver,
	#superclass : #SpecOfMessagePart,
	#category : 'Mocketry-Specs'
}

{ #category : #testing }
SpecOfMessageReceiver >> basicMatches: aMessageSend [

	^requiredValue basicMatches: aMessageSend receiver
]

{ #category : #printing }
SpecOfMessageReceiver >> defaultTitle [
	^'have receiver ' , requiredValue description
]

{ #category : #printing }
SpecOfMessageReceiver >> receiverDescription [
	^requiredValue description
]

{ #category : #accessing }
SpecOfMessageReceiver >> requiredValue: anObjectOrSpec [

	requiredValue := anObjectOrSpec isStateSpec 
		ifTrue: [anObjectOrSpec ]
		ifFalse: [ Identical to: anObjectOrSpec ]
]

{ #category : #validation }
SpecOfMessageReceiver >> validate: aMessageSend [

	| result |
	result := requiredValue validate: aMessageSend receiver.
	
	result isSuccess ifTrue: [ ^result ].
	
	^SpecOfWrongMessageReceiver of: aMessageSend spec: self
]
