"
A ROAbstractCompactTree is xxxxxxxxx.

Instance Variables
	initialLayout:		<Object>
	margin:		<Object>
	root:		<Object>
	sonsDictionary:		<Object>

initialLayout
	- xxxxx

margin
	- xxxxx

root
	- xxxxx

sonsDictionary
	- xxxxx

"
Class {
	#name : #RTAbstractCompactTree,
	#superclass : #RTAbstractGraphLayout,
	#instVars : [
		'sonsDictionary',
		'root',
		'initialLayout',
		'margin'
	],
	#category : #'Roassal2-Layouts'
}

{ #category : #testing }
RTAbstractCompactTree class >> horizontalGap: anInt [

	| new |
	
	new := self new.
	new horizontalGap: anInt.
	
	^ new 
]

{ #category : #testing }
RTAbstractCompactTree class >> horizontalGap: anInt verticalGap: another [

	| new |
	
	new := self new.
	new horizontalGap: anInt.
	new verticalGap: another.
	
	
	^ new 
]

{ #category : #testing }
RTAbstractCompactTree class >> isAbstract [
	^ self name = #RTAbstractCompactTree


]

{ #category : #testing }
RTAbstractCompactTree class >> verticalGap: anInt [

	| new |
	
	new := self new.
	new verticalGap: anInt.
	
	^ new 
]

{ #category : #private }
RTAbstractCompactTree >> childrenFor: aNode [ 

	sonsDictionary isEmpty ifTrue: [ ^ super childrenFor: aNode ] 
							ifFalse: [ ^sonsDictionary at: aNode ifAbsent: [ ^ OrderedCollection new ] ]
]

{ #category : #algorithm }
RTAbstractCompactTree >> compareContourOf: aNode with: another [
	"return the number of radians the subtree induced by aNode must be displaced to be separated by a predefined distance (horizontalGap) from the one induced by anotherNode"

	| difference max nodeA nodeB |
	nodeB := aNode.	"the right one"
	nodeA := another.	"the left one"
	max := aNode = another
		ifTrue: [ 0 ]
		ifFalse: [ horizontalGap / 2 - (nodeB x - (self getAbcissaOf: nodeA inSubtreeFromLayer: aNode layer - 1)) ].
	nodeB := self followLeftContour: nodeB toLayer: nodeB layer + 1.
	nodeA := self followRightContour: nodeA toLayer: nodeA layer + 1.
	[ nodeB isNil not & nodeA isNil not ]
		whileTrue: [ 
			difference := horizontalGap
				-
					((self getAbcissaOf: nodeB inSubtreeFromLayer: aNode layer - 1)
						- (self getAbcissaOf: nodeA inSubtreeFromLayer: aNode layer - 1)).
			max := max max: difference.
			nodeB := self followLeftContour: nodeB toLayer: nodeB layer + 1.
			nodeA := self followRightContour: nodeA toLayer: nodeA layer + 1 ].
	^ max
]

{ #category : #algorithm }
RTAbstractCompactTree >> computePosition: aNode [
"compute the position of the given node and of his sons recursively"

	| children neighbor nodeA |
	
	children := self childrenFor: aNode.
	neighbor := self leftSiblingOf: aNode.
	
	children isEmpty ifTrue: [ neighbor isNil ifTrue: [ aNode x: 0; mod: 0.]  
											 ifFalse: [ aNode x: (neighbor x + (horizontalGap /2)); mod: (neighbor mod);
													  pointer: (self followRightContour: neighbor toLayer: (aNode layer + 1)) ] ]
					 
					 ifFalse: [aNode leftContour: children first;
									rightContour: children last.
							  children do: [:e | self computePosition: e ].
							      aNode x: (aNode leftContour x + aNode rightContour x + aNode rightContour mod ) /2;
										mod: 0. 
								neighbor isNil ifFalse: [ aNode mod: (self compareContourOf: aNode with: neighbor).
									
													  nodeA := (self followLeftContour: (aNode father) toLayer: (aNode layer)).
													  [(self followLeftContour: nodeA toLayer: (nodeA layer + 1)) isNil ] whileFalse: [ nodeA := self followLeftContour: nodeA toLayer: (nodeA layer + 1) ].
													 nodeA pointer: (self followLeftContour: aNode toLayer: (nodeA layer + 1)).
													
													 nodeA := self followRightContour: aNode toLayer: (aNode layer + 1).
													 [(self followRightContour: nodeA toLayer: (nodeA layer +1)) isNil ] whileFalse: [ nodeA := self followRightContour: nodeA toLayer: (nodeA layer +1) ].
													nodeA pointer: (self followRightContour: neighbor toLayer: (nodeA layer +1) ) ] ] 
]

{ #category : #hook }
RTAbstractCompactTree >> coordinate: aNode withMod: aFloat [
	self subclassResponsibility
]

{ #category : #hook }
RTAbstractCompactTree >> doExecute: nodeElements [ 
	| rootNodes |
	
	initialLayout isNil  ifFalse: [ initialLayout new executeOnElements: nodeElements. ].
	
	rootNodes := self rootNodesFor: nodeElements.

"	root isNil ifTrue: [ rootNodes := self rootNodesFor: nodeElements. ]
			 ifFalse: [ rootNodes := Array with: root.
						self coveringTreeFor: nodeElements from: root ].
"	
	rootNodes do: [:e | self initialize: e whoseFatherIs: nil ];
		do: [:e | self computePosition:e].
	
	rootNodes  do: [:e |
					self draw:e withMod: 0  ]
]

{ #category : #hook }
RTAbstractCompactTree >> draw: aNode withMod: aFloat [
	self subclassResponsibility
]

{ #category : #algorithm }
RTAbstractCompactTree >> followLeftContour: aNode toLayer: anInteger [
	"return the last node in the left contour begining at anode"
	
	((self layerOf: aNode) = anInteger ) ifTrue: [^ aNode  ].
	((self layerOf: aNode) > anInteger ) ifTrue: [^ nil  ].
	
	(self leftContourOf: aNode) isNil ifTrue: [ (self pointerOf: aNode)  isNil ifTrue: [ ^ nil ] 
														 ifFalse: [ ^ ( self followLeftContour: (self pointerOf: aNode) toLayer: anInteger ) ] ]
	
			  				ifFalse: [ ^ (self followLeftContour: (self leftContourOf: aNode) toLayer: anInteger ) ]
]

{ #category : #algorithm }
RTAbstractCompactTree >> followRightContour: aNode toLayer: anInteger [
	"return the node in the right contour begining at anode in layer anInteger"

	((self layerOf: aNode) = anInteger ) ifTrue: [^ aNode  ].
	((self layerOf: aNode) > anInteger ) ifTrue: [^ nil  ].

	(self rightContourOf: aNode) isNil ifTrue: [ (self pointerOf: aNode) isNil ifTrue: [ ^ nil ] 
														 ifFalse: [ ^ ( self followRightContour: (self pointerOf: aNode) toLayer: anInteger ) ] ]
	
			  				ifFalse: [ ^ (self followRightContour: (self rightContourOf: aNode) toLayer: anInteger ) ]
]

{ #category : #algorithm }
RTAbstractCompactTree >> getAbcissaOf: aNode inSubtreeFromLayer: anInteger [

	| node x |
	
	(anInteger < 0) ifTrue: [^ self getAbcissaOf: aNode inSubtreeFromLayer: 0 ].
	
	((self layerOf: aNode) = anInteger ) ifTrue: [ ^ self xOf: aNode ].
	((self layerOf: aNode) < anInteger ) ifTrue: [ ^ nil ].
	
	x := (self xOf: aNode) + (self modOf: aNode).
	
	node := self fatherOf: aNode.
	
	[(self layerOf: node) = anInteger  ] whileFalse: [ x := x + (self modOf: node).
									node := self fatherOf: node ].
								
	^ x
]

{ #category : #'initialize-release' }
RTAbstractCompactTree >> greedyCycleRemoval: aGraph [
]

{ #category : #'initialize-release' }
RTAbstractCompactTree >> initialLayout: aLayout [

	initialLayout := aLayout 
]

{ #category : #'initialize-release' }
RTAbstractCompactTree >> initialize [ 

	super initialize.
	verticalGap := 20.
	horizontalGap := 30.
	margin := 40. 
	sonsDictionary := Dictionary new
]

{ #category : #'initialize-release' }
RTAbstractCompactTree >> initialize: aNode whoseFatherIs: another [ 

	self fatherOf: aNode put: another.
	
	another isNil ifTrue: [ self layerOf: aNode put: 0 ] ifFalse: [ self layerOf: aNode put: (self layerOf: another) + 1 ] .
	
	( self childrenFor: aNode ) do: [ :e | self initialize: e whoseFatherIs: aNode ]
]

{ #category : #algorithm }
RTAbstractCompactTree >> leftSiblingOf: aNode [
"return the left sibling of the given node "

	| children |

	(self fatherOf: aNode) isNil ifTrue: ["has no sibling" ^ nil]
					    ifFalse: [ children := self childrenFor: (self fatherOf: aNode).
								(children first) = aNode ifTrue: ["as no left sibling" ^ nil ]
																    ifFalse: [^ children at: ((children indexOf: aNode) - 1) ] ]
]

{ #category : #algorithm }
RTAbstractCompactTree >> nodeAbcissaWithNeighbor: aNode [

	self subclassResponsibility 
]

{ #category : #'initialize-release' }
RTAbstractCompactTree >> root: aNode [ 

	root := aNode 
]
