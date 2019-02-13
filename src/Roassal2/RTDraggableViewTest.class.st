Class {
	#name : #RTDraggableViewTest,
	#superclass : #RTTest,
	#instVars : [
		'view'
	],
	#category : #'Roassal2-Core-Tests'
}

{ #category : #running }
RTDraggableViewTest >> setUp [
	super setUp.
	view := RTView new.
	view add: (RTEllipse new width: 40; height: 20) element.
	
]

{ #category : #tests }
RTDraggableViewTest >> testDefault [
	self assert: view canvas camera position = (0 @ 0).
]

{ #category : #tests }
RTDraggableViewTest >> testDraggingModeLeft [
	view @ RTDraggableView left.
	view canvas announce: (TRMouseDragging step: 10 @ 5).
	self assert: (view canvas camera position closeTo: (0 @ 0)).
	
	view removeInteractionIfPresent: RTDraggableView.
	
	view @ RTDraggableView left.
	view canvas announce: (TRMouseDragStart new).
	view canvas announce: (TRMouseDragging step: 10 @ 5).
	view canvas announce: (TRMouseDragEnd new).
	self assert: (view canvas camera position closeTo: (0 @ 0)).
	
	view canvas announce: (TRMouseLeftDragStart new).
	view canvas announce: (TRMouseDragging step: 10 @ 5).
	view canvas announce: (TRMouseDragEnd new).
	self assert: (view canvas camera position closeTo: (-10 @ -5)).


]

{ #category : #tests }
RTDraggableViewTest >> testDraggingModeMiddle [
	view @ RTDraggableView middle.
	view canvas announce: (TRMouseDragging step: 10 @ 5).
	self assert: (view canvas camera position closeTo: (0 @ 0)).
	
	view removeInteractionIfPresent: RTDraggableView.
	
	view @ RTDraggableView middle.
	view canvas announce: (TRMouseDragStart new).
	view canvas announce: (TRMouseDragging step: 10 @ 5).
	view canvas announce: (TRMouseDragEnd new).
	self assert: (view canvas camera position closeTo: (0 @ 0)).
	
	view canvas announce: (TRMouseMiddleDragStart new).
	view canvas announce: (TRMouseDragging step: 10 @ 5).
	view canvas announce: (TRMouseDragEnd new).
	self assert: (view canvas camera position closeTo: (-10 @ -5)).


]

{ #category : #tests }
RTDraggableViewTest >> testDraggingModeRight [
	view @ RTDraggableView right.
	view canvas announce: (TRMouseDragging step: 10 @ 5).
	self assert: (view canvas camera position closeTo: (0 @ 0)).
	
	view removeInteractionIfPresent: RTDraggableView.
	
	view @ RTDraggableView right.
	view canvas announce: (TRMouseDragStart new).
	view canvas announce: (TRMouseDragging step: 10 @ 5).
	view canvas announce: (TRMouseDragEnd new).
	self assert: (view canvas camera position closeTo: (0 @ 0)).
	
	view canvas announce: (TRMouseRightDragStart new).
	view canvas announce: (TRMouseDragging step: 10 @ 5).
	view canvas announce: (TRMouseDragEnd new).
	self assert: (view canvas camera position closeTo: (-10 @ -5)).


]

{ #category : #tests }
RTDraggableViewTest >> testDraggingOnDraggable [
	view @ RTDraggableView.
	view canvas announce: (TRMouseDragStart new).
	view canvas announce: (TRMouseDragging step: 10 @ 5).
	view canvas announce: (TRMouseDragEnd new).
	self assert: (view canvas camera position closeTo: (-10 @ -5))
]

{ #category : #tests }
RTDraggableViewTest >> testDraggingOnNotDraggable [
	view canvas announce: (TRMouseDragging step: 10 @ 5).
	self assert: view canvas camera position = (0 @ 0)
]
