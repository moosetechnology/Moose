"
A ROAbstractGraphLayout is xxxxxxxxx.

Instance Variables
	cachedChildren:		<Object>
	cachedParents:		<Object>
	cachedParentsWithHighestNestings:		<Object>
	horizontalGap:		<Object>
	verticalGap:		<Object>

cachedChildren
	- xxxxx

cachedParents
	- xxxxx

cachedParentsWithHighestNestings
	- xxxxx

horizontalGap
	- xxxxx

verticalGap
	- xxxxx

"
Class {
	#name : #RTAbstractGraphLayout,
	#superclass : #RTEdgeDrivenLayout,
	#instVars : [
		'verticalGap',
		'horizontalGap',
		'cachedChildren',
		'cachedParents',
		'cachedParentsWithHighestNestings'
	],
	#category : #'Roassal2-Layouts'
}

{ #category : #constants }
RTAbstractGraphLayout class >> horizontalGap [
	
	^3.0
]

{ #category : #testing }
RTAbstractGraphLayout class >> isAbstract [
	^ self name = #RTAbstractGraphLayout
]

{ #category : #public }
RTAbstractGraphLayout class >> on: elements edges: edges [
	"Do the layout of the elements tacking into account the provided edges"

	^ self new 
		userDefinedEdges: edges;
		applyOn: elements.
]

{ #category : #constants }
RTAbstractGraphLayout class >> verticalGap [
	
	^20.0
]

{ #category : #private }
RTAbstractGraphLayout >> cachedChildren [
	
	cachedChildren ifNil: [cachedChildren := IdentityDictionary new: 1000].
	^cachedChildren
]

{ #category : #private }
RTAbstractGraphLayout >> cachedParents [
	
	cachedParents ifNil: [cachedParents := IdentityDictionary new: 1000].
	^cachedParents
]

{ #category : #private }
RTAbstractGraphLayout >> cachedParentsWithHighestNestings [
	
	cachedParentsWithHighestNestings
		ifNil: [cachedParentsWithHighestNestings := IdentityDictionary new: 1000].
	^cachedParentsWithHighestNestings
]

{ #category : #private }
RTAbstractGraphLayout >> childrenFor: aNode [
	
	^self cachedChildren
		at: aNode
		ifAbsentPut:
			[| nodes |
			nodes := OrderedCollection new.
			self edgesDo:
					[:edge | 
					(edge from == aNode and: [edge to ~= aNode])
						ifTrue:
							[(nodes includes: edge from) ifFalse: [nodes add: edge to]]].
			nodes]
]

{ #category : #private }
RTAbstractGraphLayout >> childrenFor: aNode except: aNodeCollection [
	
	^(self childrenFor: aNode) 
		reject: [:each | aNodeCollection includes: each]
	
	"we are explicitly not using the default Collection>>difference: behavior here because we want to preserve the order of the collection"
]

{ #category : #private }
RTAbstractGraphLayout >> childrenWithHighestNestingLevelFor: aNode [
	
	^(self childrenFor: aNode)
		select: [:eachChild | (self highestNestingParentFor: eachChild) == aNode]
]

{ #category : #private }
RTAbstractGraphLayout >> clear [
	
	cachedParents := nil.
	cachedChildren := nil.
	cachedParentsWithHighestNestings := nil
]

{ #category : #hook }
RTAbstractGraphLayout >> doInitialize: elements [ 
	super doInitialize: elements.
	self clear.
	self greedyCycleRemoval: elements
]

{ #category : #battista }
RTAbstractGraphLayout >> greedyCycleRemoval: aCollection [
	"Di Battista Greedy-Cycle-Removal algorithm. Chapter 9.4, page 297. The last part is not like in the book. The original algorithm only takes
	 local optimas into account. This will break ordinary trees sometimes. This version also takes global optimas into account."
	
	| g sl sr s indeg outdeg degrees vertex | 
	g := aCollection copy asOrderedCollection.
	sl := OrderedCollection new.
	sr := OrderedCollection new.	"While g contains a sink (aka leaf)"
	g copy
		do:
			[:node | 
			(self childrenFor: node) isEmpty
				ifTrue:
					[sr addFirst: node.
					g remove: node]	"self edges detect: [:edge | edge fromFigure == node] ifNone: [sr addFirst: node. g remove: node]"].	"While g contains a source (aka root)"
	g copy
		do:
			[:node | 
			(self parentsFor: node) isEmpty
				ifTrue:
					[sl addLast: node.
					g remove: node]	"self edges detect: [:edge | edge toFigure == node] ifNone: [sl addLast: node. g remove: node]"].	"Calculate deg for all remaining vertices"
	degrees := IdentityDictionary new.
	g
		do:
			[:node | 
			indeg := (self parentsFor: node) size.
			outdeg := (self childrenFor: node) size.	"indeg := self edges inject: 0 into: [:sum :edge | (edge toFigure == node) ifTrue: [sum + 1] ifFalse: [sum]].
		outdeg := self edges inject: 0 into: [:sum :edge | (edge fromFigure == node) ifTrue: [sum + 1] ifFalse: [sum]]."
			degrees
				at: node
				put: outdeg - indeg].	"While g not empty"
	g := g asSortedCollection: [:a :b | (degrees at: a) >= (degrees at: b)].
	[g isEmpty]
		whileFalse:
			[vertex := g
				detect: [:v | (self parentsFor: v) anySatisfy: [:w | sl includes: w]]
				ifNone: [g first].	"Corner case: Closed cycle with not root at all. Eg 1 -> 2 -> 3 -> 1"
			sl addLast: vertex.
			g remove: vertex].	"Remove all leftward edges"
	s := sl , sr.
	self edges notNil
		ifTrue: 
			[ self edges copy
				do:
					[:edge | 
					(s indexOf: edge from) > (s indexOf: edge to)
						ifTrue: [self edges remove: edge ] ] ].	
	"Reset the cache"
	self clear
]

{ #category : #private }
RTAbstractGraphLayout >> highestNestingParentFor: aNodeFigure [
	
	| parents |
	^self cachedParentsWithHighestNestings
		at: aNodeFigure
		ifAbsentPut:
			[parents := self parentsFor: aNodeFigure.
			parents isEmpty
				ifTrue: [0]
				ifFalse:
					[parents detectMax: [:eachParent | self nestingLevelFor: eachParent]]]
]

{ #category : #accessing }
RTAbstractGraphLayout >> horizontalGap [
	"Return the horizontal space, in pixel, between two neighbors"

	^ horizontalGap ifNil: [ self class horizontalGap ]
]

{ #category : #accessing }
RTAbstractGraphLayout >> horizontalGap: anInteger [
	"Set the horizontal space, in pixel, between two neighbors"

	horizontalGap := anInteger
]

{ #category : #private }
RTAbstractGraphLayout >> maximumDiameter: aCollection [
	
	^aCollection
		inject: 0
		into: [:max :node | max max: (node radius * 2) ]
 
]

{ #category : #private }
RTAbstractGraphLayout >> maximumRadius: aCollection [
	
	^aCollection
		inject: 0
		into: [:max :node | max max: node radius]
]

{ #category : #private }
RTAbstractGraphLayout >> nestingLevelFor: aNodeFigure [
	
	| parents parentsNesting |
	parents := self parentsFor: aNodeFigure.
	parentsNesting := parents
		collect: [:eachParent | self nestingLevelFor: eachParent].
	^parentsNesting isEmpty
		ifTrue: [0]
		ifFalse: [parentsNesting max + 1]

]

{ #category : #actions }
RTAbstractGraphLayout >> on: el edges: edgs [
	"Do the layout of the elements tacking into account the provided edges"

	self userDefinedEdges ifNil: [ self userDefinedEdges: edgs ].

	^ self applyOn: el.
]

{ #category : #private }
RTAbstractGraphLayout >> parentsFor: aNode [
	^ self cachedParents
		at: aNode
		ifAbsentPut:
			[ | nodes |
			nodes := OrderedCollection new.
			self edgesDo:
					[:edge | edge to == aNode ifTrue: [ nodes add: edge from ] ].
			nodes ]
]

{ #category : #private }
RTAbstractGraphLayout >> rootNodesFor: aCollection [
	^ aCollection select: [:node | 
		(self parentsFor: node) isEmpty ].
	
]

{ #category : #private }
RTAbstractGraphLayout >> shiftTree: aNode by: aPoint [
	
	aNode translateBy: aPoint.
	(self childrenFor: aNode) do: [:child | self shiftTree: child by: aPoint]
]

{ #category : #accessing }
RTAbstractGraphLayout >> verticalGap [
	"Return the vertical space, in pixel, between a layer and a children layer"

	^ verticalGap ifNil: [ self class verticalGap ]
]

{ #category : #accessing }
RTAbstractGraphLayout >> verticalGap: anInteger [
	"Set the vertical space, in pixel, between a layer and a children layer"

	verticalGap := anInteger
]
