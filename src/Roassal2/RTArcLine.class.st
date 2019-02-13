"
I am a circle arc-like line, good for visualizing two lines going in opposite directions.

[[[
|v els e1 e2 arcShape|

v := RTView new.

els := RTEllipse new color: Color gray; borderColor: Color black; size: 20; elementsOn: #(A B).
els @ RTDraggable.

v addAll: els.

els second translateBy: 100 @ 0.

e1 := RTArcLine new distance: 10; withContinuousCircleAttachPoint; filledNarrowArrowHead; color: Color black; edgeFrom: els first to: els last.

e2 := RTArcLine new distance: 10; withContinuousCircleAttachPoint; filledNarrowArrowHead; color: Color black; edgeFrom: els second to: els first.

v add: e1; add: e2.

v
]]]
"
Class {
	#name : #RTArcLine,
	#superclass : #RTAbstractLine,
	#instVars : [
		'distance',
		'head'
	],
	#category : #'Roassal2-Shapes'
}

{ #category : #accessing }
RTArcLine >> attachPoint: anAttachPoint [
	super attachPoint: anAttachPoint.
	head attachPoint: anAttachPoint
]

{ #category : #accessing }
RTArcLine >> color: aColor [
	super color: aColor.
	head color: aColor
]

{ #category : #accessing }
RTArcLine >> distance: aDistance [
	distance := aDistance
]

{ #category : #accessing }
RTArcLine >> distanceFor: anEdge [
	^ distance rtValue: anEdge
]

{ #category : #public }
RTArcLine >> empty [
	self head: RTEmptyArrowHead new
]

{ #category : #public }
RTArcLine >> emptyNarrowArrowHead [
	self head: RTEmptyNarrowArrow asHead
]

{ #category : #public }
RTArcLine >> filledArrowHead [
	self head: RTFilledArrow asHead
]

{ #category : #public }
RTArcLine >> filledNarrowArrowHead [
	self head: RTFilledNarrowArrow asHead
]

{ #category : #accessing }
RTArcLine >> head [
	^ head
]

{ #category : #accessing }
RTArcLine >> head: aLineDecorationShape [
	head := aLineDecorationShape.
	head attachPoint: attachPoint
]

{ #category : #initialization }
RTArcLine >> initialize [
	super initialize.
	self simple
]

{ #category : #public }
RTArcLine >> simple [
	self head: RTSimpleArrowHead new
]

{ #category : #hooks }
RTArcLine >> trachelShapeClass [
	^ TRArcLineShape
]

{ #category : #hooks }
RTArcLine >> trachelShapeFor: anEdge [
	| lineTrachelShape headTrachelShape shape |
	(self isSelfLoopAllowedFor: anEdge) ifFalse: [ 
		^ TRNoShape instance ].
	lineTrachelShape := self trachelShapeClass new.
	self updateLineFor: anEdge trachelShape: lineTrachelShape.
	headTrachelShape := head trachelShapeFor: anEdge.
	shape := TRCompositeShape new
		addShape: lineTrachelShape;
		addShape: headTrachelShape;
		yourself.
	^ shape
]

{ #category : #rendering }
RTArcLine >> updateFor: edge trachelShape: trachelShape [
	(self isSelfLoopAllowedFor: edge) ifFalse: [ 
		^ trachelShape ].
	self updateLineFor: edge trachelShape: trachelShape shapes first.
	head updateFor: edge trachelShape: trachelShape shapes second.
	^ trachelShape
]

{ #category : #rendering }
RTArcLine >> updateLineFor: edge trachelShape: trachelShape [
	trachelShape
		line:
			(RTLineSegment
				from: (attachPoint startingPointOf: edge)
				to: (attachPoint endingPointOf: edge)).
	trachelShape color: (self colorFor: edge).
	trachelShape width: (self widthFor: edge).
	trachelShape distance: (self distanceFor: edge).
	trachelShape resetPath.
	^ trachelShape
]
