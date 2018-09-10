Class {
	#name : #SpecOfMessageSelectorTests,
	#superclass : #TestCase,
	#category : 'Mocketry-Specs-Tests'
}

{ #category : #tests }
SpecOfMessageSelectorTests >> testFailedValidationWhenSenderWasWrong [

	| spec result |
	spec := SpecOfMessageSelector requiredValue: #someMessage.

	result := spec validate: (MockOccurredMessage receiver: 1 selector: #anotherMessage).
	
	result should be isFailure.
	result where description should equal: '1 received anotherMessage but it should be "#someMessage"'
]

{ #category : #tests }
SpecOfMessageSelectorTests >> testFailedValidationWhenSpecWithDenial [

	| spec result |
	spec := (SpecOfMessageSelector requiredValue: #someMessage) not.

	result := spec validate: (MockOccurredMessage receiver: 1 selector: #someMessage).
	
	result should be isFailure.
	result where description should equal: '1 received someMessage but it should not be "#someMessage"'
]

{ #category : #tests }
SpecOfMessageSelectorTests >> testMatchesWhenSpecSelector [

	| spec |
	spec := SpecOfMessageSelector requiredValue: (Kind of: Symbol).
	
	spec should be matches: (MockOccurredMessage receiver: 1 selector: #someMessage).
	
	spec should be matches: (MockOccurredMessage receiver: 1 selector: #anotherMessage).
	
	spec should not be matches: (MockOccurredMessage receiver: 1 selector: 'stringSelector').
]

{ #category : #tests }
SpecOfMessageSelectorTests >> testMatchesWhenSpecWithDenial [

	| spec |
	spec := (SpecOfMessageSelector requiredValue: #someMessage) not.
	
	spec should not be matches: (MockOccurredMessage receiver: 1 selector: #someMessage).
	
	spec should be matches: (MockOccurredMessage receiver: 1 selector: #anotherMessage).
]

{ #category : #tests }
SpecOfMessageSelectorTests >> testMatchesWhenSymbolSelector [

	| spec |
	spec := SpecOfMessageSelector requiredValue: #someMessage.
	
	spec should be matches: (MockOccurredMessage receiver: 1 selector: #someMessage).
	
	spec should not be matches: (MockOccurredMessage receiver: 1 selector: #anotherMessage).
]

{ #category : #tests }
SpecOfMessageSelectorTests >> testSucceedValidation [

	| spec result |
	spec := SpecOfMessageSelector requiredValue: #someMessage.

	result := spec validate: (MockOccurredMessage receiver: 1 selector: #someMessage).
	
	result should be isSuccess
]
