Class {
	#name : #SpecOfMessageSendConditionTests,
	#superclass : #TestCase,
	#category : 'Mocketry-Specs-Tests'
}

{ #category : #tests }
SpecOfMessageSendConditionTests >> testFailedValidationWhenSenderWasWrong [

	| flag spec result |
	spec := SpecOfMessageSendCondition of: [ flag ] by: (Equal to: #done).
	flag := #wrong.
	
	result := spec validate: (MessageSend receiver: #receiver selector: #selector).
	
	result should be isFailure.
	result where spec should be: spec conditionSpec.
	result where subject should be: #wrong
]

{ #category : #tests }
SpecOfMessageSendConditionTests >> testFailedValidationWithMessageArgs [

	| spec result |
	spec := SpecOfMessageSendCondition of: [:arg | arg ] by: (Equal to: true).
	
	result := spec validate: (MessageSend receiver: #receiver selector: #selectorWith: argument: false).
	
	result should be isFailure
]

{ #category : #tests }
SpecOfMessageSendConditionTests >> testMatches [

	| flag spec result |
	spec := SpecOfMessageSendCondition of: [ flag ] by: (Equal to: true).
	
	flag := true.
	spec should be matches: (MessageSend receiver: #receiver selector: #selector).
	
	flag := false.
	spec should not be matches: (MessageSend receiver: #receiver selector: #selector).
	
]

{ #category : #tests }
SpecOfMessageSendConditionTests >> testSucceedValidation [

	| flag spec result |
	spec := SpecOfMessageSendCondition of: [ flag ] by: (Equal to: true).
	flag := true.
	
	result := spec validate: (MessageSend receiver: #receiver selector: #selector).
	
	result should be isSuccess
]

{ #category : #tests }
SpecOfMessageSendConditionTests >> testSucceedValidationWithMessageArgs [

	| spec result |
	spec := SpecOfMessageSendCondition of: [:arg | arg ] by: (Equal to: true).
	
	result := spec validate: (MessageSend receiver: #receiver selector: #selectorWith: argument: true).
	
	result should be isSuccess
]

{ #category : #tests }
SpecOfMessageSendConditionTests >> testValidationWhenDenialApplied [

	| flag spec result |
	spec := (SpecOfMessageSendCondition of: [ flag ] by: (Equal to: true)) not.
	flag := false.
	
	result := spec validate: (MessageSend receiver: #receiver selector: #selector).
	
	result should be isSuccess
]

{ #category : #tests }
SpecOfMessageSendConditionTests >> testValidationWithImplicitConditionSpec [

	| spec result flag |
	spec := SpecOfMessageSendCondition of: [flag ] by: true.
	flag := true.
	
	result := spec validate: (MessageSend receiver: #receiver selector: #selectorWith: argument: true).
	
	result should be isSuccess
]
