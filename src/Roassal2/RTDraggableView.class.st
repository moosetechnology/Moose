"
I am an interaction that makes a view draggable using the mouse.

For example:
-=-=-=-=-=-=-=-=-=
	| v |
	v := RTView new.
	v @ RTDraggableView.
	RTCPDiverging new viewOn: v.
	^ v
-=-=-=-=-=-=-=-=-=
"
Class {
	#name : #RTDraggableView,
	#superclass : #RTAbstractInteractionView,
	#instVars : [
		'mouse'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #'instance creation' }
RTDraggableView class >> all [
	^ self new
]

{ #category : #'instance creation' }
RTDraggableView class >> left [
	^ self new left
]

{ #category : #'instance creation' }
RTDraggableView class >> middle [
	^ self new middle
]

{ #category : #'instance creation' }
RTDraggableView class >> right [
	^ self new right
]

{ #category : #'public - configuration' }
RTDraggableView >> all [
	"Any mouse button can be used to drag and drop the view"
	mouse := TRMouseDragStart.
]

{ #category : #initialization }
RTDraggableView >> initialize [
	super initialize.
	
	"Any button can be used to drag and drop"
	self all.
]

{ #category : #hooks }
RTDraggableView >> initializeElement: aView [
	"Configure the view provided as argument with call to properly handles the mouse interaction"
	| move |
	move := false.
	aView canvas when: self mouse do: [ move := true].
	aView canvas when: TRMouseDragging do: [ :e |
		move ifTrue: [ 
			aView canvas camera translateBy: e step negated / aView canvas camera scale.
			e signalUpdate ]
		].
	aView canvas when: TRMouseDragEnd do: [ move := false ].
	
]

{ #category : #'public - configuration' }
RTDraggableView >> left [
	"Only the left mouse button can be used to drag and drop the view
	For example:
	
	| v |
	v := RTView new.
	v @ RTDraggableView new left.
	RTCPDiverging new viewOn: v.
	^ v
	"
	mouse := TRMouseLeftDragStart
]

{ #category : #'public - configuration' }
RTDraggableView >> middle [
	"Only the middle mouse button can be used to drag and drop the view
	For example:
	
	| v |
	v := RTView new.
	v @ RTDraggableView new middle.
	RTCPDiverging new viewOn: v.
	^ v
	"
	mouse := TRMouseMiddleDragStart
]

{ #category : #accessing }
RTDraggableView >> mouse [
	"Return the class describing the mouse event for which the view can be dragged"
	^ mouse
]

{ #category : #'public - configuration' }
RTDraggableView >> right [
	"Only the right mouse button can be used to drag and drop the view
	For example:
	
	| v |
	v := RTView new.
	v @ RTDraggableView new right.
	RTCPDiverging new viewOn: v.
	^ v
	"
	mouse := TRMouseRightDragStart.
]
