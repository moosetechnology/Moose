Class {
	#name : #RTRTShorterDistanceAttachPointTest,
	#superclass : #RTTest,
	#instVars : [
		'e1',
		'e2',
		'lineShape',
		'edge',
		'view'
	],
	#category : #'Roassal2-AttachPoint-Tests'
}

{ #category : #running }
RTRTShorterDistanceAttachPointTest >> setUp [
	super setUp.
	view := RTView new.
	e1 := RTBox new extent: 70 @ 30; element.
	e2 := RTBox new extent: 70 @ 30; element.
	lineShape := RTLine new.
	lineShape color: Color blue.
	lineShape attachPoint: RTShorterDistanceAttachPoint new.
	edge := lineShape edgeFrom: e1 to: e2.
	view add: e1; add: e2; add: edge.
	e2 @ RTDraggable.
	e1 @ RTDraggable.

]

{ #category : #tests }
RTRTShorterDistanceAttachPointTest >> testHorizontalTwoElements [
	e2 translateBy: 90 @ 0.
	
	self assert: (lineShape startingPointOf: edge) equals: 35 @ 0.
	self assert: (lineShape endingPointOf: edge) equals: 55 @ 0.
]

{ #category : #tests }
RTRTShorterDistanceAttachPointTest >> testVerticalTwoElements [
	e2 translateBy: 0 @ 50.
		
	self assert: (lineShape startingPointOf: edge) equals: 0 @ 15.
	self assert: (lineShape endingPointOf: edge) equals: 0 @ 35.
]
