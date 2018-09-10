Class {
	#name : #DeepGraphWithNilTraverserTest,
	#superclass : #DeepTraverserGraphTest,
	#category : #'DeepTraverser-Tests-Transformed-To-Examples'
}

{ #category : #running }
DeepGraphWithNilTraverserTest >> setUp [
	super setUp.
	
	graph := Dictionary new.
	graph at: 0 put: { 1 . nil }.
	graph at: nil put: { 2 }
]

{ #category : #tests }
DeepGraphWithNilTraverserTest >> testGraphStartingWithNil [
	| nodes edges traverser |

	nodes := OrderedCollection new.
	edges := OrderedCollection new.
	
	traverser := DeepTraverser new 
		onNodeAction: [ :n | nodes add: n ];
		onEdgeAction: [ :f :t | edges add: (f -> t) ];
		onNodeTraverse: [ :n | graph at: n ifAbsent: [ nil ] ];
		on: graph startWithout: nil;
		run.
	
	self assert: nodes = { } asOrderedCollection.
	self assert: edges = { } asOrderedCollection
]

{ #category : #tests }
DeepGraphWithNilTraverserTest >> testGraphStartingWithZero [
	| nodes edges traverser |

	nodes := OrderedCollection new.
	edges := OrderedCollection new.
	
	traverser := DeepTraverser new 
		onNodeAction: [ :n | nodes add: n ];
		onEdgeAction: [ :f :t | edges add: (f -> t) ];
		onNodeTraverse: [ :n | graph at: n ifAbsent: [ nil ] ];
		on: graph startWith: 0;
		run.
	
	self assert: nodes = { 0 . 1 } asOrderedCollection.
	self assert: edges = { 0->1 } asOrderedCollection
]

{ #category : #tests }
DeepGraphWithNilTraverserTest >> testGraphStartingWithoutNil [
	| nodes edges traverser |

	nodes := OrderedCollection new.
	edges := OrderedCollection new.
	
	traverser := DeepTraverser new 
		onNodeAction: [ :n | nodes add: n ];
		onEdgeAction: [ :f :t | edges add: (f -> t) ];
		onNodeTraverse: [ :n | graph at: n ifAbsent: [ nil ] ];
		on: graph startWith: nil;
		run.
	
	self assert: nodes = { } asOrderedCollection.
	self assert: edges = { } asOrderedCollection
]
