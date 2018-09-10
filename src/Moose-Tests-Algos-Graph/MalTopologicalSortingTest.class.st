"
A MalTopologicalSortingTest is a test class for testing the behavior of MalTopologicalSorting
"
Class {
	#name : #MalTopologicalSortingTest,
	#superclass : #TestCase,
	#instVars : [
		'sorter'
	],
	#category : #'Moose-Tests-Algos-Graph'
}

{ #category : #running }
MalTopologicalSortingTest >> setUp [
	super setUp.
	sorter := MalTopologicalSorting new
]

{ #category : #tests }
MalTopologicalSortingTest >> testSortStringHierarchy [

	sorter
		addNodesFrom: String
		childrenBlock: [ :class | class subclasses ].

	self
		assertCollection: (sorter run collect: [ :item | item model ] as: Set)
		equals: { WideSymbol . ByteSymbol . Symbol . WideString . ByteString . String } asSet.
]

{ #category : #tests }
MalTopologicalSortingTest >> testSortWithCycle [
	MalGraphFixture cycleGraph: sorter.
	self
		should: [ sorter run ]
		raise: Error
]

{ #category : #tests }
MalTopologicalSortingTest >> testSortWithReducedGraph [
	| graphReducer result |
	graphReducer := MalGraphReducer new.
	MalGraphFixture complexCycleGraph2: graphReducer.
	sorter privateNodes: graphReducer run.
	
	result := sorter run collect: #model.
	
	self
		assert: (result at: 1)
		equals: $h.
	self
		assertCollection: (result at: 2)
		hasSameElements: #($e $f $d $b).
	self
		assert: (result at: 3)
		equals: $i.
	self
		assert: (result at: 4)
		equals: $a.
	self
		assert: (result at: 5)
		equals: $g. 
	self
		assert: (result at: 6)
		equals: $c
]

{ #category : #tests }
MalTopologicalSortingTest >> testSortWithoutCyclesComplexGraph [
	MalGraphFixture withoutCyclesComplexGraph: sorter.
	self
		assertCollection: (sorter run collect: [ :item | item model ] as: Array)
		equals: #($s $r $i $f $p $n $m $d $q $o $l $k $h $c $g $e $j $b $a)
]
