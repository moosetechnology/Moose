Class {
	#name : #SpecOfExpectedMessageTests,
	#superclass : #TestCase,
	#category : 'Mocketry-Specs-Tests'
}

{ #category : #tests }
SpecOfExpectedMessageTests >> testDescription [

	| spec |
	spec := SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #someMessageWith: argument: #someArg).
	
	spec where description should equal: '#receiver should receive someMessageWith: #someArg'
]

{ #category : #tests }
SpecOfExpectedMessageTests >> testDescriptionWhenDenialApplied [

	| spec |
	spec := (SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #someMessageWith: argument: #someArg)) not.
	
	spec where description should equal: '#receiver should not receive someMessageWith: #someArg'
]

{ #category : #tests }
SpecOfExpectedMessageTests >> testDescriptionWhenMessageShouldBeSentMoreThanOneTime [

	| spec |
	spec := SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #someMessageWith: argument: #someArg).
	spec usage minCount: 2.
	
	spec where description should equal: '#receiver should receive someMessageWith: #someArg at least 2 times'
]

{ #category : #tests }
SpecOfExpectedMessageTests >> testFailedValidationWhenDenialApplied [

	| spec interaction result |
	spec := (SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector)) not.
	
	interaction := OrderedCollection new.
	interaction add: (MockOccurredMessage receiver: #receiver selector: #selector).
	
	result := spec validate: interaction.		
	
	result should be isFailure.
	result where description should equal: '#receiver should not receive selector but it was 1 times'
]

{ #category : #tests }
SpecOfExpectedMessageTests >> testFailedValidationWhenDenialAppliedAndUsageHasMeaningfulRestrictions [

	| spec interaction result |
	spec := (SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector)) not.
	spec usage minCount: 2.
	
	interaction := OrderedCollection new.
	interaction add: (MockOccurredMessage receiver: #receiver selector: #selector).
	interaction add: (MockOccurredMessage receiver: #receiver selector: #selector).
	interaction add: (MockOccurredMessage receiver: #receiver selector: #selector).

	result := spec validate: interaction.		
	
	result should be isFailure.
	result where description should equal: '#receiver should not receive selector at least 2 times but it was 3 times'
]

{ #category : #tests }
SpecOfExpectedMessageTests >> testFailedValidationWhenExpectedReceiverNotReceivedAnyMessage [

	| spec interaction result |
	spec := SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
	
	interaction := OrderedCollection new.
	interaction add: (MockOccurredMessage receiver: #anotherReceiver selector: #selector).

	result := spec validate: interaction.		
	
	result should be isFailure.
	result where description should equal: '#receiver never received selector'
]

{ #category : #tests }
SpecOfExpectedMessageTests >> testFailedValidationWhenExpectedReceiverReceivedWrongArgument [

	| spec interaction result |
	spec := SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selectorWith: argument: #expectedArg).
	
	interaction := OrderedCollection new.
	interaction add: (MockOccurredMessage receiver: #receiver selector: #selectorWith: argument: #wrongArg).

	result := spec validate: interaction.		
	
	result should be isFailure.
	result where description should equal: '#receiver never received selectorWith: #expectedArg'.
	result where mostSimilarMessage description should equal: '#receiver received selectorWith: #wrongArg but arg 1 should equal "#expectedArg"'
]

{ #category : #tests }
SpecOfExpectedMessageTests >> testFailedValidationWhenExpectedReceiverReceivedWrongSelector [

	| spec interaction result |
	spec := SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
	
	interaction := OrderedCollection new.
	interaction add: (MockOccurredMessage receiver: #receiver selector: #wrongSelector).

	result := spec validate: interaction.		
	
	result should be isFailure.
	result where description should equal: '#receiver never received selector'.
	result where mostSimilarMessage description should equal: '#receiver received wrongSelector but it should be "#selector"'
]

{ #category : #tests }
SpecOfExpectedMessageTests >> testFailedValidationWhenMessageWasNotOccurredExpectedTimes [

	| spec interaction result |
	spec := SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
	spec usage minCount: 2.
	
	interaction := OrderedCollection new.
	interaction add: (MockOccurredMessage receiver: #receiver selector: #selector).

	result := spec validate: interaction.		
	
	result should be isFailure.
	result where description should equal: '#receiver should receive selector at least 2 times but it was 1 times'
]

{ #category : #tests }
SpecOfExpectedMessageTests >> testMatchesInteractionWhenDenialApplied [

	| spec interaction |
	spec := (SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector)) not.
	
	interaction := OrderedCollection new.
	interaction add: (MockOccurredMessage receiver: #receiver selector: #selector).
	
	spec should not be matches: interaction
]

{ #category : #tests }
SpecOfExpectedMessageTests >> testMatchesInteractionWhichContainsMessageRequiredTimes [

	| spec interaction |
	spec := SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
	spec usage minCount: 2.
	
	interaction := OrderedCollection new.
	interaction add: (MockOccurredMessage receiver: #receiver selector: #selector).
	interaction add: (MockOccurredMessage receiver: #receiver selector: #selector).
	
	spec should be matches: interaction
]

{ #category : #tests }
SpecOfExpectedMessageTests >> testMatchesInteractionWhichContainsRequiredMessage [

	| spec interaction |
	spec := SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
	
	interaction := OrderedCollection new.
	interaction add: (MockOccurredMessage receiver: #receiver selector: #selector).
	
	spec should be matches: interaction
]

{ #category : #tests }
SpecOfExpectedMessageTests >> testNotMatchesInteractionWhichNotContainsMessageRequiredTimes [

	| spec interaction |
	spec := SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
	spec usage minCount: 2.
	
	interaction := OrderedCollection new.
	interaction add: (MockOccurredMessage receiver: #receiver selector: #selector).
	
	spec should not be matches: interaction
]

{ #category : #tests }
SpecOfExpectedMessageTests >> testNotMatchesInteractionWhichNotContainsRequiredMessage [

	| spec interaction |
	spec := SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
	
	interaction := OrderedCollection new.
	
	spec should not be matches: interaction
]

{ #category : #tests }
SpecOfExpectedMessageTests >> testSucceedValidation [

	| spec interaction result |
	spec := SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
	
	interaction := OrderedCollection new.
	interaction add: (MockOccurredMessage receiver: #receiver selector: #selector).

	result := spec validate: interaction.		
	
	result should be isSuccess
]

{ #category : #tests }
SpecOfExpectedMessageTests >> testSucceedValidationWhenDenialAppliedAndMinUsageCountIsOne [

	| spec interaction result |
	spec := (SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector)) not.
	spec usage minCount: 1.
	
	interaction := OrderedCollection new.
	interaction add: (MockOccurredMessage receiver: #receiver selector: #anotherSelector).
	
	result := spec validate: interaction.		
	
	result should be isSuccess
]

{ #category : #tests }
SpecOfExpectedMessageTests >> testSucceedValidationWhenDenialAppliedAndMinUsageCountIsZero [

	| spec interaction result |
	spec := (SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector)) not.
	spec usage minCount: 0.
	
	interaction := OrderedCollection new.
	interaction add: (MockOccurredMessage receiver: #receiver selector: #anotherSelector).
	
	result := spec validate: interaction.		
	
	result should be isSuccess
]

{ #category : #tests }
SpecOfExpectedMessageTests >> testSucceedValidationWhenDenialAppliedAndNoMessagesWasHappened [

	| spec interaction result |
	spec := (SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector)) not.
	
	interaction := OrderedCollection new.
	
	result := spec validate: interaction.		
	
	result should be isSuccess
]
