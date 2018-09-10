"
I represent failure of SpecOfExpectedObjectSender when object was not returned from any occurred messages or it was returned from wrong message.

Internal Representation and Key Implementation Points.

    Instance Variables
	wrongSender:		<MockOccurredMessage>
"
Class {
	#name : #SpecOfWrongObjectSender,
	#superclass : #SpecOfWrongMessageSend,
	#instVars : [
		'wrongSender'
	],
	#category : 'Mocketry-Specs'
}

{ #category : #'instance creation' }
SpecOfWrongObjectSender class >> spec: aSpecOfExpectedObjectSender for: occurredMessages wrongSender: anOccurredMessage [ 
	^(self spec: aSpecOfExpectedObjectSender for: occurredMessages)
		wrongSender: anOccurredMessage 
]

{ #category : #printing }
SpecOfWrongObjectSender >> description [

	wrongSender ifNil: [ 
		^spec printObject, ' was not returned by anybody'
			, ' but it should be ', spec printRequiredSender.	 ].
			
	^spec printObject, ' was returned from ', wrongSender printWithoutResult
		, ' but it should be ', spec printRequiredSender.	
]

{ #category : #accessing }
SpecOfWrongObjectSender >> wrongSender [
	^ wrongSender
]

{ #category : #accessing }
SpecOfWrongObjectSender >> wrongSender: anObject [
	wrongSender := anObject
]
