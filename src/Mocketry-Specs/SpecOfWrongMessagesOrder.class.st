"
I represent failure of SpecOfOrderedObjetsInteraction when actual messages order was wrong

My wrongMessage variable contains spec of message which was occurred in wrong time.

Internal Representation and Key Implementation Points.

    Instance Variables
	wrongMessage:		<SpecOfExpectedMessage>
"
Class {
	#name : #SpecOfWrongMessagesOrder,
	#superclass : #SpecOfWrongMessageSend,
	#instVars : [
		'wrongMessage',
		'validMessages'
	],
	#category : 'Mocketry-Specs'
}

{ #category : #'instance creation' }
SpecOfWrongMessagesOrder class >> of: occurredMessages spec: anOrderedInteractionSpec validMessages: validExpectedMessages wrongMessage: anExpectedMessageSpec [

	^(self spec: anOrderedInteractionSpec for: occurredMessages)
		wrongMessage: anExpectedMessageSpec;
		validMessages: validExpectedMessages
]

{ #category : #'instance creation' }
SpecOfWrongMessagesOrder class >> of: occurredMessages spec: anOrderedInteractionSpec wrongMessage: anExpectedMessageSpec [

	^(self spec: anOrderedInteractionSpec for: occurredMessages)
		wrongMessage: anExpectedMessageSpec 
]

{ #category : #printing }
SpecOfWrongMessagesOrder >> description [
 
	| send |
	^String streamContents: [ :s | 
		send := wrongMessage messageSend.
		send printReceiverOn: s.
		s << ' received '.
		send printMessageOn: s.
		s << ' in wrong time'
	]
]

{ #category : #accessing }
SpecOfWrongMessagesOrder >> validMessages [
	^ validMessages
]

{ #category : #accessing }
SpecOfWrongMessagesOrder >> validMessages: anObject [
	validMessages := anObject
]

{ #category : #accessing }
SpecOfWrongMessagesOrder >> wrongMessage [
	^ wrongMessage
]

{ #category : #accessing }
SpecOfWrongMessagesOrder >> wrongMessage: anObject [
	wrongMessage := anObject
]
