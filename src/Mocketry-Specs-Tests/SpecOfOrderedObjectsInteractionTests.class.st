Class {
	#name : #SpecOfOrderedObjectsInteractionTests,
	#superclass : #TestCase,
	#category : 'Mocketry-Specs-Tests'
}

{ #category : #tests }
SpecOfOrderedObjectsInteractionTests >> testFailedValidationWhenMessageWasNotOccured [
	
	| spec messages result |
	spec := SpecOfOrderedObjectsInteraction new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector3).
	}.
	
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver3 selector: #selector2.
	}.
	
	result := spec validate: messages.
	
	result should be isFailure.
	result where description should equal: '#receiver never received selector3'
]

{ #category : #tests }
SpecOfOrderedObjectsInteractionTests >> testFailedValidationWhenWrongOrder [
	
	| spec messages result |
	spec := SpecOfOrderedObjectsInteraction new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector2).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector3).
	}.
	
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver selector: #selector3.
		MockOccurredMessage receiver: #receiver selector: #selector2.
	}.
	
	result := spec validate: messages.
	
	result should be isFailure.
	result where description should equal: '#receiver received selector3 in wrong time'
]

{ #category : #tests }
SpecOfOrderedObjectsInteractionTests >> testMatches [
	
	| spec messages |
	spec := SpecOfOrderedObjectsInteraction new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver3 selector: #selector3).
	}.
	
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver2 selector: #selector2.
		MockOccurredMessage receiver: #receiver3 selector: #selector3
	}.
	
	spec should be matches: messages
]

{ #category : #tests }
SpecOfOrderedObjectsInteractionTests >> testMatchesWhenSomeMessageExpectedTwice [
	
	| spec messages |
	spec := SpecOfOrderedObjectsInteraction new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver3 selector: #selector3).
	}.
	spec expectedMessages first usage minCount: 2.
		
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver2 selector: #selector2.
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver3 selector: #selector3
	}.
	
	spec should be matches: messages
]

{ #category : #tests }
SpecOfOrderedObjectsInteractionTests >> testNotMatchesWhenMessagesAreOccuredInWrongOrder [
	
	| spec messages |
	spec := SpecOfOrderedObjectsInteraction new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver3 selector: #selector3).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).		
	}.
	
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver2 selector: #selector2.
		MockOccurredMessage receiver: #receiver3 selector: #selector3
	}.
	
	spec should not be matches: messages
]

{ #category : #tests }
SpecOfOrderedObjectsInteractionTests >> testNotMatchesWhenSomeMessageWasNotOccured [
	
	| spec messages |
	spec := SpecOfOrderedObjectsInteraction new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver3 selector: #selector3).
	}.
	
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver2 selector: #selector2	}.
	
	spec should not be matches: messages
]

{ #category : #tests }
SpecOfOrderedObjectsInteractionTests >> testSucceedValidation [
	
	| spec messages result |
	spec := SpecOfOrderedObjectsInteraction new.
	spec expectedMessages: { 
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver selector: #selector).
		SpecOfExpectedMessage from: (MockOccurredMessage receiver: #receiver3 selector: #selector3).
	}.
	
	messages := {
		MockOccurredMessage receiver: #receiver selector: #selector.
		MockOccurredMessage receiver: #receiver2 selector: #selector2.
		MockOccurredMessage receiver: #receiver3 selector: #selector3
	}.
	
	result := spec validate: messages.
	
	result should be isSuccess
]
