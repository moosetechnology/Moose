"
Tests the Object extensions related to the traverser
"
Class {
	#name : #DeepObjectExtensionsTraverserTest,
	#superclass : #DeepTraverserGraphTest,
	#category : #'DeepTraverser-Tests-Transformed-To-Examples'
}

{ #category : #tests }
DeepObjectExtensionsTraverserTest >> testDeepCollectAs [
	| result |
	result := 1 
		deep: [ :each | self nextGraphElementsFrom: each ]
		collect: [ :each | each * 10 ]
		as: Set.
	self assert: result equals: #(20 30) asSet
]

{ #category : #tests }
DeepObjectExtensionsTraverserTest >> testDeepCollectAsSet [
	| result |
	result := 1 deepCollectAsSet: [ :each | self nextGraphElementsFrom: each ].
	self assert: result equals: #(2 3) asSet
]

{ #category : #tests }
DeepObjectExtensionsTraverserTest >> testDeepCollectSimple [
	| result |
	result := 1 deepCollect: [ :each | self nextGraphElementsFrom: each ].
	self assert: result equals: #(2 3) asOrderedCollection
]

{ #category : #tests }
DeepObjectExtensionsTraverserTest >> testDeepCollectWithBlock [
	| result |
	result := 1 
		deep: [ :each | self nextGraphElementsFrom: each ]
		collect: [ :each | each * 10 ].
	self assert: result equals: #(20 30) asOrderedCollection
]

{ #category : #tests }
DeepObjectExtensionsTraverserTest >> testDeepDo [
	| trace |
	trace := OrderedCollection new.
	1 
		deep: [ :each | self nextGraphElementsFrom: each ]
		do: [ :each | trace add: each ].
	self assert: trace equals: #(2 3) asOrderedCollection
]

{ #category : #tests }
DeepObjectExtensionsTraverserTest >> testDeepDoDifferencesInDeclaration [
	| trace expectedTrace |
	
	expectedTrace := #( 0 1 2 3 ) asOrderedCollection.
	trace := OrderedCollection new.
	0 
		withDeep: [ :each | self nextGraphElementsFrom: each ]
		do: [ :each | trace add: each ].
	self assert: trace equals: expectedTrace.
	
	expectedTrace := #( 1 2 3 ) asOrderedCollection.
	trace := OrderedCollection new.
	graph 
		deep: [ :each | self nextGraphElementsFrom: each ]
		do: [ :each | trace add: each ].
	self assert: trace equals: expectedTrace.
	
	expectedTrace := #( 0 1 2 3 ) asOrderedCollection.
	trace := OrderedCollection new.
	graph 
		withDeep: [ :each | self nextGraphElementsFrom: each ]
		do: [ :each | trace add: each ].
	self assert: trace equals: expectedTrace.
	
	expectedTrace := #( 0 1 2 3 ) asOrderedCollection.
	trace := OrderedCollection new.
	(DeepTraverserWithoutEdges new 
		onNodeTraverse: [ :each | self nextGraphElementsFrom: each ];
		onNodeAction: [ :each | trace add: each ];
		on: graph startWith: 0;
		yourself) run.
	self assert: trace equals: expectedTrace.
]

{ #category : #tests }
DeepObjectExtensionsTraverserTest >> testDeepDoRelationDo [
	| trace relationTrace |
	trace := OrderedCollection new.
	relationTrace := OrderedCollection new.
	1 
		deep: [ :each | self nextGraphElementsFrom: each ]
		do: [ :each | trace add: each ]
		relationDo: [ :from :to | relationTrace add: from->to ].
	self 
		assert: trace 
		equals: #(2 3) asOrderedCollection.
	self 
		assert: relationTrace 
		equals: {1->2 . 1->3 . 2->3} asOrderedCollection
]

{ #category : #tests }
DeepObjectExtensionsTraverserTest >> testDeepEdgesDo [
	| trace |
	trace := OrderedCollection new.
	1 
		deep: [ :each | self nextGraphElementsFrom: each ]
		edgesDo: [ :from :to | trace add: (from -> to) ].
	self assert: trace equals: { 1->2. 1->3. 2->3 } asOrderedCollection.
]

{ #category : #tests }
DeepObjectExtensionsTraverserTest >> testDeepFlatCollectWithBlock [
	| result |
	result := 1 
		deep: [ :each | self nextGraphElementsFrom: each ]
		flatCollect: [ :each | 1 to: each ].
	self assert: result equals: #(1 2 1 2 3) asOrderedCollection
]

{ #category : #tests }
DeepObjectExtensionsTraverserTest >> testWithDeepCollect [
	| result |
	result := 1 withDeepCollect: [ :each | self nextGraphElementsFrom: each ].
	self assert: result asSet equals: #(1 2 3) asSet
]

{ #category : #tests }
DeepObjectExtensionsTraverserTest >> testWithDeepDo [
	| trace |
	trace := OrderedCollection new.
	1 
		withDeep: [ :each | self nextGraphElementsFrom: each ] 
		do: [ :each | trace add: each ].
	self assert: trace equals: #(1 2 3) asOrderedCollection
]

{ #category : #tests }
DeepObjectExtensionsTraverserTest >> testWithDeepDoRelationDo [
	| trace relationTrace |
	trace := OrderedCollection new.
	relationTrace := OrderedCollection new.

	1 
		withDeep: [ :each | self nextGraphElementsFrom: each ] 
		do: [ :each | trace add: each ]
		relationDo: [ :from :to | relationTrace add: from->to ].
	self 
		assert: trace 
		equals: #(1 2 3) asOrderedCollection.
	self 
		assert: relationTrace 
		equals: {1->2 . 1->3 . 2->3} asOrderedCollection.

]

{ #category : #tests }
DeepObjectExtensionsTraverserTest >> testWithDeepEdgesDo [
	| trace |
	trace := OrderedCollection new.
	0 
		withDeep: [ :each | self nextGraphElementsFrom: each ] 
		edgesDo: [ :from :to | trace add: (from -> to) ].
	self assert: trace equals: { 0->1. 1->2. 1->3. 2->3 } asOrderedCollection.
]

{ #category : #tests }
DeepObjectExtensionsTraverserTest >> testWithDeepFlatCollectWithBlock [
	| result |
	result := 1 
		withDeep: [ :each | self nextGraphElementsFrom: each ]
		flatCollect: [ :each | each to: 4 ].
	self assert: result equals: #(1 2 3 4 2 3 4 3 4) asOrderedCollection
]
