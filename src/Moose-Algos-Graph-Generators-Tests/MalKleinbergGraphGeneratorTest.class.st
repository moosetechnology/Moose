Class {
	#name : #MalKleinbergGraphGeneratorTest,
	#superclass : #TestCase,
	#category : #'Moose-Algos-Graph-Generators-Tests'
}

{ #category : #tests }
MalKleinbergGraphGeneratorTest >> testNumberOfLocalNodes [
	| g |
	g := MalKleinbergGraphGenerator new.
	g nodes: (1 to: 10*10);
	n: 10.
	g initializeNodesOnGrid.
	self assert: (g nodesLessThanDistance: 1 toNode: g nodes first) size equals: 3.
	self assert: (g nodesLessThanDistance: 1 toNode: g nodes second) size equals: 4
]
