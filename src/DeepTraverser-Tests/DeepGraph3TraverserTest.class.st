Class {
	#name : #DeepGraph3TraverserTest,
	#superclass : #DeepTraverserGraphTest,
	#category : #'DeepTraverser-Tests-Transformed-To-Examples'
}

{ #category : #running }
DeepGraph3TraverserTest >> setUp [
	super setUp.
	
	graph := Dictionary new.
	graph at: 0 put: #( 1 2 3 4 ).
	graph at: 1 put: #( 5 6 ).
	graph at: 2 put: #( 7 8 ).
	graph at: 3 put: #( 9 10 ).
	graph at: 4 put: #( 10 ).
	graph at: 5 put: #( 6 ).
	graph at: 6 put: #( 5 7 ).
	graph at: 7 put: #( 8 9 ).
	graph at: 8 put: #( 8 9 ).
	graph at: 9 put: #( 10 ).
	graph at: 10 put: #( 9 )
]

{ #category : #'as yet unclassified' }
DeepGraph3TraverserTest >> testGraph [
	| nodesWithAction |
	self assert: (DeepTraverserWithoutAction new 
		onNodeTraverse: [ :node | self nextGraphElementsFrom: node ];
		on: graph startWith: 0;
		yourself) upToEnd = #( 0 1 2 3 4 5 6 7 8 9 10 ) asOrderedCollection.
	
	self assert: (DeepTraverserWithoutAction new 
		onNodeTraverse: [ :node | self nextGraphElementsFrom: node ];
		on: graph startWithout: 0;
		yourself) upToEnd = #( 0 1 2 3 4 5 6 7 8 9 10 ) asOrderedCollection.
	
	nodesWithAction := OrderedCollection new.
	self assert: (DeepTraverserWithoutEdges new 
		onNodeTraverse: [ :node | self nextGraphElementsFrom: node ];
		onNodeAction: [ :node | nodesWithAction add: node ];
		on: graph startWithout: 0;
		yourself) upToEnd = #( 0 1 2 3 4 5 6 7 8 9 10 ) asOrderedCollection.
	self assert: nodesWithAction = #( 1 2 3 4 5 6 7 8 9 10 ) asOrderedCollection.
	
	nodesWithAction := OrderedCollection new.
	self assert: (DeepTraverserWithoutEdges new 
		onNodeTraverse: [ :node | self nextGraphElementsFrom: node ];
		onNodeAction: [ :node | nodesWithAction add: node ];
		on: graph startWithoutAll: #( 0 1 2 3 4 );
		yourself) upToEnd = #( 0 1 2 3 4 5 6 7 8 9 10 ) asOrderedCollection.
	self assert: nodesWithAction = #( 5 6 7 8 9 10 ) asOrderedCollection.
]
