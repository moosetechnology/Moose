Class {
	#name : #SpecOfCollectionOrderedEqualityTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #tests }
SpecOfCollectionOrderedEqualityTests >> testMatches [

	| spec |
	spec := SpecOfCollectionOrderedEquality requiredValue: #(1 2 3).

	self assert: (spec matches: #(1 2 3)).
	self deny: (spec matches: #(2 1 3)).
]

{ #category : #tests }
SpecOfCollectionOrderedEqualityTests >> testMatchesWithDenial [

	| spec |
	spec := (SpecOfCollectionOrderedEquality requiredValue: #(1 2 3)) not.

	self deny: (spec matches: #(1 2 3)).
	self assert: (spec matches: #(2 1 3)).
]
