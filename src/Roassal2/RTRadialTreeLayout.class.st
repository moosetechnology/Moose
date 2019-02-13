"
A RORadialTreeLayout is xxxxxxxxx.

"
Class {
	#name : #RTRadialTreeLayout,
	#superclass : #RTAbstractCompactTree,
	#category : #'Roassal2-Layouts'
}

{ #category : #algorithm }
RTRadialTreeLayout >> compareContourOf: aNode with: another [
	"return the number of radians the subtree induced by aNode must be displaced to be separated by a predefined distance (horizontalGap) from the one induced by anotherNode"

	| difference max nodeA nodeB |
	nodeB := aNode.	"the right one"
	nodeA := another.	"the left one"
	max := aNode = another
		ifTrue: [ 0 ]
		ifFalse: [ horizontalGap / (self layerOf: nodeB) / 2 - ((self xOf: nodeB) - (self getAbcissaOf: nodeA inSubtreeFromLayer: (self layerOf: aNode) - 1)) ].
	nodeB := self followLeftContour: nodeB toLayer: (self layerOf: nodeB) + 1.
	nodeA := self followRightContour: nodeA toLayer: (self layerOf: nodeA) + 1.
	[ nodeB isNil not & nodeA isNil not ]
		whileTrue: [ 
			difference := horizontalGap / (self layerOf: nodeA)
				-
					((self getAbcissaOf: nodeB inSubtreeFromLayer: (self layerOf: aNode) - 1)
						- (self getAbcissaOf: nodeA inSubtreeFromLayer: (self layerOf: aNode) - 1)).
			max := max max: difference.
			nodeB := self followLeftContour: nodeB toLayer: (self layerOf: nodeB) + 1.
			nodeA := self followRightContour: nodeA toLayer: (self layerOf: nodeA) + 1 ].
	^ max
]

{ #category : #hook }
RTRadialTreeLayout >> computeGap: aNode [
	" compute the vertical gap needed for drawing the radial tree "
	| gap maxAbcissa i abc nodeL nodeR layer |	
	gap := 0.
	maxAbcissa := 0.
	layer := 1.
	
	i := 1.
	[ nodeL :=(self followLeftContour: aNode toLayer: i).
	nodeR := (self followRightContour: aNode toLayer: i).
	nodeL isNil not & nodeR isNil not ] whileTrue: [ abc := (((self getAbcissaOf: nodeR inSubtreeFromLayer: 0) - (self getAbcissaOf: nodeL inSubtreeFromLayer: 0 ) + (horizontalGap / layer/2)) / layer).
																	(abc > maxAbcissa) ifTrue: [ maxAbcissa := abc. 
																								layer := layer ].
																	i := i + 1 ].

	
	gap:= (maxAbcissa / 2 /Float pi ) floor +1.
	
	((verticalGap isNil) or: [gap > verticalGap])  ifTrue: [ self verticalGap: gap ]
]

{ #category : #algorithm }
RTRadialTreeLayout >> computePosition: aNode [
"compute the position of the given node and of his sons recursively"

	| children neighbor nodeA |
	
	children :=self childrenFor: aNode.
	neighbor := self leftSiblingOf: aNode.
	
	children isEmpty ifTrue: [ neighbor isNil ifTrue: [ self xOf: aNode put: 0. self modOf: aNode put: 0. ]  
		
											 ifFalse: [ self xOf: aNode put: ((self xOf: neighbor) + (horizontalGap /(self layerOf: aNode) /2)). self modOf: aNode put: ((self modOf: neighbor)).
													 self pointerOf: aNode put: (self followRightContour: neighbor toLayer: ((self layerOf: aNode) + 1)) ] ]
					 
					 ifFalse: [ self leftContourOf: aNode put: children first.
									self rightContourOf: aNode put: children last.
							  children do: [:e | self computePosition: e ].
							      self xOf: aNode put: ((self xOf: ( self leftContourOf: aNode ) ) + ( self xOf: ( self rightContourOf: aNode ) ) + (self modOf: ( self rightContourOf: aNode ) ) ) / 2. 
										self modOf: aNode put: 0. 
								neighbor isNil ifFalse: [ self modOf: aNode put: (self compareContourOf: aNode with: neighbor).
									
													  nodeA := (self followLeftContour: (self fatherOf: aNode) toLayer: (self layerOf: aNode)).
													  [(self followLeftContour: nodeA toLayer: ((self layerOf: nodeA) + 1)) isNil ] whileFalse: [ nodeA := self followLeftContour: nodeA toLayer: ((self layerOf: nodeA) + 1) ].
													 self pointerOf: nodeA put: (self followLeftContour: aNode toLayer: ((self layerOf: nodeA) + 1)).
													
													 nodeA := self followRightContour: aNode toLayer: ((self layerOf: aNode) + 1).
													nodeA ifNil: [ ^ self ].
													 [(self followRightContour: nodeA toLayer: ((self layerOf: nodeA) + 1)) isNil ] whileFalse: [ nodeA := self followRightContour: nodeA toLayer: ((self layerOf: nodeA) +1) ].
													self pointerOf: nodeA put: (self followRightContour: neighbor toLayer: ((self layerOf: nodeA) + 1) ) ] ]. 
											
]

{ #category : #algorithm }
RTRadialTreeLayout >> diameterOf: aNode [

	|diam|
	
	(aNode shapes first isKindOf: RTEllipse) ifTrue: [ diam := aNode width max: aNode height ]
										ifFalse: [ diam := (aNode width * aNode width + (aNode height * aNode height)) sqrt floor ].
	
	^ diam
]

{ #category : #hook }
RTRadialTreeLayout >> doExecute: nodeElements [

	| rootNodes xOffset maximumRadius | 
	initialLayout isNil
		ifFalse: [ initialLayout new executeOnElements: nodeElements ].
	rootNodes := self rootNodesFor: nodeElements.
	rootNodes
		do: [ :e | self initialize: e whoseFatherIs: nil ];
		do: [ :e | self computePosition: e. self step];
		do: [ :e | self computeGap: e ];
		do: [ :e | self toRadialTree: e withMod: 0 ].
	xOffset := 0.
	rootNodes
		do: [ :e | 
			maximumRadius := self radialDraw: e.
			"Shifting all the subgroups"
			self shiftTree: e by:  (maximumRadius+xOffset)@maximumRadius.
			xOffset := xOffset + (2 * maximumRadius) + 10.  ].


]

{ #category : #private }
RTRadialTreeLayout >> gap [
	
	^ self verticalGap
]

{ #category : #algorithm }
RTRadialTreeLayout >> halfDiameterOf: aNode [

	|diam|
	
	(aNode shapes first isKindOf: RTEllipse) ifTrue: [ diam := aNode width max: aNode height ]
										ifFalse: [ diam := (aNode width * aNode width + (aNode height * aNode height)) sqrt floor ].
	
	^ diam / 2
]

{ #category : #private }
RTRadialTreeLayout >> layoutLayer: aCollection radius: oldRadius from: aFromAngle to: aToAngle [
	
	| delta childRadius maximumRadius myRadius fromAngle toAngle |
	"Initialize with default value"
	maximumRadius := oldRadius.
	aCollection isEmpty
		ifFalse:
			[myRadius := oldRadius + self gap + (self maximumRadius: aCollection).
			childRadius := oldRadius + self gap + (self maximumDiameter: aCollection).	"This is a purely optical tweak"
			(aCollection size = 1 and: [aToAngle - aFromAngle = (2 * Float pi)])
				ifTrue:
					[delta := 0.4 * Float pi.
					fromAngle := 0.8 * Float pi.
					toAngle := fromAngle + delta]
				ifFalse:
					[delta := (aToAngle - aFromAngle) / aCollection size.
					fromAngle := aFromAngle.
					toAngle := aFromAngle + delta].
			aCollection
				do:
					[:child | 
					translator translateTopLeftOf: child to: (Point
								r: myRadius
								theta: toAngle - (delta / 2.0)).
					"child
						translateTo:
							(Point
								radius: myRadius
								theta: toAngle - (delta / 2.0))."
					maximumRadius := maximumRadius
						max:
							(self
								layoutLayer: (self childrenFor: child)
								radius: childRadius
								from: fromAngle
								to: toAngle).
					fromAngle := toAngle.
					toAngle := toAngle + delta]].
	^maximumRadius
]

{ #category : #private }
RTRadialTreeLayout >> moveAllElementsToTopLeft: elements [

	| pos min |
	pos := elements collect: #position.
	min := pos inject: 0 @ 0 into: [ :minimum :p | minimum min: p ].
	elements do: [ :e | e translateBy: min negated ] 
]

{ #category : #algorithm }
RTRadialTreeLayout >> nodeAbcissaWithNeighbor: aNode [

	^ aNode x + (horizontalGap / aNode layer /2) + ((self halfDiameterOf: aNode) / aNode layer)
]

{ #category : #algorithm }
RTRadialTreeLayout >> radialDraw: aNode [
	"draw the subtree induced by the given node"

	| children r max |
	r := (self rOf: aNode).
	translator translateTopLeftOf: aNode to: (Point r: r theta: (self thetaOf: aNode)).
	"aNode translateTo: (Point radius: (aNode r) theta: (aNode theta))."
	children := self childrenFor: aNode.
	max := 0.
	children do: [ :e | max := max max: (self radialDraw: e) ].
	^ r + max.
]

{ #category : #hook }
RTRadialTreeLayout >> rotateSubtreeFrom: aNode by: aFloat [
	
	aNode theta: aNode theta + aFloat.
	
	(self childrenFor: aNode) do: [ :e | self rotateSubtreeFrom: e by: aFloat ]
]

{ #category : #hook }
RTRadialTreeLayout >> spreadNodes: nodeElements around: aNode [

	|nodeL nodeR i angle beta lay1 |
	
	i := 1.
	angle := 0.
	
	[ nodeL :=(self followLeftContour: aNode toLayer: i).
	nodeR := (self followRightContour: aNode toLayer: i).
	nodeL isNil not & nodeR isNil not ] whileTrue: [ angle := angle max: ((nodeR theta - nodeL theta) + ((self halfDiameterOf: nodeR) + (self halfDiameterOf: nodeL) + horizontalGap  /i /verticalGap )).
													i := i+1. ].

	lay1 := nodeElements select: [ :e | e layer = 1 ].

	beta := Float pi * 2 - angle / lay1 size.
	
	lay1 do: [ :e | self rotateSubtreeFrom: e by: (lay1 indexOf: e) - 1 * beta ].
]

{ #category : #algorithm }
RTRadialTreeLayout >> toRadialTree: aNode withMod: aFloat [
	"compute polar coordinates of the subtree induced by anode from its cartesian coordinates "
	| children |
	self rOf: aNode put: ((self layerOf: aNode) * verticalGap ).
	((self rOf: aNode) = 0) ifTrue: [ self thetaOf: aNode put: 0 ] 
					ifFalse: [ self thetaOf: aNode put: ((self xOf: aNode)  + aFloat + (self modOf: aNode)) / verticalGap ].
	
	children := self childrenFor: aNode.
	
	children do: [ :e | self toRadialTree: e withMod: ( (self modOf: aNode) + aFloat) ]
]
