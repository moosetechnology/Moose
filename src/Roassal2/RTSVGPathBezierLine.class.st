"
This is a RTBezierLine using a TRSVGPath instead of a TRBezierLine as Trachel shape.
An edge with an array of control points will generate a sequence of quadratic Bezier curves.
"
Class {
	#name : #RTSVGPathBezierLine,
	#superclass : #RTBezierLine,
	#category : #'Roassal2-Shapes'
}

{ #category : #'as yet unclassified' }
RTSVGPathBezierLine >> getSVGPath: anEdge [
	| from to mid   p realControllingElements |
	
	from := anEdge from position.
	to := anEdge to position.
	
	realControllingElements := controllingElements rtValue: anEdge.
	
	mid := from.
	p := 'M ', from x asString,' ', from y asString.
	
	
	realControllingElements allButLastDo: [ :c | 
		mid := (c position x +  ((realControllingElements after:c) position x - c position x /2))@(c position y +  ((realControllingElements after:c) position y - c position y /2)).
		p := p, ' Q ', c position x asString, ' ', c position y asString, ' ', mid x asString, ' ', mid y asString.	 	
		 ].
	
	p := p, ' Q ', realControllingElements last position x asString, ' ', realControllingElements last position y asString, ' ', to x asString, ' ', to y asString.	
	
	^ p

	
]

{ #category : #public }
RTSVGPathBezierLine >> trachelShapeFor: anEdge [
	| trachelShape realControllingElements |
	trachelShape := TRSVGPath new.
	self updateFor: anEdge trachelShape: trachelShape.
	
	realControllingElements := controllingElements rtValue: anEdge. 
	realControllingElements do: [ :e | e addConnectedEdge: anEdge ].
	^ trachelShape
]

{ #category : #rendering }
RTSVGPathBezierLine >> updateFor: edge trachelShape: trachelShape [
	trachelShape resetPath. 
	trachelShape strokePaint: (self colorFor: edge).
	trachelShape borderWidth: (self widthFor: edge).
	trachelShape path: (self getSVGPath: edge).
	trachelShape strokePaint: (self colorFor: edge).
	trachelShape fillColor:(Color white alpha: 0).

]
