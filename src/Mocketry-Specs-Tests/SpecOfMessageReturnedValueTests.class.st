Class {
	#name : #SpecOfMessageReturnedValueTests,
	#superclass : #TestCase,
	#category : 'Mocketry-Specs-Tests'
}

{ #category : #tests }
SpecOfMessageReturnedValueTests >> testFailedValidationWhenDenialApplied [

	| spec message result |
	spec := (SpecOfMessageReturnedValue requiredValue: #requiredValue) not.	
	message := MockOccurredMessage receiver: #receiver selector: #selector.
	
	message result: #requiredValue asOccurredMessageResult.	
	result := spec validate: message.
		
	result should be isFailure.
	result where description should equal: 'Got "#requiredValue" from #receiver selector but it should not equal "#requiredValue"'
]

{ #category : #tests }
SpecOfMessageReturnedValueTests >> testFailedValidationWhenReturnedValueIsWrong [

	| spec message result |
	spec := SpecOfMessageReturnedValue requiredValue: #requiredValue.	
	message := MockOccurredMessage receiver: #receiver selector: #selector.
	
	message result: #actualValue asOccurredMessageResult.	
	result := spec validate: message.
		
	result should be isFailure.
	result where description should equal: 'Got "#actualValue" from #receiver selector but it should equal "#requiredValue"'
]

{ #category : #tests }
SpecOfMessageReturnedValueTests >> testMatchesWhenExplicitResult [

	| spec message |
	spec := SpecOfMessageReturnedValue requiredValue: #returnedValue.	
	message := MockOccurredMessage new.
	
	message result: #returnedValue asOccurredMessageResult.	
	spec should be matches: message.
	
	message result: #anotherValue asOccurredMessageResult.	
	spec should not be matches: message.
]

{ #category : #tests }
SpecOfMessageReturnedValueTests >> testMatchesWhenRequiredResultIsSpec [

	| spec message |
	spec := SpecOfMessageReturnedValue requiredValue: (Kind of: Number).	
	message := MockOccurredMessage new.
	
	message result: 1 asOccurredMessageResult.	
	spec should be matches: message.
	
	message result: 'string' asOccurredMessageResult.
	spec should not be matches: message
]

{ #category : #tests }
SpecOfMessageReturnedValueTests >> testMatchesWhenSpecWithDenial [

	| spec message |
	spec := (SpecOfMessageReturnedValue requiredValue: #returnedValue) not.
	message := MockOccurredMessage new.
	
	message result: #returnedValue asOccurredMessageResult.	
	spec should not be matches: message.
	
	message result: #anotherValue asOccurredMessageResult.	
	spec should be matches: message.

]

{ #category : #tests }
SpecOfMessageReturnedValueTests >> testSucceedValidation [

	| spec message result |
	spec := SpecOfMessageReturnedValue requiredValue: #returnedValue.	
	message := MockOccurredMessage new.
	
	message result: #returnedValue asOccurredMessageResult.	
	result := spec validate: message.
	
	result should be isSuccess
]
