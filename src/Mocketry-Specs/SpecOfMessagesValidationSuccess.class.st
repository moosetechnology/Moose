"
I represent successful result of occurred messages validation  by SpecOfOccurredMessages spec.

I needed to supply list of occurred messages which satisfying spec. Then this information can be used in other more complex specs.

Internal Representation and Key Implementation Points.

    Instance Variables
	occurredMessages:		<Collection of <MockOccurredMessage>>
"
Class {
	#name : #SpecOfMessagesValidationSuccess,
	#superclass : #SpecOfValidationSuccess,
	#instVars : [
		'occurredMessages',
		'minMessagesCount'
	],
	#category : 'Mocketry-Specs'
}

{ #category : #'instance creation' }
SpecOfMessagesValidationSuccess class >> occurredMessages: messages [
	^self new 
		occurredMessages: messages
]

{ #category : #'instance creation' }
SpecOfMessagesValidationSuccess class >> occurredMessages: messages minCount: aNumber [
	^self new 
		occurredMessages: messages;
		minMessagesCount: aNumber
]

{ #category : #accessing }
SpecOfMessagesValidationSuccess >> minMessagesCount [
	^ minMessagesCount
]

{ #category : #accessing }
SpecOfMessagesValidationSuccess >> minMessagesCount: anObject [
	minMessagesCount := anObject
]

{ #category : #accessing }
SpecOfMessagesValidationSuccess >> occurredMessages [
	^ occurredMessages
]

{ #category : #accessing }
SpecOfMessagesValidationSuccess >> occurredMessages: anObject [
	occurredMessages := anObject
]

{ #category : #accessing }
SpecOfMessagesValidationSuccess >> requiredOccurredMessages [
	^occurredMessages first: minMessagesCount 
]
