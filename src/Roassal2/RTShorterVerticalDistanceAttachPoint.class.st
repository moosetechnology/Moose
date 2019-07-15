"
-=-=-=

v := RTView new.

e1 := (RTBox new size: 50) elementOn: 1.
e2 := (RTEllipse new size: 50) elementOn: 2.
v add: e1; add: e2.
e2 translateBy: 30 @ 60.

e1 @ RTDraggable.
e2 @ RTDraggable.

s := RTArrowedLine new color: Color black.
s attachPoint:  RTShorterVerticalDistanceAttachPoint new.
l := s edgeFrom: e1 to: e2.
v add: l.

v

-=-=-=-
"
Class {
	#name : #RTShorterVerticalDistanceAttachPoint,
	#superclass : #RTAbstractShorterDistanceAttachPoint,
	#category : #'Roassal2-AttachPoint'
}

{ #category : #'public - hooks' }
RTShorterVerticalDistanceAttachPoint >> attachPointsFor: anEdge on: anElement [
	"Return the four possible attach points for each of the four sides for given edge on given element."
	| rec center |
	rec := anElement encompassingRectangle.
	center := rec center.
	^ Array 
		"upper side"
		with: ((center x) @ rec top)		
		"lower side"
		with: ((center x) @ rec bottom)
	
]
