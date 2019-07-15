"
I am an interaction that makes a view rotable using the left button and draggable using the right mouse button.

Here is an example

[[[ 
	| b v |
	v := RTView new.
	v @ RTRotableView.
	b := RTMondrian new.
	b view: v.
	b nodes: (1 to: 300).
	b edges connectFrom: [ :value | value // 2 ].
	b layout cluster.
	b.			
]]]
"
Class {
	#name : #RTRotableView,
	#superclass : #RTAbstractInteractionView,
	#instVars : [
		'view',
		'draggingView',
		'elements',
		'center',
		'startPoint'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #accessing }
RTRotableView >> center [
	^ center
]

{ #category : #accessing }
RTRotableView >> center: anObject [
	center := anObject
]

{ #category : #'selection events' }
RTRotableView >> dragViewWithEvent: e [
	view canvas camera translateBy: e step negated / view canvas camera scale.
	e signalUpdate
]

{ #category : #accessing }
RTRotableView >> elements [
	"Return a block or a collection of Roassal elements"
	^ elements
]

{ #category : #accessing }
RTRotableView >> elements: elementsOrBlock [
	"Useful to specify which elements have to be rotated"
	elements := elementsOrBlock
]

{ #category : #initialization }
RTRotableView >> initialize [
	super initialize.
	elements := [ view elements ].
	center := 0 @ 0.
	startPoint := 0 @ 0.
]

{ #category : #hooks }
RTRotableView >> initializeElement: element [
	view := element.
	draggingView := false.
	view canvas when: TRMouseRightDragStart do: [ draggingView := true ].
	view canvas when: TRMouseLeftDragStart do: [ :e |
		draggingView := false.
		startPoint := (e positionFromCamera - center value). ].
	view canvas when: TRMouseDragging do: [ :e | 
		draggingView
			ifTrue: [ self dragViewWithEvent: e]
			ifFalse: [ self updateTargetElements: e ]  ].
	view canvas when: TRMouseDragEnd do: [ draggingView := false ].
	
]

{ #category : #action }
RTRotableView >> updateTargetElements: evt [
	| target c angle eangle p d evtPoint |
	target := elements value."A collection of elements"
	c := center value."a point"
	evtPoint := (evt positionFromCamera - c ).
	angle := startPoint theta - evtPoint theta.
	startPoint := evtPoint.

	target do: [ :e |
		d := c dist: e position .
		eangle := (e position - c) theta - angle.
		p := c + ((d * eangle cos) @ (d * eangle sin)).
		e translateTo: p.
		 ].
	view signalUpdate.
]
