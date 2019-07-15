Class {
	#name : #SpecOfObjectClassTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #tests }
SpecOfObjectClassTests >> testMatches [
	| spec |
	spec := SpecOfObjectClass requiredClass: SmallInteger.
	self assert: (spec matches: 10).
	self deny: (spec matches: 10.0)
]
