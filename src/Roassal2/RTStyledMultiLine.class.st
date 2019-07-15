"
A RTMultiLineHeaded is a multi-purpose modification of RTMultiLine with head and/or tail (like arrow) and possibility of being styled (dashed, dotted...).

-=-=-=
v := RTView new.

es := (RTEllipse new size: 20; color: (Color blue alpha: 0.3)) elementsOn: (1 to: 10).
RTCircleLayout new on: es allButFirst.
v addAll: es.
es @ RTDraggable.
TRConstraint move: es first onTheCenterOf: es allButFirst.

shape := RTStyledMultiLine new.
shape filledArrowHead; arrowTail; dashdotLine; orthoVertical.
shape attachPoint: (RTRectangleAttachPoint new).
lines := shape edgesFrom: es first toAll: es allButFirst.
v addAll: lines.

v
-=-=-=
"
Class {
	#name : #RTStyledMultiLine,
	#superclass : #RTMultiLine,
	#instVars : [
		'head',
		'tail',
		'dashes',
		'capStyle'
	],
	#category : #'Roassal2-Shapes'
}

{ #category : #heads }
RTStyledMultiLine >> arrowHead [
	self head: RTSimpleArrow asHead
]

{ #category : #heads }
RTStyledMultiLine >> arrowTail [
	self tail: RTSimpleArrow asTail
]

{ #category : #'attach point' }
RTStyledMultiLine >> attachPoint: anAttachPoint [
	tail attachPoint: anAttachPoint.
	head attachPoint: anAttachPoint.
	attachPoint := anAttachPoint
]

{ #category : #accessing }
RTStyledMultiLine >> color: aColor [
	tail color: aColor.
	head color: aColor.
	color := aColor
]

{ #category : #'line styles' }
RTStyledMultiLine >> dashdotLine [
		dashes := #("fill" 6 "gap" 3 "fill" 1 "gap" 3)
]

{ #category : #'line styles' }
RTStyledMultiLine >> dashedLine [
		dashes := #("fill" 6 "gap" 4)
]

{ #category : #accessing }
RTStyledMultiLine >> dashes [
	^ dashes
]

{ #category : #'line styles' }
RTStyledMultiLine >> dottedLine [
	dashes := #("fill" 1 "gap" 2)
]

{ #category : #heads }
RTStyledMultiLine >> emptyArrowHead [
	self head: RTEmptyArrow asHead
]

{ #category : #heads }
RTStyledMultiLine >> emptyArrowTail [
	self tail: RTEmptyArrow asTail
]

{ #category : #heads }
RTStyledMultiLine >> emptyCircleHead [
	self head: RTEmptyCircle asHead
]

{ #category : #heads }
RTStyledMultiLine >> emptyCircleTail [
	self tail: RTEmptyCircle asTail
]

{ #category : #heads }
RTStyledMultiLine >> emptyDiamondHead [
	self head: RTEmptyDiamond asHead
]

{ #category : #heads }
RTStyledMultiLine >> emptyDiamondTail [
	self tail: RTEmptyDiamond asTail
]

{ #category : #heads }
RTStyledMultiLine >> emptyNarrowArrowHead [
	self head: RTEmptyNarrowArrow asHead
]

{ #category : #heads }
RTStyledMultiLine >> emptyNarrowArrowTail [
	self tail: RTEmptyNarrowArrow asTail
]

{ #category : #heads }
RTStyledMultiLine >> filledArrowHead [
	self head: RTFilledArrow asHead
]

{ #category : #heads }
RTStyledMultiLine >> filledArrowTail [
	self tail: RTFilledArrow asTail
]

{ #category : #heads }
RTStyledMultiLine >> filledCircleHead [
	self head: RTFilledCircle asHead
]

{ #category : #heads }
RTStyledMultiLine >> filledCircleTail [
	self tail: RTFilledCircle asTail
]

{ #category : #heads }
RTStyledMultiLine >> filledDiamondHead [
	self head: RTFilledDiamond asHead
]

{ #category : #heads }
RTStyledMultiLine >> filledDiamondTail [
	self tail: RTFilledDiamond asTail
]

{ #category : #heads }
RTStyledMultiLine >> filledNarrowArrowHead [
	self head: RTFilledNarrowArrow asHead
]

{ #category : #heads }
RTStyledMultiLine >> filledNarrowArrowTail [
	self tail: RTFilledNarrowArrow asTail
]

{ #category : #accessing }
RTStyledMultiLine >> head [
	^ head
]

{ #category : #accessing }
RTStyledMultiLine >> head: aLineDecorationShape [
	(head := aLineDecorationShape asHead)
		attachPoint: attachPoint;
		color: color
]

{ #category : #initialization }
RTStyledMultiLine >> initialize [
	super initialize.
	self notDecorated
]

{ #category : #heads }
RTStyledMultiLine >> noHead [
	self head: RTNoDecorationShape asHead
]

{ #category : #heads }
RTStyledMultiLine >> noTail [
	self tail: RTNoDecorationShape asTail
]

{ #category : #heads }
RTStyledMultiLine >> notDecorated [
	self
		noHead;
		noTail
]

{ #category : #accessing }
RTStyledMultiLine >> pathFor: anEdge [
	| fromPoint toPoint |
	fromPoint := attachPoint startingPointOf: anEdge.
	toPoint := attachPoint endingPointOf: anEdge.
	^ blockProducingPath value: fromPoint value: toPoint
]

{ #category : #'line styles' }
RTStyledMultiLine >> solidLine [
	dashes := nil
]

{ #category : #accessing }
RTStyledMultiLine >> tail [
	^ tail
]

{ #category : #accessing }
RTStyledMultiLine >> tail: aLineDecorationShape [
	(tail := aLineDecorationShape asTail)
		attachPoint: attachPoint;
		color: color
]

{ #category : #public }
RTStyledMultiLine >> trachelShapeFor: anEdge [
	| multiShape path |
	path := self pathFor: anEdge.
	multiShape := TRCompositeShape new.
	2 to: path size do: [ :i | 
		multiShape
			addShape:
				(TRStyledLineShape new
					dashes: dashes;
					capStyle: capStyle;
					width: (self widthFor: anEdge);
					from: (path at: i - 1) to: (path at: i);
					color: (self colorFor: anEdge)) ].
	multiShape
		addShape: (head trachelShapeFor: anEdge from: path allButLast last);
		addShape: (tail trachelShapeFor: anEdge from: path second).
	^ multiShape
]

{ #category : #public }
RTStyledMultiLine >> updateFor: anEdge trachelShape: trachelShape [
	| path col shape |
	path := self pathFor: anEdge.
	col := self colorFor: anEdge.
	2 to: path size do: [ :i | 
		shape := trachelShape shapes at: i - 1.
		shape
			width: (self widthFor: anEdge);
			from: (path at: i - 1) to: (path at: i);
			color: col ].
	head updateFor: anEdge trachelShape: trachelShape shapes allButLast last from: path allButLast last.
	tail updateFor: anEdge trachelShape: trachelShape shapes last from: path second.
	trachelShape canvas ifNotNil: [ trachelShape pushFront ].
	^ trachelShape
]

{ #category : #'attach point' }
RTStyledMultiLine >> withShorterDistanceWithOffsetAttachPoint [
	self attachPoint: RTShorterDistanceWithOffsetAttachPoint new
]
