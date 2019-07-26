"
A MalErdosRenyiGNMGraphGeneratorTest is a test class for testing the behavior of MalErdosRenyiGNMGraphGenerator
"
Class {
	#name : #MalErdosRenyiGNMGraphGeneratorTest,
	#superclass : #TestCase,
	#category : #'Moose-Algos-Graph-Generators-Tests'
}

{ #category : #tests }
MalErdosRenyiGNMGraphGeneratorTest >> testNumberOfEdges [
	| g |
	g := MalErdosRenyiGNMGraphGenerator new.
	g
		nodes: (1 to: 30);
		edgesNumber: 20.
	g run.
	self assert: g edges size equals: 20
]

{ #category : #tests }
MalErdosRenyiGNMGraphGeneratorTest >> testNumberOfNodes [
	| g |
	g := MalErdosRenyiGNMGraphGenerator new.
	g
		nodes: (1 to: 30);
		edgesNumber: 20.
	g run.
	self assert: g nodes size equals: 30
]
