"
I am a lightweight alternative to RTDraggable.

During dragging, instead of moving the original element I create a ""ghost double"" that is dragged instead, and only when the dragging is complete the original shape is moved.

I am useful if the original elements has many children or related elements that would have to be updated during each dragging step. With me only single update at the end occurs.

!! Example

RTInteractionExample new exampleGhostDraggable open
"
Class {
	#name : #RTGhostDraggable,
	#superclass : #RTAbstractDraggable,
	#instVars : [
		'ghost',
		'ghostBuilder'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #'announcement handling' }
RTGhostDraggable >> dragEnd: ann [
	ann element translateTo: ghost position.
	ghost remove.
	ghost := nil.
	ann element view signalUpdate
]

{ #category : #'announcement handling' }
RTGhostDraggable >> dragStart: ann [
	ghost := ghostBuilder
		width: ann element width;
		height: ann element height;
		elementOn: self.
	ghost translateTo: ann element position.
	ann element view add: ghost.
	ann element view signalUpdate
]

{ #category : #'announcement handling' }
RTGhostDraggable >> dragging: ann [
	| d |
	d := ann element view canvas camera distanceFromPixelToSpace: ann step.
	ghost translateBy: (self transformDistance: d forElement: ann element).
	self constraintIfNecessary: ghost.
	ghost signalUpdate
]

{ #category : #hooks }
RTGhostDraggable >> initialize [
	super initialize.
	self resetGhostBuilder
]

{ #category : #hooks }
RTGhostDraggable >> initializeElement: anElement [
	anElement announcer when: TRMouseDragStart send: #dragStart: to: self.
	anElement announcer when: TRMouseDragging send: #dragging: to: self.
	anElement announcer when: TRMouseDragEnd send: #dragEnd: to: self
]

{ #category : #'announcement handling' }
RTGhostDraggable >> resetGhostBuilder [
	(ghostBuilder := RTShapeBuilder new) rectangle
		color: (Color black alpha: 0.1);
		borderColor: (Color black alpha: 0.5)
]

{ #category : #hooks }
RTGhostDraggable >> transformDistance: distanceAsPoint forElement: anElement [
	"Nothing to be transformed since there is no restriction here"
	^ distanceAsPoint
]
