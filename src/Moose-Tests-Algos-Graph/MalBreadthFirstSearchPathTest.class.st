Class {
	#name : #MalBreadthFirstSearchPathTest,
	#superclass : #TestCase,
	#instVars : [
		'bfsp'
	],
	#category : #'Moose-Tests-Algos-Graph'
}

{ #category : #running }
MalBreadthFirstSearchPathTest >> setUp [ 

	super setUp.
	bfsp := MalBreadthFirstSearchPath new.
]

{ #category : #'as yet unclassified' }
MalBreadthFirstSearchPathTest >> testAseGraph [
	"
	self debug: #testAseGraph
	"

	MalGraphFixture aseCircuitGraph: bfsp.
	self assert: (#($a $b $c) hasEqualElements: (bfsp runFrom: $a to: $c)).
	self assert: (#($d $b $c) hasEqualElements: (bfsp runFrom: $d to: $c)).
	self assert: (#($e $a) hasEqualElements: (bfsp runFrom: $e to: $a)).
	self assert: (#($a $b $d $e) hasEqualElements: (bfsp runFrom: $a to: $e)).
	self assert: (#($d $b $c $f) hasEqualElements: (bfsp runFrom: $d to: $f)).
	self should: [bfsp runFrom: $f to: $a] raise: Error.

]

{ #category : #'as yet unclassified' }
MalBreadthFirstSearchPathTest >> testSimpleGraph [
	"
	self debug: #testSimpleGraph
	"

	MalGraphFixture simpleGraph: bfsp.
	self assert: (#($a $b $c) hasEqualElements: (bfsp runFrom: $a to: $c)).
	self assert: (#($d $c) hasEqualElements: (bfsp runFrom: $d to: $c)).
]
