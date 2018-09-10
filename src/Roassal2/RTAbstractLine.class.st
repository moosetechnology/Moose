"
All  my subclasses describes a line shape
"
Class {
	#name : #RTAbstractLine,
	#superclass : #RTShape,
	#instVars : [
		'width',
		'attachPoint',
		'allowSelfLoop'
	],
	#category : #'Roassal2-Shapes'
}

{ #category : #public }
RTAbstractLine class >> edgeFrom: el1 to: el2 [
	^ (RTEdge from: el1 to: el2) addShape: self
]

{ #category : #public }
RTAbstractLine class >> edgesFrom: element toAll: someElements [
	^ (RTEdge from: element toAll: someElements) addShape: self
]

{ #category : #public }
RTAbstractLine class >> element [
	self error: 'You cannot send #element to a line. Create an edge using #edgeFrom:to:'
]

{ #category : #public }
RTAbstractLine class >> elementOn: v [
	self error: 'You cannot send #elementOn: to a line. Create an edge using #edgeFrom:to:'
]

{ #category : #public }
RTAbstractLine class >> elementsOn: v [
	self error: 'You cannot send #elementsOn: to a line. Create an edge using #edgeFrom:to:'
]

{ #category : #public }
RTAbstractLine >> + anotherShape [
	"Compose this shape with another shape"
	anotherShape line: self.
	^ RTCompositeShape with: self with: anotherShape instance
]

{ #category : #visitor }
RTAbstractLine >> accept: aVisitor [
	aVisitor visitLine: self
]

{ #category : #testing }
RTAbstractLine >> allowSelfLoop [
	^ allowSelfLoop
]

{ #category : #'attach point' }
RTAbstractLine >> attachPoint [
	"Return the attach point of the line"
	^ attachPoint
]

{ #category : #'attach point' }
RTAbstractLine >> attachPoint: aRTAttachPoint [
	attachPoint := aRTAttachPoint.
]

{ #category : #public }
RTAbstractLine >> copyWithSimpleArrow [
	"Return a new line, the one with arrow"
	| arrow |
	arrow := RTSimpleArrowHead new 
				color: Color red; 
				attachPoint: RTVerticalAttachPoint instance.
	arrow size: 15; baseSize: 10. 
	^ self + arrow
]

{ #category : #public }
RTAbstractLine >> edgeFrom: el1 to: el2 [
	"Return a new edge, starting from el1 and ending with el2."
	^ (RTEdge from: el1 to: el2) addShape: self
]

{ #category : #public }
RTAbstractLine >> edgesFrom: element toAll: someElements [
	"Return a set of edges, with myself as shape. The parameter 'element' is an instance of RTElement, and someElements is simply an ordered collection of RTElement"
	^ (RTEdge from: element toAll: someElements) addShape: self
]

{ #category : #'error handling' }
RTAbstractLine >> element [
	self error: 'You cannot send #element to a line. Create an edge using #edgeFrom:to:'
]

{ #category : #'error handling' }
RTAbstractLine >> elementOn: v [
	self error: 'You cannot send #elementOn: to a line. Create an edge using #edgeFrom:to:'
]

{ #category : #'error handling' }
RTAbstractLine >> elementsOn: v [
	self error: 'You cannot send #elementsOn: to a line. Create an edge using #edgeFrom:to:'
]

{ #category : #'attach point' }
RTAbstractLine >> endingPointOf: anEdge [
	^ attachPoint endingPointOf: anEdge
]

{ #category : #initialization }
RTAbstractLine >> initialize [
	super initialize.
	attachPoint := RTCenteredAttachPoint new.
	self withSelfLoop.
	width := 1.
]

{ #category : #testing }
RTAbstractLine >> isSelfLoopAllowedFor: anEdge [
	^ anEdge from = anEdge to 
		ifTrue: [ allowSelfLoop ]
		ifFalse: [ true].
]

{ #category : #configuration }
RTAbstractLine >> noSelfLoop [
	allowSelfLoop := false.
]

{ #category : #'attach point' }
RTAbstractLine >> startingPointOf: anEdge [
	^ attachPoint startingPointOf: anEdge
]

{ #category : #rendering }
RTAbstractLine >> updateFor: edge trachelShape: trachelShape [
	self updateFromToFor: edge trachelShape: trachelShape.
	trachelShape color: (self colorFor: edge).
	trachelShape width: (self widthFor: edge).
	trachelShape resetPath
]

{ #category : #updating }
RTAbstractLine >> updateFromToFor: edge [
	self updateFromToFor: edge trachelShape: edge trachelShape
]

{ #category : #rendering }
RTAbstractLine >> updateFromToFor: edge trachelShape: trachelShape [
	trachelShape
		from: (attachPoint startingPointOf: edge)
		to: (attachPoint endingPointOf: edge)
]

{ #category : #public }
RTAbstractLine >> width: aBlockOrValue [
	"Set the width of the shape"
	self widthElement: [ :e | aBlockOrValue rtValue: e model ].

]

{ #category : #public }
RTAbstractLine >> widthElement: aBlockOrValue [
	"Set the width of the shape"
	width := aBlockOrValue
]

{ #category : #public }
RTAbstractLine >> widthFor: anElement [
	"Return the width for the provided element"
	^ width rtValue: anElement
]

{ #category : #'attach point' }
RTAbstractLine >> withBorderAttachPoint [
	| ap |
	ap := RTBorderAttachPoint new.
	self attachPoint: ap.
	^ ap
]

{ #category : #'attach point' }
RTAbstractLine >> withCenteredAttachPoint [
	| ap |
	ap := RTCenteredAttachPoint new.
	self attachPoint: ap.
	^ ap
]

{ #category : #'attach point' }
RTAbstractLine >> withContinuousCircleAttachPoint [
	self deprecated: 'Use #withBorderAttachPoint instead.'.
	^ self withBorderAttachPoint
]

{ #category : #'attach point' }
RTAbstractLine >> withContinuousRectangleAttachPoint [
	self deprecated: 'Use #withBorderAttachPoint instead.'.
	^ self withBorderAttachPoint
]

{ #category : #'attach point' }
RTAbstractLine >> withHorizontalAttachPoint [
	| ap |
	ap := RTHorizontalAttachPoint new.
	self attachPoint: ap.
	^ ap
]

{ #category : #public }
RTAbstractLine >> withOffsetIfMultiple [
	"Make the edge to shift in case several edges are starting from tne same element and ending to the same element. (I.e., multile edges)"
	self attachPoint: RTShorterDistanceWithOffsetAttachPoint new
]

{ #category : #configuration }
RTAbstractLine >> withSelfLoop [
	allowSelfLoop := true.
]

{ #category : #'attach point' }
RTAbstractLine >> withShorterDistanceAttachPoint [
	| ap |
	ap := RTBorderAttachPoint new.
	self attachPoint: ap.
	^ ap.
]

{ #category : #'attach point' }
RTAbstractLine >> withShorterDistanceAttachPointWithJump [
	| ap |
	ap := RTShorterDistanceAttachPoint new.
	self attachPoint: ap.
	^ ap.
]

{ #category : #'attach point' }
RTAbstractLine >> withShorterHorizontalAttachPoint [
	| ap |
	ap := RTShorterHorizontalDistanceAttachPoint new.
	self attachPoint: ap.
	^ ap
]

{ #category : #'attach point' }
RTAbstractLine >> withShorterVerticalAttachPoint [
	| ap |
	ap := RTShorterVerticalDistanceAttachPoint new.
	self attachPoint: ap.
	^ ap
]

{ #category : #'attach point' }
RTAbstractLine >> withVerticallAttachPoint [
	| ap |
	ap := RTVerticalAttachPoint new.
	self attachPoint: ap.
	^ ap
]
