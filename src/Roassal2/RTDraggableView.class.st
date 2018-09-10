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

{ #category : #accessing }
RTDraggableView >> all [
	mouse := TRMouseDragStart.
]

{ #category : #initialization }
RTDraggableView >> initialize [
	super initialize.
	self all.
]

{ #category : #hooks }
RTDraggableView >> initializeElement: aView [
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

{ #category : #accessing }
RTDraggableView >> left [
	mouse := TRMouseLeftDragStart
]

{ #category : #accessing }
RTDraggableView >> middle [
	mouse := TRMouseMiddleDragStart
]

{ #category : #accessing }
RTDraggableView >> mouse [
	^ mouse
]

{ #category : #accessing }
RTDraggableView >> right [
	mouse := TRMouseRightDragStart.
]
