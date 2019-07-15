Class {
	#name : #SpecOfObjectSuperclassTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #tests }
SpecOfObjectSuperclassTests >> testMatches [
	| spec |
	spec := SpecOfObjectSuperclass requiredClass: Integer.
	self assert: (spec matches: 10).
	self deny: (spec matches: 10.0)
]

{ #category : #tests }
SpecOfObjectSuperclassTests >> testMatches2 [
	| spec |
	spec := SpecOfObjectSuperclass requiredClass: SmallInteger.
	self assert: (spec matches: 10).
	self deny: (spec matches: 10.0)
]
