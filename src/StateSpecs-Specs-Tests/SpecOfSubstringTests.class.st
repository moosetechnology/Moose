Class {
	#name : #SpecOfSubstringTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #tests }
SpecOfSubstringTests >> testMatches [
	| spec |
	spec := SpecOfSubstring requiredValue: 'test'.
	
	self assert: (spec matches: 'some test string').
	self assert: (spec matches: 'some Test string').
	self deny: (spec matches: 'some string')
]

{ #category : #tests }
SpecOfSubstringTests >> testMatchesCaseSensitive [
	| spec |
	spec := SpecOfSubstring requiredValue: 'test' caseSensitive: true.
	
	self assert: (spec matches: 'some test string').
	self deny: (spec matches: 'some Test string').
	self deny: (spec matches: 'some string')
]
