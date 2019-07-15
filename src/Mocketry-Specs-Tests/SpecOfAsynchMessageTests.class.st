Class {
	#name : #SpecOfAsynchMessageTests,
	#superclass : #TestCase,
	#category : 'Mocketry-Specs-Tests'
}

{ #category : #tests }
SpecOfAsynchMessageTests >> testFailedValidationWhenDenialApplied [

	| spec result |
	spec := SpecOfAsynchMessage forActiveProcess not.
	
	result := spec validate: ((MockOccurredMessage receiver: #receiver selector: #selector) process: Process new).
	
	result should be isFailure.
	result where description should equal: '#receiver should receive selector in original process'
]

{ #category : #tests }
SpecOfAsynchMessageTests >> testFailedValidationWhenSenderWasWrong [

	| spec result |
	spec := SpecOfAsynchMessage forActiveProcess.
	
	result := spec validate: (MockOccurredMessage receiver: #receiver selector: #selector).
	
	result should be isFailure.
	result where description should equal: '#receiver should receive selector in another process'
]

{ #category : #tests }
SpecOfAsynchMessageTests >> testMatches [

	| spec |
	spec := SpecOfAsynchMessage forActiveProcess.
	
	spec should be matches: (MockOccurredMessage new process: Process new).

	spec should not be matches: (MockOccurredMessage new).

]

{ #category : #tests }
SpecOfAsynchMessageTests >> testSucceedValidation [

	| spec result |
	spec := SpecOfAsynchMessage forActiveProcess.
	
	result := spec validate: (MockOccurredMessage new process: Process new).
	
	result should be isSuccess
]
