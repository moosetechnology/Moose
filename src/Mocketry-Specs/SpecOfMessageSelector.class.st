"
I specify required value for selector of message send.

My instance can be created by 
	SpecOfMessageReceiver requiredValue: anObjectOrSpec
"
Class {
	#name : #SpecOfMessageSelector,
	#superclass : #SpecOfMessagePart,
	#category : 'Mocketry-Specs'
}

{ #category : #testing }
SpecOfMessageSelector >> basicMatches: aMessageSend [

	^requiredValue basicMatches: aMessageSend selector
]

{ #category : #printing }
SpecOfMessageSelector >> defaultTitle [
	^'have selector ' , self selectorDescription
]

{ #category : #accessing }
SpecOfMessageSelector >> requiredValue: anObjectOrSpec [
	
	requiredValue := anObjectOrSpec isStateSpec 
		ifTrue: [ anObjectOrSpec ] ifFalse: [Identical to: anObjectOrSpec]
]

{ #category : #printing }
SpecOfMessageSelector >> selectorDescription [

	^requiredValue description
]

{ #category : #validation }
SpecOfMessageSelector >> validate: aMessageSend [

	| result |
	result := requiredValue validate: aMessageSend selector.
	
	result isSuccess ifTrue: [ ^result ].
	
	^SpecOfWrongMessageSelector of: aMessageSend spec: self
]
