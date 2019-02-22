"
Continuous attach point which presumes both shapes are not rotated rectangles

-=-=-=
v := RTView new.

e1 := (RTBox new size: 50) elementOn: 1.
e2 := (RTEllipse new size: 50) elementOn: 2.
v add: e1; add: e2.
e2 translateBy: 30 @ 60.

e1 @ RTDraggable.
e2 @ RTDraggable.

s := RTArrowedLine new color: Color black.
s attachPoint: RTRectangleAttachPoint new.
l := s edgeFrom: e1 to: e2.
v add: l.

v
-=-=-=
"
Class {
	#name : #RTRectangleAttachPoint,
	#superclass : #RTContinuousAttachPoint,
	#category : #'Roassal2-AttachPoint'
}

{ #category : #private }
RTRectangleAttachPoint >> attachPointFor: anEdge from: fromRect to: toRect [
	| intersections offsetShift fromPoint toPoint |
	offsetShift := self offsetNormalFor: anEdge.
	fromPoint := fromRect center + offsetShift.
	toPoint := toRect center + offsetShift.
	fromRect = toRect
		ifTrue: [ ^ fromRect topLeft ].
	(fromRect containsRect: toRect)
		ifTrue: [ ^ fromRect pointNearestTo: toPoint ].
	(toRect containsRect: fromRect)
		ifTrue: [ ^ fromRect pointNearestTo: (toRect pointNearestTo: fromPoint) ].
	intersections := (RTLineSegment from: fromPoint to: toPoint) intersectRectangle: fromRect.
	intersections ifEmpty: [ ^ fromRect pointNearestTo: toPoint ].
	^ intersections detectMin: [ :each | each r ]
]

{ #category : #'public - hooks' }
RTRectangleAttachPoint >> basicEndingPointOf: anEdge [
	^ self attachPointFor: anEdge from: anEdge to encompassingRectangle to: anEdge from encompassingRectangle
]

{ #category : #'public - hooks' }
RTRectangleAttachPoint >> basicStartingPointOf: anEdge [
	^ self attachPointFor: anEdge from: anEdge from encompassingRectangle to: anEdge to encompassingRectangle
]
