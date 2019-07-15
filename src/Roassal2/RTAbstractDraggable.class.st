Class {
	#name : #RTAbstractDraggable,
	#superclass : #RTInteraction,
	#instVars : [
		'groupToDrag'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #hooks }
RTAbstractDraggable >> constraintIfNecessary: anElement [
	"Do nothing"
]

{ #category : #accessing }
RTAbstractDraggable >> groupToDrag [
	"Return the elements to drag and drop"
	^ groupToDrag
]

{ #category : #accessing }
RTAbstractDraggable >> groupToDrag: elements [
	"Set the elements to drag and drop. The variable groupToDrag is initialized with an empty array."
	groupToDrag := elements
]

{ #category : #initialization }
RTAbstractDraggable >> initialize [
	super initialize.
	groupToDrag := #()
]

{ #category : #hooks }
RTAbstractDraggable >> initializeElement: element [
	self assert: [ element class ~~ RTView ] description: 'Please use RTDraggableView instead'.
	element when: TRMouseDragging do: [ :e | 
		| d t |
		t := RTGroup withAll: groupToDrag.
		(t includes: element) ifFalse: [ t add: element ].
		d := element view canvas camera distanceFromPixelToSpace: e step.
		t translateBy: (self transformDistance: d forElement: element). 
		self constraintIfNecessary: element.
		e signalUpdate ]
]

{ #category : #hooks }
RTAbstractDraggable >> transformDistance: distanceAsPoint forElement: anElement [
	self subclassResponsibility
]
