"
A ROExploraNode is xxxxxxxxx.

Instance Variables
	builder:		<Object>
	directions:		<Object>
	expanded:		<Object>
	expandedNodes:		<Object>
	expansion:		<Object>
	id:		<Object>
	parentNode:		<Object>

builder
	- xxxxx

directions
	- xxxxx

expanded
	- xxxxx

expandedNodes
	- xxxxx

expansion
	- xxxxx

id
	- xxxxx

parentNode
	- xxxxx

"
Class {
	#name : #RTExploraNode,
	#superclass : #RTObject,
	#instVars : [
		'element',
		'builder',
		'id',
		'parentNode',
		'directions',
		'expanded',
		'expansion',
		'expandedNodes',
		'iconOpen',
		'iconClose'
	],
	#category : #'Roassal2-Builder-Explora'
}

{ #category : #adding }
RTExploraNode >> addExpansionDirection: aDirection [
	expanded at: aDirection key put: false.
	expandedNodes at: aDirection key put: (Set new).
	^ directions at: aDirection key put: aDirection value.
]

{ #category : #adding }
RTExploraNode >> addListenerFor: anEvent onDirection: aDirection withBlock: aBlock [
	| listener |
	
	listener := element.
	iconOpen ifNotNil: [ listener := (Array with: iconOpen with: iconClose) asGroup ].
		
	self addExpansionDirection: aDirection.
	self expandWithBlock: aBlock onDirection: aDirection.
	
	listener when: anEvent do: [ :event |
		RTPopup removeLastPopup.
		(self isExpandedOnDirection: aDirection)
			ifTrue: [ self collapseOnDirection: aDirection ]
			ifFalse: [ self exploreOnDirection: aDirection ].
			((builder layout rtValue: self)
				translator: (RTSmoothLayoutTranslator new nbCycles: 0.25))
				on: ((builder nodes collect: [ :n | n element ]) asGroup).	
		element view canvas signalUpdate].
	

]

{ #category : #adding }
RTExploraNode >> addToExpansion: aNode [
	(((expansion associations inject: #() into: [ :acc :next |
		acc, (next value collect: [ :x | next key -> x ]) ])
			select: [ :x | x value = (aNode element model) ])
				collect: [ :x| x key ])
					do: [ :x | (expandedNodes at: x) add: aNode.
							self checkExpansionOnDirection: x ]
]

{ #category : #accessing }
RTExploraNode >> builder: myBuilder [
	builder := myBuilder.
]

{ #category : #testing }
RTExploraNode >> checkExpansionOnDirection: aDirection [
	(((expandedNodes at: aDirection) collect: [ :x | x element model ])
		includesAll: (expansion at: aDirection))
		ifTrue: [ ^ self setExpandedOnDirection: aDirection ]
		ifFalse: [ ^ false ]
]

{ #category : #testing }
RTExploraNode >> checkExpansions [
	directions do: [ :dir | self checkExpansionOnDirection: dir key ]
]

{ #category : #removing }
RTExploraNode >> collapse [
	(self expandedNodes reject: [ :elem | elem id < (self id)]) do: [ :elem |
		elem collapse.
	].
	self remove.
]

{ #category : #action }
RTExploraNode >> collapseOnDirection: aDirection [
	(self isExpandedOnDirection: aDirection)
		ifTrue: [ ((self expandedNodesOnDirection: aDirection)
				reject: [ :x | x = parentNode | (x id < (self id))])
					do: [ :elem | elem collapse ].
			self setCollapsedOnDirection: aDirection ].
		self removeEdgesOnDirection: aDirection.
		(builder icons) ifNotNil: [
			iconClose remove.
			builder view add: iconOpen.
		].
		
]

{ #category : #adding }
RTExploraNode >> connectTo: aNode with: lineShape [
	| edge |
	self assert: (aNode isKindOf: RTExploraNode).
	(self isConnectedWith: aNode)
		ifFalse: [
			edge := RTEdge from: self element to: aNode element.
			builder view add: edge + lineShape.
			edge trachelShape pushBack.
			self addToExpansion: aNode.
			aNode addToExpansion: self.
		]
]

{ #category : #accessing }
RTExploraNode >> element [
	^ element
]

{ #category : #accessing }
RTExploraNode >> element: anElement [
	element := anElement.
	element attributes at: #node put: self.
]

{ #category : #adding }
RTExploraNode >> expandWithBlock: aBlock onDirection: aDirection [
	^ expansion at: aDirection key put: (aBlock value: self element model)
]

{ #category : #accessing }
RTExploraNode >> expandedNodes [
	^ expandedNodes inject: #() into: [ :acc :next | (acc, (next value asArray)) ]
]

{ #category : #accessing }
RTExploraNode >> expandedNodesOnDirection: direction [
	^ expandedNodes at: direction key
]

{ #category : #accessing }
RTExploraNode >> expansion [
	^ expansion inject: #() into: [ :acc :next | (acc, next value) ]
]

{ #category : #accessing }
RTExploraNode >> expansionDirections [
	^ directions associations
]

{ #category : #accessing }
RTExploraNode >> expansionOnDirection: direction [
	^ expansion at: direction key
]

{ #category : #accessing }
RTExploraNode >> explorationStatus: aDirection [
	(self isExpandableOnDirection: aDirection) ifFalse: [ ^ 'not expandable' ].
	(self isExpandedOnDirection: aDirection)
		ifTrue: [ ^ 'expanded' ]
		ifFalse: [ ^ 'not expanded' ].
]

{ #category : #action }
RTExploraNode >> exploreOnDirection: aDirection [
	| objs objectsToAdd newNodes nodesAlreadyIn objsAlreadyIn |
	objs := ((builder nodes collect: [ :n | n element ]) asGroup) collect: [ :el | el model ].
	objectsToAdd := self expansionOnDirection: aDirection.
	objsAlreadyIn := objectsToAdd select: [ :obj | objs includes: obj ].
	objectsToAdd := objectsToAdd reject: [ :obj | objs includes: obj ].
	
	nodesAlreadyIn := (builder view elements select: [ :el | objsAlreadyIn includes: el model ])
		collect: [ :elem | elem attributes at: #node ].
	newNodes := objectsToAdd collect: [ :obj | builder node: obj parent: self ].
	
	builder lastAddedNodes: newNodes.
	
	newNodes do: [ :node |
		builder view add: node element.
		node element translateTo: self element position ].
	(builder icons) ifNotNil: [
		(newNodes select: [ :n | n isExpandable]) do: [ :node |
			builder view add: node iconOpen].
		iconOpen remove.
		builder view add: iconClose.
		].
	
	(newNodes, nodesAlreadyIn) do: [ :el |
		(aDirection value = #From)
			ifTrue: [ self connectTo: el with: builder lineShape ]
			ifFalse: [ el connectTo: self with: builder lineShape ] ].
]

{ #category : #accessing }
RTExploraNode >> iconClose [
	^ iconClose
]

{ #category : #accessing }
RTExploraNode >> iconClose: anElementIcon [
	iconClose := anElementIcon
]

{ #category : #accessing }
RTExploraNode >> iconOpen [
	^ iconOpen
]

{ #category : #accessing }
RTExploraNode >> iconOpen: anElementIcon [
	iconOpen := anElementIcon
]

{ #category : #accessing }
RTExploraNode >> id [
	^ id
]

{ #category : #accessing }
RTExploraNode >> id: aNumber [
	id := aNumber
]

{ #category : #initialization }
RTExploraNode >> initialize [
	super initialize.
	directions := Dictionary new.
	expansion := Dictionary new.
	expanded := Dictionary new.
	expandedNodes := Dictionary new.
]

{ #category : #testing }
RTExploraNode >> isConnectedWith: aNode [
	^ ((element incomingEdges collect: [ :e | e from attributes at: #node ]) includes: aNode) |
		((element outgoingEdges collect: [ :e | e to attributes at: #node ]) includes: aNode)
]

{ #category : #testing }
RTExploraNode >> isExpandable [
	^ (self expansion reject: [ :elem | | test |
			test := (parentNode = nil) ifTrue: [nil] ifFalse: [parentNode element model].
			elem = test ]) isNotEmpty
]

{ #category : #testing }
RTExploraNode >> isExpandableOnDirection: aDirection [
	^ (self expansionOnDirection: aDirection) isNotEmpty
]

{ #category : #testing }
RTExploraNode >> isExpanded [
	" Tests if the node is expanded in all its possible directions "
	^ (expanded isEmpty) ifTrue: [ false ] ifFalse: [ expanded reduce: [ :x :y | x & y ] ]
]

{ #category : #testing }
RTExploraNode >> isExpandedOnDirection: direction [
	^ expanded at: (direction key)
]

{ #category : #accessing }
RTExploraNode >> parentNode: aNode [
	parentNode := aNode.
]

{ #category : #removing }
RTExploraNode >> remove [
	element incomingEdges do: [ :edge |
		(edge from attributes at: #node) removeExpandedNode: self. edge remove ].
	element outgoingEdges do: [ :edge |
		(edge to attributes at: #node) removeExpandedNode: self. edge remove ].
	element remove.
	(iconOpen isNotNil & self isExpandable) ifTrue: [ (self isExpanded) ifTrue: [iconClose remove] ifFalse: [iconOpen remove]].
	builder nodes remove: self.
]

{ #category : #removing }
RTExploraNode >> removeEdgesOnDirection: aDirection [
	| elem |
	(aDirection value = #From)
		ifTrue: [ element outgoingEdges do: [ :edge |
				elem := edge to.
				elem = (parentNode element) ifFalse: [ edge remove] ]
		]
		ifFalse: [ element incomingEdges do: [ :edge |
				elem := edge from.
				elem = (parentNode element) ifFalse: [ edge remove] ]
		].
]

{ #category : #removing }
RTExploraNode >> removeExpandedNode: aNode [
	self assert: (aNode isKindOf: RTExploraNode).
	directions keys do: [ :direction | 
		(expandedNodes at: direction) remove: aNode ifAbsent: [] ]
]

{ #category : #testing }
RTExploraNode >> setCollapsedOnDirection: aDirection [
	^ expanded at: aDirection key put: false
]

{ #category : #testing }
RTExploraNode >> setExpandedOnDirection: aDirection [
	^ expanded at: aDirection put: true
]

{ #category : #testing }
RTExploraNode >> setExpandedOnDirection: aDirection with: nodes [
	self setExpandedOnDirection: aDirection.
	^ expandedNodes at: aDirection key put: nodes
]
