Class {
	#name : #SpecOfMessageArgumentTests,
	#superclass : #TestCase,
	#category : 'Mocketry-Specs-Tests'
}

{ #category : #tests }
SpecOfMessageArgumentTests >> testFailedValidationWhenSenderWasWrong [

	| spec result |
	spec := SpecOfMessageArgument number: 2 requiredValue: 10.

	result := spec validate: (MockOccurredMessage receiver: 1 selector: #someMessage:with:with: arguments: {5. 6. 7}).
	
	result should be isFailure.
	result where description should equal: '1 received someMessage: 5 with: 6 with: 7 but arg 2 should equal "10"'
]

{ #category : #tests }
SpecOfMessageArgumentTests >> testFailedValidationWhenSpecWithDenial [

	| spec result |
	spec := (SpecOfMessageArgument number: 2 requiredValue: 10) not.

	result := spec validate: (MockOccurredMessage receiver: 1 selector: #someMessage:with:with: arguments: {5. 10. 7}).
	
	result should be isFailure.
	result where description should equal: '1 received someMessage: 5 with: 10 with: 7 but arg 2 should not equal "10"'
]

{ #category : #tests }
SpecOfMessageArgumentTests >> testFailedValidationWhenThereIsNoRequiredArgument [

	| spec result |
	spec := SpecOfMessageArgument number: 2 requiredValue: 10.

	result := spec validate: (MockOccurredMessage receiver: 1 selector: #someMessage: arguments: {5}).
	
	result should be isFailure.
	result where description should equal: '1 received someMessage: 5 but it should have arg 2 which should equal "10"'
]

{ #category : #tests }
SpecOfMessageArgumentTests >> testFailedValidationWhenThereIsNoRequiredArgumentAndSpecWithDenial [

	| spec result |
	spec := (SpecOfMessageArgument number: 2 requiredValue: 10) not.

	result := spec validate: (MockOccurredMessage receiver: 1 selector: #someMessage: arguments: {5}).
	
	result should be isFailure.
	result where description should equal: '1 received someMessage: 5 but it should have arg 2 which should not equal "10"'
]

{ #category : #tests }
SpecOfMessageArgumentTests >> testMatchesWhenExplicitArgumentValue [

	| spec |
	spec := SpecOfMessageArgument number: 2 requiredValue: 'requiredArgument'.
	
	spec should be matches: (MockOccurredMessage receiver: Any selector: #someMessage:with:with: arguments: {Any. 'requiredArgument'. Any}).
	
	spec should be matches: (MockOccurredMessage receiver: Any selector: #someMessage:with:with: arguments: {Any. 'requiredArgument' copy. Any}).
	
	spec should not be matches: (MockOccurredMessage receiver: Any selector: #someMessage:with:with: arguments: {Any. 'wrongArgument'. Any}).

	spec should not be matches: (MockOccurredMessage receiver: Any selector: #someMessage: arguments: {Any}).

]

{ #category : #tests }
SpecOfMessageArgumentTests >> testMatchesWhenRequiredArgumentIsSpec [

	| spec |
	spec := SpecOfMessageArgument number: 2 requiredValue: (Kind of: Number).
	
	spec should be matches: (MockOccurredMessage receiver: Any selector: #someMessage:with:with: arguments: {Any. 1. Any}).

	spec should not be matches: (MockOccurredMessage receiver: Any selector: #someMessage:with:with: arguments: {Any. 'string'. Any}).
]

{ #category : #tests }
SpecOfMessageArgumentTests >> testSucceedValidation [

	| spec result |
	spec := SpecOfMessageArgument number: 2 requiredValue: 10.

	result := spec validate: (MockOccurredMessage receiver: 1 selector: #someMessage:with:with: arguments: {5. 10. 7}).
	
	result should be isSuccess
]
