"
A RTShorterDistanceWithOffsetAttachPoint contains the logic to have edges with a slight offset (normal to the edge direction).

-=-=-=-=
v := RTView new.

e1 := (RTBox new size: 50) elementOn: 1.
e2 := (RTEllipse new size: 50) elementOn: 2.
v add: e1; add: e2.
e2 translateBy: 30 @ 60.

e1 @ RTDraggable.
e2 @ RTDraggable.

s := RTArrowedLine new color: Color black.
s attachPoint: (RTShorterDistanceWithOffsetAttachPoint new offset: 20).
l := s edgeFrom: e1 to: e2.
v add: l.

l := s edgeFrom: e1 to: e2.
v add: l.

l := s edgeFrom: e1 to: e2.
v add: l.

v
-=-=-=-=
"
Class {
	#name : #RTShorterDistanceWithOffsetAttachPoint,
	#superclass : #RTAbstractShorterDistanceAttachPoint,
	#instVars : [
		'offset'
	],
	#category : #'Roassal2-AttachPoint'
}

{ #category : #'public - hooks' }
RTShorterDistanceWithOffsetAttachPoint >> attachPointsFor: anEdge on: anElement [
	"Return the four possible attach points for each of the four sides for given edge on given element."
	| rec center |
	rec := anElement encompassingRectangle.
	center := rec center.
	
	^ Array 
		"upper side"
		with: ((center x) @ rec top)
		 "right side"
		with: (rec right @ (center y))
		"lower side"
		with: ((center x) @ rec bottom)
		"left side"
		with: (rec left @ (center y))
	
]

{ #category : #'public - hooks' }
RTShorterDistanceWithOffsetAttachPoint >> basicEndingPointOf: anEdge [
	^ (super basicEndingPointOf: anEdge) + (self offsetNormalFor: anEdge)
]

{ #category : #'public - hooks' }
RTShorterDistanceWithOffsetAttachPoint >> basicStartingPointOf: anEdge [
	^ (super basicStartingPointOf: anEdge) + (self offsetNormalFor: anEdge)
]

{ #category : #initialization }
RTShorterDistanceWithOffsetAttachPoint >> initialize [
	super initialize.
	offset := 5.
]

{ #category : #accessing }
RTShorterDistanceWithOffsetAttachPoint >> offset [
	^ offset
]

{ #category : #accessing }
RTShorterDistanceWithOffsetAttachPoint >> offset: anInteger [
	"In case fromElement and toElement have more than one edge between the same two extremities, offset is the distance between lines"
	offset := anInteger
]

{ #category : #public }
RTShorterDistanceWithOffsetAttachPoint >> offsetNormalFor: anEdge [
    "Return the offset in case of multiple edges with the same starting and ending points"
    | indexOfEdge multipleEdges normal pos |
    multipleEdges := OrderedCollection new.
    multipleEdges addAll: 
        (anEdge to connectedEdges select: [ :e | 
            (e from == anEdge from) and: [ e to == anEdge to ] ]).    

    multipleEdges addAll: 
        (anEdge to connectedEdges select: [ :e | 
            (e to == anEdge from) and: [ e from == anEdge to ] ]).    

	multipleEdges size <= 1 ifTrue: [ ^ 0 @ 0 ].
	indexOfEdge := multipleEdges indexOf: anEdge.
	pos := anEdge to position - anEdge from position.
	normal := pos = (0@0) ifTrue: [ -1 @0  ] ifFalse: [ pos normal].
	^ (indexOfEdge - 1 - (multipleEdges size / 2)) * offset * normal
]
