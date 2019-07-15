"
A RTShorterDistanceAttachPointAndCompositeShape assumes that the elements to be connected to or from have a composite shape

Here is an example:
-=-=-=-=-=-=-=-=-=
v := RTView new.
s1 := RTBox new color: Color red.
s2 := RTCompositeShape
        with: (RTBox new size: 20; color: Color green)
        with: (RTBox new color: Color blue).
s2 horizontal.
e1 := s1 elementOn: #atomic.
e2 := s2 elementOn: #composite.

e1 @ RTDraggable.
e2 @ RTDraggable.

attachPoint := RTShorterDistanceAttachPointAndCompositeShape new
						composedShapeSelection: #second.
e := RTLine new attachPoint: attachPoint; edgeFrom: e1 to: e2.
v add: e1; add: e2; add: e.
RTTreeLayout new doNotAttachPoint; on: v elements.
v
-=-=-=-=-=-=-=-=-=
"
Class {
	#name : #RTShorterDistanceAttachPointAndCompositeShape,
	#superclass : #RTAbstractShorterDistanceAttachPoint,
	#instVars : [
		'composedShapeSelection'
	],
	#category : #'Roassal2-AttachPoint'
}

{ #category : #'public - hooks' }
RTShorterDistanceAttachPointAndCompositeShape >> attachPointsFor: anEdge on: anElement [
	"Return the four possible attach points for each of the four sides for given edge on given element."

	| rec center |
	rec := self getEncompassingRectangleOf: anElement.
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

{ #category : #'public - accessing' }
RTShorterDistanceAttachPointAndCompositeShape >> composedShapeSelection: aSymbol [
	"aSymbol can be #first, #second, #third, or a one arg block"
	"The argument is used to select which of the shapes in the composed shape of the element to pick"
	composedShapeSelection := aSymbol
]

{ #category : #'public - hooks' }
RTShorterDistanceAttachPointAndCompositeShape >> getEncompassingRectangleOf: anElement [
	"Return the rectangle of the trachel shape that should be considered"
	^ (self trachelShapeToBeConsideredOf: anElement) encompassingRectangle
	
]

{ #category : #'public - hooks' }
RTShorterDistanceAttachPointAndCompositeShape >> hasCompositeShape: anElement [
	"A bit ugly here... But it greatly simplify the code"
	^ anElement trachelShape isKindOf: TRCompositeShape
]

{ #category : #initialization }
RTShorterDistanceAttachPointAndCompositeShape >> initialize [
	super initialize.
	composedShapeSelection := #first
]

{ #category : #'public - hooks' }
RTShorterDistanceAttachPointAndCompositeShape >> trachelShapeToBeConsideredOf: anElement [
	"Return the trachel shape to be considered from the roassal element argument"
	
	^ (self hasCompositeShape: anElement)
		ifTrue: [ composedShapeSelection rtValue: anElement trachelShape shapes ]
		ifFalse: [ anElement trachelShape ]
]
