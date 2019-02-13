"
A RTAbstractElasticBoxInteractionTest is a test class for testing the behavior of RTAbstractElasticBoxInteraction
"
Class {
	#name : #RTAbstractElasticBoxInteractionTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Tests'
}

{ #category : #tests }
RTAbstractElasticBoxInteractionTest >> testSelectableView [
	| view e position int |
	view := RTView new.
	e := RTBox element.
	view add: e.
	int := RTSelectableView new.
	position := view canvas camera fromSpaceToPixel: e position.
	view @ int.
	self assert: int group isEmpty.
	view announce: (TRMouseLeftDragStart new
		shape: view;
		position: position;
		canvas: view canvas ).
	view announce: (TRMouseDragging new
		shape: view;
		position: position + e extent;
		canvas: view canvas ).
	view announce: (TRMouseDragEnd new
		shape: view;
		position: position + e extent;
		canvas: view canvas ).
	self assert: int group size = 1.
]

{ #category : #'as yet unclassified' }
RTAbstractElasticBoxInteractionTest >> testZoomableBoxView [
	| view e position int |
	view := RTView new.
	e := RTBox element.
	view add: e.
	int := RTZoomableBoxView new.
	position := view canvas camera fromSpaceToPixel: e position.
	view @ int.
	self assert: view canvas camera scale equals: 1.0001.
	view announce: (TRMouseLeftDragStart new
		shape: view;
		position: position;
		canvas: view canvas ).
	view announce: (TRMouseDragging new
		shape: view;
		position: position + e extent;
		canvas: view canvas ).
	view announce: (TRMouseDragEnd new
		shape: view;
		position: position + e extent;
		canvas: view canvas ).
	self assert: view canvas camera scale > 1.0001.
]
