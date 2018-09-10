Class {
	#name : #SpecOfBooleanPropertyTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #tests }
SpecOfBooleanPropertyTests >> testFailedValidation [

	| spec result |
	spec := SpecOfBooleanProperty fromMessage: (Message selector: #isEmpty).
	
	result := spec validate: #(1 2).
	
	self assert: result isFailure.
	self assert: result description equals: '#(1 2) should be isEmpty'
]

{ #category : #tests }
SpecOfBooleanPropertyTests >> testFailedValidationWhenSpecWithDenial [

	| spec result |
	spec := (SpecOfBooleanProperty fromMessage: (Message selector: #isEmpty)) not.
	
	result := spec validate: #().
	
	self assert: result isFailure.
	self assert: result description equals: '#() should not be isEmpty'
]

{ #category : #tests }
SpecOfBooleanPropertyTests >> testMatches [

	| spec |
	spec := SpecOfBooleanProperty fromMessage: (Message selector: #isEmpty).
	
	self assert: (spec matches: #()).
	self deny: (spec matches: #(1 2))
]

{ #category : #tests }
SpecOfBooleanPropertyTests >> testMatchesWhenMessageIsNotBoolean [

	| spec |
	spec := SpecOfBooleanProperty fromMessage: (Message selector: #first).
	
	self deny: (spec matches: #(1 2))
]

{ #category : #tests }
SpecOfBooleanPropertyTests >> testMatchesWithDenial [

	| spec |
	spec := (SpecOfBooleanProperty fromMessage: (Message selector: #isEmpty)) not.
	
	self deny: (spec matches: #()).
	self assert: (spec matches: #(1 2))
]

{ #category : #tests }
SpecOfBooleanPropertyTests >> testMatchesWithDenialWhenMessageIsNotBoolean [

	| spec |
	spec := (SpecOfBooleanProperty fromMessage: (Message selector: #first)) not.
	
	self assert: (spec matches: #(1 2))
]

{ #category : #tests }
SpecOfBooleanPropertyTests >> testSucceedValidation [

	| spec result |
	spec := SpecOfBooleanProperty fromMessage: (Message selector: #isEmpty).
	
	result := spec validate: #().
	
	self assert: result isSuccess
]
