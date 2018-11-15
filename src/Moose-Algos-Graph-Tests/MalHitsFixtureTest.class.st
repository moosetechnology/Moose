Class {
	#name : #MalHitsFixtureTest,
	#superclass : #TestCase,
	#instVars : [
		'hits'
	],
	#category : #'Moose-Algos-Graph-Tests'
}

{ #category : #running }
MalHitsFixtureTest >> setUp [
	super setUp.
	hits := MalHits new.

]

{ #category : #tests }
MalHitsFixtureTest >> testComplexCycle [

	MalGraphFixture complexCycleGraph: hits.
	hits run.
]

{ #category : #tests }
MalHitsFixtureTest >> testComplexWCycle [

	MalGraphFixture complexWeightedGraph: hits.
	hits run.
]

{ #category : #tests }
MalHitsFixtureTest >> testCycle [

	MalGraphFixture cycleGraph: hits.
	hits run.
]

{ #category : #tests }
MalHitsFixtureTest >> testNestedCycle [

	MalGraphFixture nestedCycleGraph: hits.
	hits run.
]

{ #category : #tests }
MalHitsFixtureTest >> testSimple [

	(MalGraphFixture simpleGraph: hits) run.
]

{ #category : #tests }
MalHitsFixtureTest >> testSimpleW [

	(MalGraphFixture simpleWeightedGraph: hits) run.
]
