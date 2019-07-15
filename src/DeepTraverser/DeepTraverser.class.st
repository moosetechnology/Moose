Class {
	#name : #DeepTraverser,
	#superclass : #DeepTraverserWithoutEdges,
	#instVars : [
		'onEdgeAction',
		'edgesToAction'
	],
	#category : #DeepTraverser
}

{ #category : #private }
DeepTraverser >> doNodeAction [
	" the current action phase "
	
	" decide whether to apply action on the first/initial nodes (or not) "
	isActionAppliedOnCurrent ifFalse: [ ^ self ].
	
	" handle the action for the current node "
	onNodeAction dtAction: current using: self.
	
	" handle the actions of postponed edge actions related to the current node "
	(edgesToAction removeKey: current ifAbsent: [ #() ]) do: [ :assoc |
		onEdgeAction dtActionfrom: assoc key to: assoc value using: self ]
	
]

{ #category : #configuring }
DeepTraverser >> on: anObject1 startWith: anObject2 [
	super on: anObject1 startWith: anObject2.

	edgesToAction := IdentityDictionary new: self expectedSize. " track edges until they are allowed to be consumed "
]

{ #category : #configuring }
DeepTraverser >> on: anObject startWithAll: aCollection [
	super on: anObject startWithAll: aCollection.

	edgesToAction := IdentityDictionary new: self expectedSize. " track edges until they are allowed to be consumed "
]

{ #category : #configuring }
DeepTraverser >> on: anObject1 startWithout: anObject2 [
	super on: anObject1 startWithout: anObject2.

	edgesToAction := IdentityDictionary new: self expectedSize. " track edges until they are allowed to be consumed "

]

{ #category : #configuring }
DeepTraverser >> on: anObect startWithoutAll: aCollection [
	super on: anObect startWithoutAll: aCollection.

	edgesToAction := IdentityDictionary new: self expectedSize. " track edges until they are allowed to be consumed "

]

{ #category : #accessing }
DeepTraverser >> onEdgeAction [
	^ onEdgeAction
]

{ #category : #accessing }
DeepTraverser >> onEdgeAction: anObject [
	onEdgeAction := anObject
]

{ #category : #private }
DeepTraverser >> traverse: anObject [
	" this node has already been traversed, but the edge still needs to be handled in the following action-phase "
	(self isTraversed: anObject) ifTrue: [ 
		(edgesToAction at: current ifAbsentPut: [ OrderedCollection new ]) add: (current -> anObject).
		^ self ].
	
	" this node is already scheduled/postponed for traversal, we store the edge for later (traversal-phase + action-phase are still coming) "
	(self isToTraverse: anObject) ifTrue: [ 
		(edgesToAction at: anObject ifAbsentPut: [ OrderedCollection new ]) add: (current -> anObject).
		^ self ].
	
	" add this new node for the next traversal. adding must be at the end of the collection otherwise onPickNextAction/isActionAppliedOnCurrent will be corrupt "
	objectsToTraverse add: anObject.
	
	" schedule/postpone this new node for the following action-phase "
	(edgesToAction at: anObject ifAbsentPut: [ OrderedCollection new ]) add: (current -> anObject).
		
]
