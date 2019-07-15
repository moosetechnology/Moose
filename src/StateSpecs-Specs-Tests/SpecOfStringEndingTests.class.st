Class {
	#name : #SpecOfStringEndingTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #tests }
SpecOfStringEndingTests >> testMatches [
	| spec |
	spec := SpecOfStringEnding requiredValue: 'test'.
	
	self assert: (spec matches: 'string for test').
	self assert: (spec matches: 'string for Test').
	self deny: (spec matches: 'some test string')
]

{ #category : #tests }
SpecOfStringEndingTests >> testMatchesCaseSensitive [
	| spec |
	spec := SpecOfStringEnding requiredValue: 'test' caseSensitive: true.
	
	self assert: (spec matches: 'string for test').
	self deny: (spec matches: 'string for Test').
	self deny: (spec matches: 'some test string')
]
