"
A MalWaltzStrogatzGraphGeneratorTest is a test class for testing the behavior of MalWaltzStrogatzGraphGenerator
"
Class {
	#name : #MalWaltzStrogatzGraphGeneratorTest,
	#superclass : #TestCase,
	#category : #'Moose-Algos-Graph-Generators-Tests'
}

{ #category : #tests }
MalWaltzStrogatzGraphGeneratorTest >> testNumberOfNodes [
	| g |
	g := MalWaltzStrogatzGraphGenerator new.
	g
		nodes: (1 to: 30);
		k: 10.
	g run.
	self assert: g nodes size equals: 30
]
