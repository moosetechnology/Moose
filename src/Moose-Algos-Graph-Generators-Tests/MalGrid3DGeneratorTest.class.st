Class {
	#name : #MalGrid3DGeneratorTest,
	#superclass : #TestCase,
	#category : #'Moose-Algos-Graph-Generators-Tests'
}

{ #category : #tests }
MalGrid3DGeneratorTest >> testNumberOfNodes [
	| g |
	g := MalGrid3DGenerator new.
	g
		length: 3;
		height: 3;
		width: 3;
		neighborhood: #vonNeumann.
	g run.
	self assert: g nodes size equals: 27
]
