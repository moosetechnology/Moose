"
A DCRTDecoratedLine is an arrowed line on both ends between its extremities
"
Class {
	#name : #RTDecoratedLine,
	#superclass : #RTAbstractLine,
	#instVars : [
		'line',
		'head',
		'tail'
	],
	#category : #'Roassal2-LineDecorations'
}

{ #category : #examples }
RTDecoratedLine class >> example [
	" this class is a problem as it provides examples as well / this is not gtExample-compatible "
	<todo: 'reorganize examples'>
	| v b1 b2 edges |
	b1 := (RTBox new
		size: 150;
		element)
		translateTo: 0 @ 0;
		@ RTDraggable.
	b2 := (RTBox new
		size: 150;
		element)
		translateTo: 400 @ 0;
		@ RTDraggable.
	edges := OrderedCollection new.
	edges add: ((RTArrowedLine new head: RTFilledDiamond asHead; color: Color black; width: 2; attachPoint: (RTShorterDistanceWithOffsetAttachPoint new offset: 15)) edgeFrom: b1 to: b2).
	edges add: ((RTDecoratedLine new color: Color blue; width: 2; attachPoint: (RTShorterDistanceWithOffsetAttachPoint new offset: 15)) edgeFrom: b1 to: b2).
	edges add: ((RTDecoratedLine new filledDiamondHead; color: Color green; width: 2; attachPoint: (RTShorterDistanceWithOffsetAttachPoint new offset: 15)) edgeFrom: b1 to: b2).
	edges add: ((RTDecoratedLine new filledDiamondHead; emptyCircleTail; color: Color red; width: 2; attachPoint: (RTShorterDistanceWithOffsetAttachPoint new offset: 15)) edgeFrom: b1 to: b2).
	v := RTView new
		add: b1;
		add: b2;
		addAll: edges.
	edges do: [ :each | each update ].
	^ v
]

{ #category : #heads }
RTDecoratedLine >> arrowHead [
	self head: RTSimpleArrow asHead
]

{ #category : #heads }
RTDecoratedLine >> arrowTail [
	self tail: RTSimpleArrow asTail
]

{ #category : #'attach point' }
RTDecoratedLine >> attachPoint: anAttachPoint [
	super attachPoint: anAttachPoint.
	tail attachPoint: self attachPoint.
	head attachPoint: self attachPoint.
	line attachPoint: self attachPoint
]

{ #category : #accessing }
RTDecoratedLine >> color: aColor [
	color := aColor.
	tail color: self color.
	head color: self color.
	line color: self color
]

{ #category : #public }
RTDecoratedLine >> directed [
	self line: RTDirectedLine new
]

{ #category : #public }
RTDecoratedLine >> edgeFrom: el1 to: el2 [
	^ (RTEdge from: el1 to: el2) addShape: self
]

{ #category : #public }
RTDecoratedLine >> empty [
	self
		emptyArrowHead;
		noTail
]

{ #category : #heads }
RTDecoratedLine >> emptyArrowHead [
	self head: RTEmptyArrow asHead
]

{ #category : #heads }
RTDecoratedLine >> emptyArrowTail [
	self tail: RTEmptyArrow asTail
]

{ #category : #heads }
RTDecoratedLine >> emptyCircleHead [
	self head: RTEmptyCircle asHead
]

{ #category : #heads }
RTDecoratedLine >> emptyCircleTail [
	self tail: RTEmptyCircle asTail
]

{ #category : #heads }
RTDecoratedLine >> emptyDiamondHead [
	self head: RTEmptyDiamond asHead
]

{ #category : #heads }
RTDecoratedLine >> emptyDiamondTail [
	self tail: RTEmptyDiamond asTail
]

{ #category : #heads }
RTDecoratedLine >> emptyNarrowArrowHead [
	self head: RTEmptyNarrowArrow asHead
]

{ #category : #heads }
RTDecoratedLine >> emptyNarrowArrowTail [
	self tail: RTEmptyNarrowArrow asTail
]

{ #category : #heads }
RTDecoratedLine >> filledArrowHead [
	self head: RTFilledArrow asHead
]

{ #category : #heads }
RTDecoratedLine >> filledArrowTail [
	self tail: RTFilledArrow asTail
]

{ #category : #heads }
RTDecoratedLine >> filledCircleHead [
	self head: RTFilledCircle asHead
]

{ #category : #heads }
RTDecoratedLine >> filledCircleTail [
	self tail: RTFilledCircle asTail
]

{ #category : #heads }
RTDecoratedLine >> filledDiamondHead [
	self head: RTFilledDiamond asHead
]

{ #category : #heads }
RTDecoratedLine >> filledDiamondTail [
	self tail: RTFilledDiamond asTail
]

{ #category : #heads }
RTDecoratedLine >> filledNarrowArrowHead [
	self head: RTFilledNarrowArrow asHead
]

{ #category : #heads }
RTDecoratedLine >> filledNarrowArrowTail [
	self tail: RTFilledNarrowArrow asTail
]

{ #category : #accessing }
RTDecoratedLine >> head [
	^ head
]

{ #category : #accessing }
RTDecoratedLine >> head: aLineHead [
	(head := aLineHead)
		attachPoint: attachPoint;
		color: color
]

{ #category : #initialization }
RTDecoratedLine >> initialize [
	super initialize.
	self
		straight;
		notDecorated
]

{ #category : #accessing }
RTDecoratedLine >> line [
	^ line
]

{ #category : #accessing }
RTDecoratedLine >> line: aLineShape [
	(line := aLineShape)
		attachPoint: attachPoint;
		color: color
]

{ #category : #heads }
RTDecoratedLine >> noHead [
	self head: RTNoDecorationShape asHead
]

{ #category : #heads }
RTDecoratedLine >> noTail [
	self tail: RTNoDecorationShape asTail
]

{ #category : #public }
RTDecoratedLine >> notDecorated [
	self
		noHead;
		noTail
]

{ #category : #public }
RTDecoratedLine >> simple [
	self
		filledNarrowArrowHead;
		noTail
]

{ #category : #public }
RTDecoratedLine >> straight [
	self line: RTLine new
]

{ #category : #accessing }
RTDecoratedLine >> tail [
	^ tail
]

{ #category : #accessing }
RTDecoratedLine >> tail: aLineTail [
	(tail := aLineTail)
		ifNotNil: [ 
			tail attachPoint: attachPoint.
			tail color: color ]
]

{ #category : #public }
RTDecoratedLine >> trachelShapeFor: anEdge [
	^ TRCompositeShape new
		addShape: (line trachelShapeFor: anEdge);
		addShape: (head trachelShapeFor: anEdge);
		addShape: (tail trachelShapeFor: anEdge);
		yourself
]

{ #category : #rendering }
RTDecoratedLine >> updateFor: edge trachelShape: trachelShape [
	line updateFor: edge trachelShape: edge trachelShape shapes first.
	head updateFor: edge trachelShape: edge trachelShape shapes second.
	tail updateFor: edge trachelShape: edge trachelShape shapes third
]

{ #category : #public }
RTDecoratedLine >> width: aValue [
	line width: aValue
]

{ #category : #'attach point' }
RTDecoratedLine >> withShorterDistanceWithOffsetAttachPoint [
	self attachPoint: RTShorterDistanceWithOffsetAttachPoint new
]
