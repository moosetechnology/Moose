Class {
	#name : #DeepTraverserWithoutAction,
	#superclass : #Object,
	#instVars : [
		'object',
		'onNodeTraverse',
		'objectsToTraverse',
		'objectsTraversed',
		'initializer',
		'current',
		'previous',
		'startObject',
		'expectedSize'
	],
	#category : #DeepTraverser
}

{ #category : #'*DeepTraverser-UI' }
DeepTraverserWithoutAction class >> gtExampleDeepTraverserWithoutAction [
	<gtExample>
	<label: 'DeepTraverserWithoutAction'>
	
	| graph traverser |

	graph := Dictionary new.
	graph at: 0 put: { 1 }.
	graph at: 1 put: { 2 . 3 }.
	graph at: 2 put: { 3 }.
	graph at: 4 put: { 3 }.
	graph at: 10 put: { 11 }.

	traverser := (DeepTraverserWithoutAction new 
				onNodeTraverse: [ :each | graph at: each ifAbsent: [ #() ] ];
				on: graph startWith: (graph at: 0);
				yourself).
				
	traverser upToEnd	.
	^ traverser.
				
		
]

{ #category : #testing }
DeepTraverserWithoutAction >> atEnd [
	^ self hasNext not
]

{ #category : #enumerating }
DeepTraverserWithoutAction >> collect: aBlock [
	^ self collect: aBlock as: OrderedCollection 
]

{ #category : #enumerating }
DeepTraverserWithoutAction >> collect: aBlock as: aCollectionClass [
	| newCollection |
	newCollection := aCollectionClass new.
	self do: [ :each |
		newCollection add: (aBlock value: each) ].
	^ newCollection
]

{ #category : #streaming }
DeepTraverserWithoutAction >> current [
	^ current
]

{ #category : #enumerating }
DeepTraverserWithoutAction >> do: aBlock [
	self reset.
	[ self hasNext ] 
		whileTrue: [ aBlock value: self next ]
]

{ #category : #private }
DeepTraverserWithoutAction >> doNodeAction [
]

{ #category : #private }
DeepTraverserWithoutAction >> doNodeTraverse [
	" the current traversal phase "
	
	" always traverse a scheduled node "
	onNodeTraverse dtTraverse: current using: self.	

]

{ #category : #streaming }
DeepTraverserWithoutAction >> doPickCurrentNode [
	current := objectsToTraverse removeFirst
]

{ #category : #private }
DeepTraverserWithoutAction >> doPickNextNode [
	current := objectsToTraverse removeFirst
]

{ #category : #accessing }
DeepTraverserWithoutAction >> expectedSize [
	^ expectedSize ifNil: [ expectedSize := 100 ]
]

{ #category : #accessing }
DeepTraverserWithoutAction >> expectedSize: anNumber [
	expectedSize := expectedSize
]

{ #category : #'*DeepTraverser-UI' }
DeepTraverserWithoutAction >> gtInspectorObjectsTraversedIn: composite [
	<gtInspectorPresentationOrder: 40>
	composite list
		title: 'Traversed';
		display: [ self objectsTraversed ];
		format: [ :each | each gtDisplayString ]
]

{ #category : #testing }
DeepTraverserWithoutAction >> hasNext [
	^ objectsToTraverse isEmptyOrNil not
]

{ #category : #private }
DeepTraverserWithoutAction >> isToTraverse: anObject [
	" return true if anObject has not been scheduled/postponed for later traversal and action "
	objectsToTraverse reverseDo: [ :each | 
		each == anObject ifTrue: [ 
			^ true ] ].
	^ false
]

{ #category : #private }
DeepTraverserWithoutAction >> isTraversed: anObject [
	" return true if anObject has already been traversed and action was performed "
	^ objectsTraversed includes: anObject
]

{ #category : #streaming }
DeepTraverserWithoutAction >> next [
	previous := current.
	self doPickNextNode.
	objectsTraversed add: current.
	self doNodeTraverse.
	self doNodeAction.
	^ current
]

{ #category : #streaming }
DeepTraverserWithoutAction >> next: anInteger [
	| index newArray |
	index := 0.
	newArray := Array new: anInteger.
	[ index < anInteger and: [ self hasNext ] ] whileTrue: [ 
		newArray at: (index := index + 1) put: self next ].
	^ newArray copyFrom: 1 to: index	
]

{ #category : #accessing }
DeepTraverserWithoutAction >> objectsTraversed [
	^ objectsTraversed
]

{ #category : #configuring }
DeepTraverserWithoutAction >> on: anObject [
	" traverse anObject. start traversal using anObject and apply the action on all objects "
	self on: self startWith: anObject
]

{ #category : #configuring }
DeepTraverserWithoutAction >> on: anObject1 startWith: anObject2 [
	" traverse anObject1. start traversal using anObject2 and apply the action on all objects "
	initializer := [ self on: anObject1 startWith: anObject2 ].
	
	" reset everything "
	object := anObject1.
	startObject := anObject2.
	current := nil.
	previous := nil.
	objectsToTraverse := OrderedCollection new. " traversal  phase 2 check / slow check [reversed for better speed ], quick add "
	objectsTraversed := IdentitySet new: self expectedSize. " traversal phase 1 check / quick check, slow add"
	startObject dtTraverseStartUsing: self.
]

{ #category : #configuring }
DeepTraverserWithoutAction >> on: anObect startWithAll: aCollection [
	" traverse anObject. start traversal using aCollection but do not apply action on items of aCollection "
	initializer := [ self on: anObect startWithAll: aCollection ].
	
	" reset everything "
	object := anObect.
	startObject := aCollection asOrderedCollection.
	current := nil.
	previous := nil.
	objectsToTraverse := OrderedCollection new: aCollection size. " traversal  phase 2 check / slow check [reversed for better speed ], quick add "
	objectsTraversed := IdentitySet new: self expectedSize. " traversal phase 1 check / quick check, slow add"
	startObject dtTraverseStartUsing: self.
]

{ #category : #configuring }
DeepTraverserWithoutAction >> on: anObject1 startWithout: anObject2 [
	" traverse anObject1. start traversal using anObject2 but do not apply action on anObject2 "
	initializer := [ self on: anObject1 startWithout: anObject2 ].
	
	" reset everything "
	object := anObject1.
	startObject := anObject2.
	current := nil.
	previous := nil.
	objectsToTraverse := OrderedCollection new. " traversal  phase 2 check / slow check [reversed for better speed ], quick add "
	objectsTraversed := IdentitySet new: self expectedSize. " traversal phase 1 check / quick check, slow add"
	startObject dtTraverseStartUsing: self.
]

{ #category : #configuring }
DeepTraverserWithoutAction >> on: anObect startWithoutAll: aCollection [
	" traverse anObject. start traversal using aCollection but do not apply action on items of aCollection "
	initializer := [ self on: anObect startWithoutAll: aCollection ].
	
	" reset everything "
	object := anObect.
	startObject := aCollection asOrderedCollection.
	current := nil.
	previous := nil.
	objectsToTraverse := OrderedCollection new: aCollection size. " traversal  phase 2 check / slow check [reversed for better speed ], quick add "
	objectsTraversed := IdentitySet new: self expectedSize. " traversal phase 1 check / quick check, slow add"
	startObject dtTraverseStartUsing: self.
]

{ #category : #accessing }
DeepTraverserWithoutAction >> onNodeTraverse [
	^ onNodeTraverse
]

{ #category : #accessing }
DeepTraverserWithoutAction >> onNodeTraverse: anObject [
	onNodeTraverse := anObject
]

{ #category : #streaming }
DeepTraverserWithoutAction >> position [
	^ objectsTraversed size
]

{ #category : #streaming }
DeepTraverserWithoutAction >> previous [
	^ previous
]

{ #category : #enumerating }
DeepTraverserWithoutAction >> reject: aBlock [
	^ self reject: aBlock as: OrderedCollection 
]

{ #category : #enumerating }
DeepTraverserWithoutAction >> reject: aBlock as: aCollectionClass [
	^ self select: [ :each | (aBlock value: each) not ] as: aCollectionClass
]

{ #category : #streaming }
DeepTraverserWithoutAction >> reset [
	initializer value
]

{ #category : #private }
DeepTraverserWithoutAction >> run [
	self reset.
	[ self hasNext ] 
		whileTrue: [ self next ]
]

{ #category : #enumerating }
DeepTraverserWithoutAction >> select: aBlock [
	^ self select: aBlock as: OrderedCollection 
]

{ #category : #enumerating }
DeepTraverserWithoutAction >> select: aBlock as: aCollectionClass [
	| newCollection |
	newCollection := aCollectionClass new.
	self do: [ :each |
		(aBlock value: each) ifTrue: [ 
			newCollection add: each ] ].
	^ newCollection
]

{ #category : #private }
DeepTraverserWithoutAction >> traverse: anObject [
	" this node has already been traversed "
	(self isTraversed: anObject) ifTrue: [ ^ self ].
	
	" this node is already scheduled/postponed for traversal "
	(self isToTraverse: anObject) ifTrue: [ ^ self ].

	" add this new node for the next traversal "
	objectsToTraverse add: anObject.
]

{ #category : #private }
DeepTraverserWithoutAction >> traverseStart: anObject [
	objectsToTraverse add: anObject
]

{ #category : #deprecated }
DeepTraverserWithoutAction >> traversedObjects [
	self deprecated: 'please use #objectsTraversed instead'.
	^ self objectsTraversed
]

{ #category : #deprecated }
DeepTraverserWithoutAction >> traverser [
	self deprecated: 'please use #onNodeTraverse instead'.
	^ self onNodeTraverse
]

{ #category : #deprecated }
DeepTraverserWithoutAction >> traverser: aBlock [
	self deprecated: 'please use #onNodeTraverse: instead'.
	self onNodeTraverse: aBlock
]

{ #category : #streaming }
DeepTraverserWithoutAction >> upTo: anObject [
	| newArray |
	newArray := OrderedCollection new.
	[ self hasNext and: [ (self next = anObject) not ] ] whileTrue: [ 
		newArray add: current ].
	^ newArray
]

{ #category : #streaming }
DeepTraverserWithoutAction >> upToAny: aCollection [
	^ self upToAnyMatching: [ :each | aCollection includes: each ]
]

{ #category : #streaming }
DeepTraverserWithoutAction >> upToAnyMatching: aBlock [
	| newArray |
	newArray := OrderedCollection new.
	[ self hasNext and: [ (aBlock value: self next) not ] ] whileTrue: [ 
		newArray add: current ].
	^ newArray
]

{ #category : #streaming }
DeepTraverserWithoutAction >> upToEnd [
	| newArray |
	newArray := OrderedCollection new.
	[ self hasNext ] whileTrue: [ 
		newArray add: self next ].
	^ newArray
]
