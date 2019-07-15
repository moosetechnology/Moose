Class {
	#name : #SpecOfStringBeginningTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #tests }
SpecOfStringBeginningTests >> testMatches [
	| spec |
	spec := SpecOfStringBeginning requiredValue: 'test'.
	
	self assert: (spec matches: 'test string').
	self assert: (spec matches: 'Test string').
	self deny: (spec matches: 'some test string')
]

{ #category : #tests }
SpecOfStringBeginningTests >> testMatchesCaseSensitive [
	| spec |
	spec := SpecOfStringBeginning requiredValue: 'test' caseSensitive: true.
	
	self assert: (spec matches: 'test string').
	self deny: (spec matches: 'Test string').
	self deny: (spec matches: 'some test string')
]
