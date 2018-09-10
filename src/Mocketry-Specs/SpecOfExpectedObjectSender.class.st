"
I am specification of expected object sender. I specify object which should be returned from one of occurred messages and I specify sender message which actualy should returned it.
 
My instance can be created by
	SpecOfExpectedObjectSender for: anObjectOrSpec returnedFrom: aSpecOfExpectedMessage
 
Internal Representation and Key Implementation Points.

    Instance Variables
	object:		<Object>
	requiredSender:	<SpecOfExpectedMessage>
"
Class {
	#name : #SpecOfExpectedObjectSender,
	#superclass : #SpecOfOccurredMessages,
	#instVars : [
		'object',
		'requiredSender'
	],
	#category : 'Mocketry-Specs'
}

{ #category : #'instance creation' }
SpecOfExpectedObjectSender class >> for: aString returnedFrom: aSpecOfExpectedMessage [ 
	^self new 
		object: aString;
		requiredSender: aSpecOfExpectedMessage 
]

{ #category : #converting }
SpecOfExpectedObjectSender >> asInteractionSpecBetweenAll: expectedReceivers [ 

	^self
]

{ #category : #testing }
SpecOfExpectedObjectSender >> basicMatches: occurredMessages [

	| actualSender |
	actualSender := occurredMessages 
		detect: [:each | each hasReturnedValueLike: object]
		ifNone: [^false].
	
	^requiredSender basicMatches: { actualSender }
]

{ #category : #printing }
SpecOfExpectedObjectSender >> description [
	^self printObject, ' should be returned from ', self printRequiredSender
]

{ #category : #accessing }
SpecOfExpectedObjectSender >> invertChildren [
	super invertChildren.
	 
	requiredSender invert
]

{ #category : #accessing }
SpecOfExpectedObjectSender >> object [
	^ object
]

{ #category : #accessing }
SpecOfExpectedObjectSender >> object: anObjectOrSpec [
	object := anObjectOrSpec asStateSpec
]

{ #category : #printing }
SpecOfExpectedObjectSender >> printObject [
	^object printSimpleValue 
]

{ #category : #printing }
SpecOfExpectedObjectSender >> printRequiredSender [
	^requiredSender printMessageSend
]

{ #category : #accessing }
SpecOfExpectedObjectSender >> requiredSender [
	^ requiredSender
]

{ #category : #accessing }
SpecOfExpectedObjectSender >> requiredSender: anObject [
	requiredSender := anObject
]

{ #category : #validation }
SpecOfExpectedObjectSender >> validate: occurredMessages [
	| actualSender success |
	actualSender := occurredMessages
		detect: [ :each | each hasReturnedValueLike: object ]
		ifNone: [ ^ self validateRequiredSenderFor: occurredMessages ].
		
	success := requiredSender matches: {actualSender}.
	success ifTrue: [ ^ SpecOfValidationResult success ].
	
	^ SpecOfWrongObjectSender spec: self for: occurredMessages wrongSender: actualSender
]

{ #category : #validation }
SpecOfExpectedObjectSender >> validateRequiredSenderFor: occurredMessages [
	| result |
	result := requiredSender validate: occurredMessages.
	result isSuccess ifTrue: [ 
		result := (SpecOfMessageReturnedValue requiredValue: object)
			validate: result occurredMessages last ].
	
	result isSuccess ifTrue: [ ^result ].
	
	^SpecOfWrongObjectSender spec: self for: occurredMessages
]
