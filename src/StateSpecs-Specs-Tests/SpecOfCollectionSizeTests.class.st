Class {
	#name : #SpecOfCollectionSizeTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #tests }
SpecOfCollectionSizeTests >> testMatches [
	| spec |
	spec := SpecOfCollectionSize requiredSize: 2.
	self assert: (spec matches: #(10 20)).
	self deny: (spec matches: #(20 40 30))
]
