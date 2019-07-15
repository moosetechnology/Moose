"
I specify group of expected message specs. (as conjunction)
I dont care on messages sends order

My contents are SpecOfExpectedMessage
"
Class {
	#name : #SpecOfObjectsInteraction,
	#superclass : #SpecOfOccurredMessages,
	#instVars : [
		'expectedMessages'
	],
	#category : 'Mocketry-Specs'
}

{ #category : #accessing }
SpecOfObjectsInteraction >> addExpectedMessage: aSpecOfExpectedMessage [
	
	expectedMessages add: aSpecOfExpectedMessage 
]

{ #category : #accessing }
SpecOfObjectsInteraction >> addExpectedMessages: newExpectedMessages [
	
	expectedMessages addAll: newExpectedMessages
]

{ #category : #converting }
SpecOfObjectsInteraction >> asInteractionSpecBetweenAll: expectedReceivers [

	| result interactionSpec |
	result := self class new.
	
	expectedMessages do: [ :each | 

		interactionSpec := each asInteractionSpecBetweenAll: expectedReceivers.
		interactionSpec populateObjectsInteractionSpec: result		
	 ].

	^result
]

{ #category : #testing }
SpecOfObjectsInteraction >> basicMatches: occurredMessages [

	^expectedMessages allSatisfy: [ :each | 
		each matches: occurredMessages ]
]

{ #category : #copying }
SpecOfObjectsInteraction >> copy [
	| copy |
	copy := super copy.
	copy expectedMessages: (expectedMessages collect: [ :each | each copy]).
	^copy
]

{ #category : #accessing }
SpecOfObjectsInteraction >> expectedMessages [
	^ expectedMessages
]

{ #category : #accessing }
SpecOfObjectsInteraction >> expectedMessages: anObject [
	expectedMessages := anObject
]

{ #category : #initialization }
SpecOfObjectsInteraction >> initialize [
	super initialize.
	
	expectedMessages := OrderedCollection new
]

{ #category : #accessing }
SpecOfObjectsInteraction >> invertChildren [

	expectedMessages do: [ :each | each invert ]
]

{ #category : #testing }
SpecOfObjectsInteraction >> isEmpty [
	^expectedMessages isEmpty
]

{ #category : #accessing }
SpecOfObjectsInteraction >> populateObjectsInteractionSpec: anObjectsInteractionSpec [

	anObjectsInteractionSpec addExpectedMessages: expectedMessages
]

{ #category : #validation }
SpecOfObjectsInteraction >> validate: occurredMessages [

	| uncheckedMessages failedSpecs result |
	uncheckedMessages := OrderedCollection withAll: occurredMessages.
	failedSpecs := OrderedCollection new.
	
	expectedMessages do: [ :each |
		
		result := each validate: uncheckedMessages.
		result isSuccess 
			ifTrue: [ uncheckedMessages removeAll: result requiredOccurredMessages ]
			ifFalse: [ failedSpecs add: each ]].
		
	failedSpecs ifEmpty: [ ^SpecOfMessagesValidationSuccess occurredMessages: (occurredMessages copyWithoutAll: uncheckedMessages) ].
		
	^failedSpecs first validate: uncheckedMessages
]
