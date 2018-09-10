"
I specify required value for particular argument of message send.

My instance can be created by 
	SpecOfMessageArgument number: anInteger requiredValue: anObjectOrSpec
 
Internal Representation and Key Implementation Points.

    Instance Variables
	argumentNumber:		<Integer>
"
Class {
	#name : #SpecOfMessageArgument,
	#superclass : #SpecOfMessagePart,
	#instVars : [
		'argumentNumber'
	],
	#category : 'Mocketry-Specs'
}

{ #category : #'instance creation' }
SpecOfMessageArgument class >> number: anInteger requiredValue: anObjectOrSpec [

	^(self requiredValue: anObjectOrSpec)
		argumentNumber: anInteger
]

{ #category : #printing }
SpecOfMessageArgument >> absentArgumentDescription [

	^'should have arg ', argumentNumber asString, ' which ', requiredValue description
]

{ #category : #printing }
SpecOfMessageArgument >> argumentDescription [

	^'arg ', argumentNumber asString, ' ', requiredValue description
]

{ #category : #accessing }
SpecOfMessageArgument >> argumentNumber [
	^ argumentNumber
]

{ #category : #accessing }
SpecOfMessageArgument >> argumentNumber: anObject [
	argumentNumber := anObject
]

{ #category : #testing }
SpecOfMessageArgument >> basicMatches: aMessageSend [

	| arg |
	argumentNumber > aMessageSend numArgs ifTrue: [^false].
	
	arg := aMessageSend arguments at: argumentNumber.
	^requiredValue basicMatches: arg
]

{ #category : #printing }
SpecOfMessageArgument >> defaultTitle [
	^'have arg ', argumentNumber asString, ' which ' , requiredValue description
]

{ #category : #validation }
SpecOfMessageArgument >> validate: aMessageSend [

	| result |
	argumentNumber > aMessageSend numArgs ifTrue: [ 
		^SpecOfAbsentMessageArgument spec: self for: aMessageSend ].
	
	result := requiredValue validate: (aMessageSend arguments at: argumentNumber).
	
	result isSuccess ifTrue: [ ^result ].
	
	^SpecOfWrongMessageArgument of: aMessageSend spec: self
]
