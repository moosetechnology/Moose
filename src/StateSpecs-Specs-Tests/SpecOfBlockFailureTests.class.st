Class {
	#name : #SpecOfBlockFailureTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #tests }
SpecOfBlockFailureTests >> testFailedValidationWhenUnexpectedErrorsShouldBePassed [
	| spec |
	spec := SpecOfBlockFailure requiredFailure: ZeroDivide.
	spec passUnexpectedFailures.
	
	self should: [spec validate: [ #() at: 1]] raise: SubscriptOutOfBounds
]

{ #category : #tests }
SpecOfBlockFailureTests >> testFailedValidationWithExplicitExpectedErrorInstance [
	| spec result expectedError anotherError |
	expectedError := Error new messageText: 'test error'.
	
	spec := SpecOfBlockFailure requiredFailure: expectedError.	
	
	anotherError := Error new messageText: 'another error'.
	
	result := spec validate: [ anotherError signal].
	
	self assert: result isFailure.
	self assert: result description equals: 'Got "', anotherError stringForSpecValidation , '" but it should equal "', expectedError stringForSpecTitle, '"'
]

{ #category : #tests }
SpecOfBlockFailureTests >> testFailedValidationWithExplicitFailureSpec [
	| spec result expectedError anotherError |
	expectedError := Error new messageText: 'test error'.
	
	spec := SpecOfBlockFailure requiredFailure: (SpecOfIdentity requiredValue: expectedError).	
	
	anotherError := Error new messageText: 'another error'.
	
	result := spec validate: [ anotherError signal].
	
	self assert: result isFailure.
	self assert: result description equals: 'Got "', anotherError stringForSpecValidation , '" but it should be "', expectedError stringForSpecTitle, '"'
]

{ #category : #tests }
SpecOfBlockFailureTests >> testMatches [
	| spec |
	spec := SpecOfBlockFailure requiredFailure: ZeroDivide.
	self 
		assert: (spec matches: 
					[1 / 0.
					self error: 'continue']).
	self deny: (spec matches: [1 + 2]).
	self deny: (spec matches: [#() at: 1])
]

{ #category : #tests }
SpecOfBlockFailureTests >> testMatchesToNotFailedBlockWhenSpecWithDenial [
	| spec |
	spec := (SpecOfBlockFailure requiredFailure: ZeroDivide) not.
	self assert: (spec matches: ['empty block'])
]

{ #category : #tests }
SpecOfBlockFailureTests >> testMatchesWhenUnexpectedFailuresShouldBePassed [
	| spec |
	spec := SpecOfBlockFailure requiredFailure: ZeroDivide.
	spec passUnexpectedFailures.
	
	self assert: (spec matches: 
					[1 / 0.
					self error: 'continue']).
	self deny: (spec matches: [1 + 2]).
	self should: [spec matches: [#() at: 1]] raise: Error
]

{ #category : #tests }
SpecOfBlockFailureTests >> testShouldNotPassUnexpectedFailuresByDefault [

	| spec |
	spec := SpecOfBlockFailure requiredFailure: Error.
	
	self deny: spec shouldPassUnexpectedFailures 
]

{ #category : #tests }
SpecOfBlockFailureTests >> testShouldPassDNUSignalByDefault [
	| spec |
	spec := SpecOfBlockFailure requiredFailure: Error.
	self 
		should: [spec matches: [1 someMessage]]
		raise: MessageNotUnderstood 
]

{ #category : #tests }
SpecOfBlockFailureTests >> testShouldPassDeprecationSignalByDefault [
	| spec |
	spec := SpecOfBlockFailure requiredFailure: Error.
	self 
		should: [spec matches: [self deprecated: 'test']]
		raise: Deprecation
]

{ #category : #tests }
SpecOfBlockFailureTests >> testShouldPassHaltSignalByDefault [
	| spec |
	spec := SpecOfBlockFailure requiredFailure: Error.
	self 
		should: [spec matches: [Halt now]]
		raise: Halt
]

{ #category : #tests }
SpecOfBlockFailureTests >> testShouldPassInternalSpecFailedErrorByDefault [
	| spec |
	spec := SpecOfBlockFailure requiredFailure: Error.
	self 
		should: [spec matches: [SpecOfFailed signal]]
		raise: SpecOfFailed
]

{ #category : #tests }
SpecOfBlockFailureTests >> testSucceedValidationWithExplicitFailureSpec [
	| spec result expectedError |
	expectedError := Error new messageText: 'test error'.
	
	spec := SpecOfBlockFailure requiredFailure: (SpecOfIdentity requiredValue: expectedError).	
	
	result := spec validate: [ expectedError signal].
	
	self assert: result isSuccess
]

{ #category : #tests }
SpecOfBlockFailureTests >> testValidationExplicitPassingFailure [
	| spec result |
	spec := SpecOfBlockFailure requiredFailure: MessageNotUnderstood.
	
	result := spec validate: [ 1 someMessage ].
	
	self assert: result isSuccess
]

{ #category : #tests }
SpecOfBlockFailureTests >> testValidationOfBlockFailedByAnotherError [
	| spec result error |
	spec := SpecOfBlockFailure requiredFailure: ZeroDivide.
	error := Error new messageText: 'test error'.
	
	result := spec validate: [ error signal].
	
	self assert: result isFailure.
	self assert: result description equals: 'Got "', error stringForSpecValidation ,'" but it should be an instance of ZeroDivide'.
	
]

{ #category : #tests }
SpecOfBlockFailureTests >> testValidationOfNotFailedBlock [
	| spec result |
	spec := SpecOfBlockFailure requiredFailure: ZeroDivide.
	
	result := spec validate: [ 'blockBody' ].
	
	self assert: result isFailure.
	self assert: result description equals: 'Got no failures but should be an instance of ZeroDivide'
]

{ #category : #tests }
SpecOfBlockFailureTests >> testValidationOfNotFailedBlockWhenSpecWithDenial [
	| spec result |
	spec := (SpecOfBlockFailure requiredFailure: ZeroDivide) not.
	
	result := spec validate: [ 'blockBody' ].
	
	self assert: result isSuccess
]

{ #category : #tests }
SpecOfBlockFailureTests >> testValidationWithAnyRequiredFailure [
	
	| spec result |
	spec := SpecOfBlockFailure requiredFailure: Any.	
	
	result := spec validate: [ self error: 'test'].
	
	self assert: result isSuccess
]
