Class {
	#name : #SpecOfMessageReceiverTests,
	#superclass : #TestCase,
	#category : 'Mocketry-Specs-Tests'
}

{ #category : #tests }
SpecOfMessageReceiverTests >> testFailedValidationWhenSenderWasWrong [

	| spec result |
	spec := SpecOfMessageReceiver requiredValue: 2.

	result := spec validate: (MockOccurredMessage receiver: 1 selector: #someMessage).
	
	result should be isFailure.
	result where description should equal: 'someMessage is sent to "1" but it should be "2"'
]

{ #category : #tests }
SpecOfMessageReceiverTests >> testFailedValidationWhenSpecWithDenial [

	| spec result |
	spec := (SpecOfMessageReceiver requiredValue: 2) not.

	result := spec validate: (MockOccurredMessage receiver: 2 selector: #someMessage).
	
	result should be isFailure.
	result where description should equal: 'someMessage is sent to "2" but it should not be "2"'
]

{ #category : #tests }
SpecOfMessageReceiverTests >> testMatchesWhenExplicitReceiver [

	| spec |
	spec := SpecOfMessageReceiver requiredValue: 'requiredReceiver'.
	
	spec should be matches: (MockOccurredMessage receiver: 'requiredReceiver' selector: #someMessage).
	
	spec should not be matches: (MockOccurredMessage receiver: 'requiredReceiver' copy selector: #someMessage).
	
	spec should not be matches: (MockOccurredMessage receiver: 'wrongReceiver' selector: #someMessage).
]

{ #category : #tests }
SpecOfMessageReceiverTests >> testMatchesWhenRequiredReceiverIsSpec [

	| spec |
	spec := SpecOfMessageReceiver requiredValue: (Kind of: Number).
	
	spec should be matches: (MockOccurredMessage receiver: 1 selector: #someMessage).
	
	spec should not be matches: (MockOccurredMessage receiver: 'string' selector: #someMessage).
]

{ #category : #tests }
SpecOfMessageReceiverTests >> testMatchesWhenSpecWithDenial [

	| spec |
	spec := (SpecOfMessageReceiver requiredValue: 1) not.
	
	spec should be matches: (MockOccurredMessage receiver: 2 selector: #someMessage).
	
	spec should not be matches: (MockOccurredMessage receiver: 1 selector: #someMessage).
]

{ #category : #tests }
SpecOfMessageReceiverTests >> testSucceedValidation [

	| spec result |
	spec := SpecOfMessageReceiver requiredValue: 2.

	result := spec validate: (MockOccurredMessage receiver: 2 selector: #someMessage).
	
	result should be isSuccess
]
