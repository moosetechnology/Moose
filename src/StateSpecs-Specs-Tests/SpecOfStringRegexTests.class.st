Class {
	#name : #SpecOfStringRegexTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #tests }
SpecOfStringRegexTests >> testMatches [
	| spec |
	spec := SpecOfStringRegex requiredValue: '^test'.
	
	self assert: (spec matches: 'test string').
	self assert: (spec matches: 'Test string').
	self deny: (spec matches: 'some test string')
]

{ #category : #tests }
SpecOfStringRegexTests >> testMatchesCaseSensitive [
	| spec |
	spec := SpecOfStringRegex requiredValue: '^test' caseSensitive: true.
	
	self assert: (spec matches: 'test string').
	self deny: (spec matches: 'Test string').
	self deny: (spec matches: 'some test string')
]
