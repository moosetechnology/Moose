"
This is a test class for testing the behavior of DeepTraverser
"
Class {
	#name : #DeepCustomTraverserTest,
	#superclass : #DeepTraverserGraphTest,
	#instVars : [
		'traverser'
	],
	#category : #'DeepTraverser-Tests-Tests'
}

{ #category : #running }
DeepCustomTraverserTest >> setUp [
	super setUp.
	
	traverser := DeepTraverser new 
		onNodeTraverse: [ :each | graph at: each ifAbsent: [{ }] ];
		yourself
]

{ #category : #tests }
DeepCustomTraverserTest >> testCollectionsAreExpanded [
	traverser 
		on: graph startWith: 10; 
		run.
	self 
		assert: traverser objectsTraversed 
		equals: {10 . 11} asSet
]

{ #category : #tests }
DeepCustomTraverserTest >> testCycles [
	traverser 
		on: graph startWith: 1; 
		run.
	self 
		assert: traverser objectsTraversed 
		equals: { 1 . 2 . 3} asSet
]

{ #category : #tests }
DeepCustomTraverserTest >> testFirstObjectAction [
	| objects |
	objects := OrderedCollection new.
	traverser 
		onNodeAction: [ :each | objects add: each ];
		on: graph startWith: 0; 
		run.
	self assert: objects size equals: 4.
	self assert: objects equals: { 0. 1 . 2 . 3 } asOrderedCollection
]

{ #category : #tests }
DeepCustomTraverserTest >> testNoCycle [
	traverser 
		on: graph startWith: 4; 
		run.
	self 
		assert: traverser objectsTraversed 
		equals: {4 . 3} asSet
]

{ #category : #tests }
DeepCustomTraverserTest >> testObjectAction [
	| objects |
	objects := OrderedCollection new.
	traverser 
		onNodeAction: [ :each | objects add: each ];
		on: graph startWithout: 0; 
		run.
	self assert: objects size equals: 3.
	self assert: objects equals: { 1 . 2 . 3 } asOrderedCollection
]

{ #category : #tests }
DeepCustomTraverserTest >> testOriginIsPresentInResult [
	traverser 
		on: graph startWith: 0; 
		run.
	self 
		assert: traverser objectsTraversed 
		equals: {0 . 1 . 2 . 3} asSet
]

{ #category : #tests }
DeepCustomTraverserTest >> testRelationAction [
	| relations |
	relations := OrderedCollection new.
	traverser 
		onEdgeAction: [ :from :to | relations add: from->to ];
		on: graph startWith: 0; 
		run.
	self assert: relations size equals: 4.
	self assert: relations equals: { 0->1 . 1->2 . 1->3 . 2->3 } asOrderedCollection.
	
	
]
