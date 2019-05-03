"
A MalErdosRenyiGNPGraphGeneratorTest is a test class for testing the behavior of MalErdosRenyiGNPGraphGenerator
"
Class {
	#name : #MalErdosRenyiGNPGraphGeneratorTest,
	#superclass : #TestCase,
	#category : #'Moose-Algos-Graph-Generators-Tests'
}

{ #category : #tests }
MalErdosRenyiGNPGraphGeneratorTest >> testNumberOfNodes [
	| g |
	g := MalErdosRenyiGNPGraphGenerator new.
	g
		nodes: (1 to: 30);
		probability: 0.5.
	g run.
	self assert: g nodes size equals: 30
]
