Class {
	#name : #SpecOfMessageRaisedExceptionTests,
	#superclass : #TestCase,
	#category : 'Mocketry-Specs-Tests'
}

{ #category : #tests }
SpecOfMessageRaisedExceptionTests >> testFailedValidationWhenDenialApplied [

	| spec message result |
	spec := (SpecOfMessageRaisedException requiredValue: #requiredExc) not.
	message := MockOccurredMessage receiver: #receiver selector: #selector.
	
	message result: (MockOccurredExceptionSignal exception: #requiredExc).	
	result := spec validate: message.
		
	result should be isFailure.
	result where description should equal: 'Got raised #requiredExc from #receiver selector but it should not equal "#requiredExc"'
]

{ #category : #tests }
SpecOfMessageRaisedExceptionTests >> testFailedValidationWhenRaisedErrorIsWrong [

	| spec message result |
	spec := SpecOfMessageRaisedException requiredValue: #requiredExc.
	message := MockOccurredMessage receiver: #receiver selector: #selector.
	
	message result: (MockOccurredExceptionSignal exception: #wrongExc).	
	result := spec validate: message.
		
	result should be isFailure.
	result where description should equal: 'Got raised #wrongExc from #receiver selector but it should equal "#requiredExc"'
]

{ #category : #tests }
SpecOfMessageRaisedExceptionTests >> testMatchesWhenExplicitResult [

	| spec message |
	spec := SpecOfMessageRaisedException requiredValue: #requiredExc.
	message := MockOccurredMessage new.
	
	message result: (MockOccurredExceptionSignal exception: #requiredExc).	
	spec should be matches: message.
	
	message result: (MockOccurredExceptionSignal exception: #wrongExc).
	spec should not be matches: message.
]

{ #category : #tests }
SpecOfMessageRaisedExceptionTests >> testMatchesWhenRequiredResultSpec [

	| spec message |
	spec := SpecOfMessageRaisedException requiredValue: (Kind of: Error).
	message := MockOccurredMessage new.
	
	message result: (MockOccurredExceptionSignal exception: Error new).	
	spec should be matches: message.
	
	message result: (MockOccurredExceptionSignal exception: Notification new).
	spec should not be matches: message.
]

{ #category : #tests }
SpecOfMessageRaisedExceptionTests >> testMatchesWhenSpecWithDenial [

	| spec message |
	spec := (SpecOfMessageRaisedException requiredValue: #requiredExc) not.
	message := MockOccurredMessage new.
	
	message result: (MockOccurredExceptionSignal exception: #requiredExc).	
	spec should not be matches: message.
	
	message result: (MockOccurredExceptionSignal exception: #wrongExc).
	spec should be matches: message
]

{ #category : #tests }
SpecOfMessageRaisedExceptionTests >> testSucceedValidation [

	| spec message result |
	spec := SpecOfMessageRaisedException requiredValue: #requiredExc.	
	message := MockOccurredMessage new.
	
	message result: (MockOccurredExceptionSignal exception: #requiredExc).	
	result := spec validate: message.
	
	result should be isSuccess
]
