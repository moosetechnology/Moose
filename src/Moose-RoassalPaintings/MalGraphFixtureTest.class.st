Class {
	#name : #MalGraphFixtureTest,
	#superclass : #TestCase,
	#category : #'Moose-RoassalPaintings-Test'
}

{ #category : #tests }
MalGraphFixtureTest >> testGraphsRendering [

	self shouldnt: [ (MalGraphFixture view: #simpleGraph: layout: #tree) open delete ] raise: Error.
	self shouldnt: [ (MalGraphFixture view: #cycleGraph: layout: #tree) open delete ] raise: Error.
	self shouldnt: [ (MalGraphFixture view: #aseCircuitGraph: layout: #tree) open delete ] raise: Error.
	self shouldnt: [ (MalGraphFixture view: #moduleGraph: layout: #circle) open delete ] raise: Error.
	self shouldnt: [ (MalGraphFixture view: #nestedCycleGraph: layout: #circle) open delete ] raise: Error.
	self shouldnt: [ (MalGraphFixture viewArrowed: #complexCycleGraph2: layout: #circle) open delete ] raise: Error.
]
