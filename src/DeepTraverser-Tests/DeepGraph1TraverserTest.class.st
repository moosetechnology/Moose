Class {
	#name : #DeepGraph1TraverserTest,
	#superclass : #DeepTraverserGraphTest,
	#category : #'DeepTraverser-Tests-Transformed-To-Examples'
}

{ #category : #running }
DeepGraph1TraverserTest >> setUp [
	super setUp.
	
	graph := Dictionary new.
	graph at: 0 put: { 4. 1 }.
	graph at: 1 put: { 4. 2 }.
	graph at: 2 put: { 4. 3 }.
	graph at: 3 put: { 4. }.
	graph at: 4 put: { 4. 5 }.

]

{ #category : #tests }
DeepGraph1TraverserTest >> testGraph [
	| nodes edges traverser |

	nodes := OrderedCollection new.
	edges := OrderedCollection new.
	
	traverser := DeepTraverser new 
		onNodeAction: [ :n | nodes add: n ];
		onEdgeAction: [ :f :t | edges add: (f -> t) ];
		onNodeTraverse: [ :n | graph at: n ifAbsent: [ nil ] ];
		on: graph startWith: 0;
		run.
	
	self assert: nodes = { 0. 4. 1. 5. 2. 3 } asOrderedCollection.
	self assert: edges = { 0->4. 4->4. 0->1. 1->4. 4->5. 1->2. 2->4. 2->3. 3->4. } asOrderedCollection
]
