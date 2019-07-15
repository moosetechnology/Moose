Class {
	#name : #RTDirectedLine,
	#superclass : #RTLine,
	#instVars : [
		'offset'
	],
	#category : #'Roassal2-Shapes'
}

{ #category : #initialization }
RTDirectedLine >> initialize [
	super initialize.
	offset := 0.5
]

{ #category : #accessing }
RTDirectedLine >> offset: anOffsetAsFloat [
	"Argument is a float between 0.0 and 1.0. Its values means where the curve is positioned to.
	lesser the argument, closer to the starting point"
	offset := anOffsetAsFloat
]

{ #category : #hooks }
RTDirectedLine >> pointsFrom: from To: to [

	| point mid   |
	mid := (to * (1 - offset)) + (from * offset).
	point := from + ((mid - from) rightRotated).
	"(to - from) abs / 2"
	^ Array with: from with: point with: to.



"	| point1 point2 mid   |
	mid := ((to x + from x) / 2) @ ((to y + from y) / 2).
	point1 := from rotateBy: (Float pi /16) about: mid.
	point2 := from rotateBy: (15*(Float pi /16)) about: mid.	
	^ {from.
	point1.
	point2.
	to}
"
]

{ #category : #hooks }
RTDirectedLine >> trachelShapeClass [
	^ TRBezierShape
]

{ #category : #rendering }
RTDirectedLine >> updateFor: edge trachelShape: trachelShape [
	trachelShape points: (self pointsFrom: (attachPoint startingPointOf: edge) To: (attachPoint endingPointOf: edge)).
	trachelShape color: (self colorFor: edge).
	trachelShape width: (self widthFor: edge).
	trachelShape resetPath

]
