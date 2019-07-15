"
I am specification of expected message send. 
I consist of messageSend spec and usage spec. 
First defines message send signature and last defines how many times message can happen.

My instance can be creation from MessageSend 
	SpecOfExpectedMessage from: aMessageSend
	
Public API and Key Messages

- allowSendsCount: anInteger
It return true if given messages count can be happen.

- detectFailureIn: messageSendsCollection 
It returns most close message send to me which not satisfy me.

- addSpec: extraOccuredMessageSpec 
It is possible to add extra spec to message send description

Internal Representation and Key Implementation Points.

    Instance Variables
	messageSend:		<SpecOfMessageSend>
	usage:		<SpecOfMessageUsage>


    Implementation Points
"
Class {
	#name : #SpecOfExpectedMessage,
	#superclass : #SpecOfOccurredMessages,
	#instVars : [
		'messageSend',
		'usage'
	],
	#category : 'Mocketry-Specs'
}

{ #category : #'instance creation' }
SpecOfExpectedMessage class >> from: aMessageSend [

	^self new 
		messageSend: (SpecOfMessageSend from: aMessageSend)
]

{ #category : #accessing }
SpecOfExpectedMessage >> addSpec: extraOccuredMessageSpec [ 
	messageSend addSpec: extraOccuredMessageSpec 
]

{ #category : #testing }
SpecOfExpectedMessage >> allowSendsCount: aNumber [
	^usage allowMessageSends: aNumber withNegatedLogic: denial
]

{ #category : #converting }
SpecOfExpectedMessage >> asInteractionSpecBetweenAll: expectedReceivers [
	| result copy |
	self isAboutConcreteReceiver ifTrue: [ ^ self ].
	
	result := SpecOfObjectsInteraction new.
	expectedReceivers	do: [ :eachReceiver | 
			(messageSend receiver matches: eachReceiver) ifTrue: [ 
				copy := self copy.
				copy receiver: eachReceiver.
				result addExpectedMessage: copy ] 
	].			
	result isEmpty ifTrue: [ ^ self ].
	^ result
]

{ #category : #testing }
SpecOfExpectedMessage >> basicMatches: occurredMessages [

	| count |
	count := occurredMessages count: [ :each | 
		messageSend matches: each  ].
	
	^usage allowMessageSends: count
]

{ #category : #'capturing arguments' }
SpecOfExpectedMessage >> captureArgumentsFrom: aMessageSend [

	messageSend captureArgumentsFrom: aMessageSend
]

{ #category : #copying }
SpecOfExpectedMessage >> copy [

	| result |
	result := super copy.
	
	result 
		messageSend: messageSend copy;
		usage: usage copy.
	
	^result
]

{ #category : #validation }
SpecOfExpectedMessage >> createValidationSuccessFor: occurredMessages [
	
	^SpecOfMessagesValidationSuccess occurredMessages: occurredMessages minCount: usage minCount 
]

{ #category : #printing }
SpecOfExpectedMessage >> description [
	
	^String streamContents: [ :s |
		messageSend printReceiverOn: s.
		s << ' ' << self shouldPrefixPhrase << ' receive '.
		messageSend printMessageOn: s.
		
		usage hasMeaningfulRestrictions ifTrue: [ 
			s << ' ' << usage printRestrictions].
	]
	
]

{ #category : #validation }
SpecOfExpectedMessage >> detectFailureIn: messages [
	| withSimilarReceiver withSimilarSelector |
	withSimilarReceiver := messages select: [ :each | messageSend receiver matches: each receiver].
	withSimilarReceiver ifEmpty: [ ^nil ].
	
	withSimilarSelector := withSimilarReceiver 
		detect: [:each | messageSend selector matches: each selector]
		ifNone: [^messageSend validate: withSimilarReceiver first].
		
	^messageSend validate: withSimilarSelector 
]

{ #category : #initialization }
SpecOfExpectedMessage >> initialize [
	super initialize.
	
	usage := SpecOfMessageUsage new
]

{ #category : #testing }
SpecOfExpectedMessage >> isAboutConcreteReceiver [
	^ messageSend receiver class = SpecOfIdentity
]

{ #category : #accessing }
SpecOfExpectedMessage >> messageSend [
	^ messageSend
]

{ #category : #accessing }
SpecOfExpectedMessage >> messageSend: anObject [
	messageSend := anObject
]

{ #category : #accessing }
SpecOfExpectedMessage >> populateObjectsInteractionSpec: anObjectsInteractionSpec [

	anObjectsInteractionSpec addExpectedMessage: self
]

{ #category : #printing }
SpecOfExpectedMessage >> printMessageNotHappen [

	^String streamContents: [ :s |
		messageSend printReceiverOn: s.
		s << ' never received '.
		messageSend printMessageOn: s]
]

{ #category : #printing }
SpecOfExpectedMessage >> printMessageSend [

	^String streamContents: [ :s |
		messageSend printReceiverOn: s.
		s << ' '.
		messageSend printMessageOn: s
	]
]

{ #category : #accessing }
SpecOfExpectedMessage >> receiver: aStateSpec [

	messageSend receiver: aStateSpec
]

{ #category : #accessing }
SpecOfExpectedMessage >> restrictUsage [

	usage beStrict
]

{ #category : #accessing }
SpecOfExpectedMessage >> usage [
	^ usage
]

{ #category : #accessing }
SpecOfExpectedMessage >> usage: anObject [
	usage := anObject
]

{ #category : #validation }
SpecOfExpectedMessage >> validate: occurredMessages [

	| matched wrongMessage |
	matched := occurredMessages select: [ :each | 
		messageSend basicMatches: each  ].
	
	(self allowSendsCount: matched size) ifTrue: [ ^ self createValidationSuccessFor: matched].
	
	wrongMessage := self detectFailureIn: (occurredMessages copyWithoutAll: matched).
	^SpecOfExpectedMessageValidationFailure 
		spec: self 
		for: occurredMessages
		occuredMessages: matched 
		mostSimilarMessage: wrongMessage
]
