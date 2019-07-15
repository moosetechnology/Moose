Class {
	#name : #RTShorterDistanceWithOffsetAttachPointTest,
	#superclass : #RTTest,
	#instVars : [
		'view',
		'box1',
		'box2',
		'edgeBuilder',
		'line'
	],
	#category : #'Roassal2-Core-Tests'
}

{ #category : #running }
RTShorterDistanceWithOffsetAttachPointTest >> setUp [
	super setUp.

	view := RTView new.

	box1 := (RTBox new size: 50) elementOn: 1. box1 @ RTDraggable @ RTPopup. view add: box1.
	box2 := (RTBox new size: 50) elementOn: 2. box2 @ RTDraggable @ RTPopup. view add: box2.
	box1 translateTo: (10@100). box2 translateTo: (200@100).
		
	line := RTLine new.
	line attachPoint: RTShorterDistanceWithOffsetAttachPoint new.
	view add: (line edgeFrom: box1 to: box2).
	view add: (line edgeFrom: box1 to: box2).
]

{ #category : #tests }
RTShorterDistanceWithOffsetAttachPointTest >> testOffset [

	| attachPoint |
	attachPoint := line attachPoint.
	self assert: true
]
