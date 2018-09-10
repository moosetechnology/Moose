Class {
	#name : #DeepTraverserWithoutEdges,
	#superclass : #DeepTraverserWithoutAction,
	#instVars : [
		'onPickNextAction',
		'onNodeAction',
		'isActionAppliedOnCurrent'
	],
	#category : #DeepTraverser
}

{ #category : #deprecated }
DeepTraverserWithoutEdges >> action [
	self deprecated: 'please use #onNodeAction instead'.
	^ self onNodeAction
]

{ #category : #deprecated }
DeepTraverserWithoutEdges >> action: anAction [
	self deprecated: 'please use #onNodeAction: instead'.
	self onNodeAction: anAction
]

{ #category : #private }
DeepTraverserWithoutEdges >> doNodeAction [
	" the current action phase "
	
	" decide whether to apply action on the first/initial nodes (or not) "
	isActionAppliedOnCurrent ifFalse: [ ^ self ].
	
	" handle the action for the current node "
	onNodeAction dtAction: current using: self.
]

{ #category : #streaming }
DeepTraverserWithoutEdges >> doPickNextNode [
	onPickNextAction value
]

{ #category : #deprecated }
DeepTraverserWithoutEdges >> firstObjectAction: anAction [
	self deprecated: 'please use one of the #on:* methods'.
	
]

{ #category : #configuring }
DeepTraverserWithoutEdges >> on: anObject1 startWith: anObject2 [
	super on: anObject1 startWith: anObject2.

	onPickNextAction := [ 
		current := objectsToTraverse removeFirst ].
	isActionAppliedOnCurrent := true
]

{ #category : #configuring }
DeepTraverserWithoutEdges >> on: anObject startWithAll: aCollection [
	super on: anObject startWithAll: aCollection.
	
	onPickNextAction := [ 
		current := objectsToTraverse removeFirst ].
	isActionAppliedOnCurrent := true
]

{ #category : #configuring }
DeepTraverserWithoutEdges >> on: anObject1 startWithout: anObject2 [
	super on: anObject1 startWithout: anObject2.

	onPickNextAction := [ 
		current := objectsToTraverse removeFirst.
		isActionAppliedOnCurrent notNil
			ifTrue: [ isActionAppliedOnCurrent := true. onPickNextAction := [ current := objectsToTraverse removeFirst ] ]
			ifFalse: [ isActionAppliedOnCurrent := false ] ].
	isActionAppliedOnCurrent := nil
]

{ #category : #configuring }
DeepTraverserWithoutEdges >> on: anObect startWithoutAll: aCollection [
	super on: anObect startWithoutAll: aCollection.
	
	onPickNextAction := [ 
		current := objectsToTraverse removeFirst.
		startObject isEmpty
			ifTrue: [ isActionAppliedOnCurrent := true. onPickNextAction := [ current := objectsToTraverse removeFirst ] ]
			ifFalse: [ isActionAppliedOnCurrent := false. startObject removeFirst. ] ].
	isActionAppliedOnCurrent := nil
]

{ #category : #accessing }
DeepTraverserWithoutEdges >> onNodeAction [
	^ onNodeAction
]

{ #category : #accessing }
DeepTraverserWithoutEdges >> onNodeAction: anObject [
	onNodeAction := anObject
]

{ #category : #private }
DeepTraverserWithoutEdges >> traverse: anObject [
	" this node has already been traversed "
	(self isTraversed: anObject) ifTrue: [ ^ self ].
	
	" this node is already scheduled/postponed for traversal "
	(self isToTraverse: anObject) ifTrue: [ ^ self ].
	
	" add this new node for the next traversal. adding must be at the end of the collection otherwise onPickNextAction/isActionAppliedOnCurrent will be corrupt "
	objectsToTraverse add: anObject.
	
]
