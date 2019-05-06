Class {
	#name : #RTAttachPointTest,
	#superclass : #RTTest,
	#instVars : [
		'view',
		'el1',
		'el2',
		'edge',
		'shape'
	],
	#category : #'Roassal2-Core-Tests'
}

{ #category : #running }
RTAttachPointTest >> setUp [
	super setUp.
	view := RTView new.
	el1 := RTBox new size: 30; elementOn: 1.
	el2 := RTBox new size: 30; elementOn: 2.
	el1 @ RTDraggable.
	el2 @ RTDraggable.
	
	edge := RTEdge from: el1 to: el2.
	view addAll: (Array with: el1 with: el2 with: edge).
	shape := RTLine new.
	edge + shape.
	RTHorizontalLineLayout on: (Array with: el1 with: el2)

]

{ #category : #tests }
RTAttachPointTest >> testContinuousCircleAttachPoint [
	shape withBorderAttachPoint.
	self 
		assert: (shape startingPointOf: edge) 
		equals: (el1 encompassingRectangle topRight 
					+ (0 @ (el1 encompassingRectangle extent y / 2)) asIntegerPoint).
	self 
		assert: ((shape endingPointOf: edge) 
					closeTo: (el2 encompassingRectangle topLeft 
					+ (0 @ (el2 encompassingRectangle extent y / 2)) asIntegerPoint)).
]

{ #category : #tests }
RTAttachPointTest >> testContinuousRectangleAttachPoint [
	shape withBorderAttachPoint.
	self 
		assert: (shape startingPointOf: edge) 
		equals: (el1 encompassingRectangle topRight 
					+ (0 @ (el1 encompassingRectangle extent y / 2)) asIntegerPoint).
	self 
		assert: (shape endingPointOf: edge) 
		equals: (el2 encompassingRectangle topLeft 
					+ (0 @ (el2 encompassingRectangle extent y / 2)) asIntegerPoint).
]

{ #category : #tests }
RTAttachPointTest >> testDual [
	view := RTView new.
	el1 := RTBox element.
	el2 := RTBox element.
	edge := RTLine edgeFrom: el1 to: el2.
	view add: el1.
	view add: el2.
	view add: edge.
	RTDualAttachPoint  on: view elements attachFrom: RTBorderAttachPoint instance.
	self assert: edge shape attachPoint class equals: RTDualAttachPoint 

]

{ #category : #tests }
RTAttachPointTest >> testHorizontalAttachPoint [
	shape withHorizontalAttachPoint.
	self 
		assert: (shape startingPointOf: edge) 
		equals: (el1 encompassingRectangle topRight 
					+ (0 @ (el1 encompassingRectangle extent y / 2)) asIntegerPoint).
	self 
		assert: (shape endingPointOf: edge) 
		equals: (el2 encompassingRectangle topLeft 
					+ (0 @ (el2 encompassingRectangle extent y / 2)) asIntegerPoint).
]

{ #category : #tests }
RTAttachPointTest >> testOn [
	view := RTView new.
	el1 := RTBox element.
	el2 := RTBox element.
	edge := RTLine edgeFrom: el1 to: el2.
	view add: el1.
	view add: el2.
	view add: edge.
	RTBorderAttachPoint on: view elements.
	self assert: edge shape attachPoint class equals: RTBorderAttachPoint

]

{ #category : #tests }
RTAttachPointTest >> testOnThenDo [
	view := RTView new.
	el1 := RTBox element.
	el2 := RTBox element.
	edge := RTLine edgeFrom: el1 to: el2.
	view add: el1.
	view add: el2.
	view add: edge.
	RTBorderAttachPoint on: view elements thenDo: [ :ap |
		ap offset: 20 ].
	view
]

{ #category : #tests }
RTAttachPointTest >> testShorterDistancePoint1 [
	shape withShorterDistanceAttachPoint.
	"el1 and el2 are on the same horizontal line. el1 is on the left of el2"
	self 
		assert: (shape startingPointOf: edge) 
		equals: (el1 encompassingRectangle topRight 
					+ (0 @ (el1 encompassingRectangle extent y / 2))) asIntegerPoint.
	self 
		assert: ((shape endingPointOf: edge) 
					closeTo: (el2 encompassingRectangle topLeft 
						+ (0 @ (el2 encompassingRectangle extent y / 2)))).
]

{ #category : #tests }
RTAttachPointTest >> testShorterDistancePoint2 [
	| p |
	shape withShorterDistanceAttachPoint.
	"el1 and el2 are on the same horizontal line. el2 is on the left of el1"
	p := el1 position.
	el1 translateTo: el2 position.
	el2 translateTo: p.
	self 
		assert: ((shape startingPointOf: edge) 
					closeTo: (el1 encompassingRectangle topLeft 
					+ (0 @ (el1 encompassingRectangle extent y / 2)))).
	self 
		assert: ((shape endingPointOf: edge) 
					closeTo: (el2 encompassingRectangle topRight 
					+ (0 @ (el2 encompassingRectangle extent y / 2)))).
]

{ #category : #tests }
RTAttachPointTest >> testShorterDistancePoint3 [
	| p |
	shape withShorterDistanceAttachPoint.
	"el1 and el2 are on the same horizontal line. el2 is on the left of el1"
	p := el1 position.
	el1 translateBy: 0 @ 80.
	el2 translateTo: p.
	self 
		assert: ((shape startingPointOf: edge) 
					closeTo: (el1 encompassingRectangle topLeft 
					+ ((el1 encompassingRectangle width / 2) @ 0))).
	self 
		assert: ((shape endingPointOf: edge) 
					closeTo: (el2 encompassingRectangle topLeft 
					+ ((el2 encompassingRectangle width / 2) 
							@ el2 encompassingRectangle width))).
]

{ #category : #tests }
RTAttachPointTest >> testVerticalAttachPoint [
	shape withVerticallAttachPoint.
	self 
		assert: (shape startingPointOf: edge) 
		equals: (el1 encompassingRectangle bottomLeft 
					+ ((el1 encompassingRectangle extent x / 2) @ 0)) asIntegerPoint.
	self 
		assert: (shape endingPointOf: edge) 
		equals: (el2 encompassingRectangle topLeft 
					+ ((el2 encompassingRectangle extent x / 2) @ 0)) asIntegerPoint.
]
