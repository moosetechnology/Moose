"
A MalGrid2DGeneratorTest is a test class for testing the behavior of MalGrid2DGenerator
"
Class {
	#name : #MalGrid2DGeneratorTest,
	#superclass : #TestCase,
	#category : #'Moose-Algos-Graph-Generators-Tests'
}

{ #category : #tests }
MalGrid2DGeneratorTest >> testNumberOfNodes [
	| g |
	g := MalGrid2DGenerator new.
	g
		height: 10;
		width: 5;
		neighborhood: #vonNeumann.
	g run.
	self assert: g nodes size equals: 50
]
