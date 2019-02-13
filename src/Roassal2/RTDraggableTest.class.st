"
A RTDraggableTest is a test class for testing the behavior of RTDraggable
"
Class {
	#name : #RTDraggableTest,
	#superclass : #RTTest,
	#instVars : [
		'v',
		'e1',
		'e2',
		'e3'
	],
	#category : #'Roassal2-Core-Tests'
}

{ #category : #running }
RTDraggableTest >> setUp [
	super setUp.
	v := RTView new.
	e1 := RTBox element.
	e2 := RTBox element.
	e3 := RTBox element.
	v add: e1; add: e2; add: e3
]

{ #category : #tests }
RTDraggableTest >> testDragAndDropOtherElement [

	e1 @ RTDraggable.
	e2 announce: (TRMouseDragging new step: 10 @ 15).
	self assert: e1 position = (0 @ 0).
	self assert: e2 position = (0 @ 0).
]

{ #category : #tests }
RTDraggableTest >> testGroupedDragAndDrop [

	e1 @ (RTDraggable groupToDrag: (Array with: e1 with: e2 with: e3)).
	e1 announce: (TRMouseDragging new step: 10 @ 15).
	self assert: (e1 position closeTo: (10 @ 15)).
	self assert: (e2 position closeTo: (10 @ 15)).
	self assert: (e3 position closeTo: (10 @ 15)).
]

{ #category : #tests }
RTDraggableTest >> testGroupedDragAndDrop2 [

	e2 translateBy: 5 @ 5.
	e3 translateBy: 10 @ 10.
	
	e1 @ (RTDraggable groupToDrag: (Array with: e1 with: e2 with: e3)).
	e1 announce: (TRMouseDragging new step: 10 @ 15).

	self assert: (e1 position closeTo: (10 @ 15)).
	self assert: (e2 position closeTo: (15 @ 20)).
	self assert: (e3 position closeTo: (20 @ 25)).
	
]

{ #category : #tests }
RTDraggableTest >> testGroupedDragAndDrop3 [

	e2 translateBy: 5 @ 5.
	e3 translateBy: 10 @ 10.
	
	e1 @ (RTDraggable groupToDrag: (Array with: e2 with: e3)).
	e1 announce: (TRMouseDragging new step: 10 @ 15).
	self assert: (e1 position closeTo: (10 @ 15)).
	self assert: (e2 position closeTo: (15 @ 20)).
	self assert: (e3 position closeTo: (20 @ 25)).

]

{ #category : #tests }
RTDraggableTest >> testGroupedDragAndDrop4 [
	
	e1 @ (RTDraggable groupToDrag: (Array with: e2 with: e3)).

	e2 translateBy: 5 @ 5.
	e3 translateBy: 10 @ 10.

	e1 announce: (TRMouseDragging new step: 10 @ 15).
	self assert: (e1 position closeTo: (10 @ 15)).
	self assert: (e2 position closeTo: (15 @ 20)).
	self assert: (e3 position closeTo: (20 @ 25))
]

{ #category : #tests }
RTDraggableTest >> testGroupedDragAndDrop5 [
	
	| oldPosition |
	oldPosition := e1 position.
	(RTGroup withAll: (Array with: e2 with: e3 with: e1)) @ (RTDraggable groupToDrag: (Array with: e1 with: e2 with: e3)).

	e2 translateBy: 5 @ 5.
	e3 translateBy: 10 @ 10.

	e2 announce: (TRMouseDragging new step: 5 @ 5).
	e3 announce: (TRMouseDragging new step: 10 @ 15).
	self assert: (e1 position closeTo: (oldPosition + (5 @ 5) + (10 @ 15)))
]

{ #category : #tests }
RTDraggableTest >> testNoDragAndDrop [

	e1 announce: (TRMouseDragging new step: 10 @ 15).
	self assert: e1 position = (0 @ 0)
		
]

{ #category : #tests }
RTDraggableTest >> testSimpleDragAndDrop [

	e1 @ RTDraggable.
	e1 announce: (TRMouseDragging new step: 10 @ 15).
	self assert: (e1 position closeTo: (10 @ 15))
		
]
