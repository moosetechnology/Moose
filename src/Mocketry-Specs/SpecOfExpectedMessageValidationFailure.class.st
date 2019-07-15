"
I represent failure of SpecOfExpectedMessage.  This spec validates list of occurred messages. And I specify information about what was going wrong.

My occurredMessage contains list of valid occurred message sends.
My wrongMessage contains validation failure about first wrong message send.

Internal Representation and Key Implementation Points.

    Instance Variables
	occuredMessages:		<Collection of: <MockOccurredMessage>>
	wrongMessage:		<SpecOfWrongMessageSend>
"
Class {
	#name : #SpecOfExpectedMessageValidationFailure,
	#superclass : #SpecOfWrongMessageSend,
	#instVars : [
		'occuredMessages',
		'mostSimilarMessage'
	],
	#category : 'Mocketry-Specs'
}

{ #category : #'instance creation' }
SpecOfExpectedMessageValidationFailure class >> spec: aSpecOfExpectedMessage for: actualMessages occuredMessages: occurredMessages mostSimilarMessage: wrongMessageFailure [

	^(self spec: aSpecOfExpectedMessage for: actualMessages )
		occuredMessages: occurredMessages;
		mostSimilarMessage: wrongMessageFailure
]

{ #category : #printing }
SpecOfExpectedMessageValidationFailure >> description [

	"mostSimilarMessage ifNotNil: [ ^mostSimilarMessage description]."

	occuredMessages ifEmpty: [ ^spec printMessageNotHappen].
	
	^spec description, ' but it was ', occuredMessages size asString , ' times' 
]

{ #category : #accessing }
SpecOfExpectedMessageValidationFailure >> mostSimilarMessage [
	^ mostSimilarMessage
]

{ #category : #accessing }
SpecOfExpectedMessageValidationFailure >> mostSimilarMessage: anObject [
	mostSimilarMessage := anObject
]

{ #category : #accessing }
SpecOfExpectedMessageValidationFailure >> occuredMessages [
	^ occuredMessages
]

{ #category : #accessing }
SpecOfExpectedMessageValidationFailure >> occuredMessages: anObject [
	occuredMessages := anObject
]
