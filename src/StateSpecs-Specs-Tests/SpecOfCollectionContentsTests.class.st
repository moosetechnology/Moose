Class {
	#name : #SpecOfCollectionContentsTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-Specs-Tests'
}

{ #category : #tests }
SpecOfCollectionContentsTests >> testDescriptionWhenRequiredItemIsSimpleValue [
	| spec |
	spec := SpecOfCollectionContents requiredItem: 10.
	
	self assert: spec description equals: 'should include 10'
]

{ #category : #tests }
SpecOfCollectionContentsTests >> testDescriptionWhenRequiredItemIsSpec [
	| spec |
	spec := SpecOfCollectionContents requiredItem: (Kind of: Integer).
	
	self assert: spec description equals: 'should include (be a kind of Integer)'
]

{ #category : #tests }
SpecOfCollectionContentsTests >> testMatches [
	| spec |
	spec := SpecOfCollectionContents requiredItem: 10.
	self assert: (spec matches: #(10 20)).
	self deny: (spec matches: #(20 40))
]
