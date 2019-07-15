"
I am an interaction which allows the element to be dragged in a steps of fixed size equivalent to the size of the grid.

If the view has RTGridView interaction, then I will use it's spacing instead.

Here is an example:
[[[
v := RTView new.

s := RTBox new size: 25; color: (Color blue alpha: 0.3).
es := s elementsOn: (1 to: 10).
v addAll: es.
RTGridLayout on: es.

es @ RTDraggableSnapToGrid.

v
]]]


When embedded within the RTInteractionBuilder (and thus by Mondrian):
[[[
b := RTMondrian new.

b interaction snapToGrid gridSize: 10.
b shape rectangle size: 25. 
b shape color: Color transparent.
b shape borderColor: Color black.
b nodes: (1 to: 9).
b layout grid.
b
]]]
"
Class {
	#name : #RTDraggableSnapToGrid,
	#superclass : #RTAbstractDraggable,
	#instVars : [
		'gridSize',
		'strategy'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #'instance creation' }
RTDraggableSnapToGrid class >> center [
	^ self new
		center;
		yourself
]

{ #category : #accessing }
RTDraggableSnapToGrid >> center [
	strategy := #center
]

{ #category : #initialization }
RTDraggableSnapToGrid >> defaultGridSize [
	^ 10
]

{ #category : #accessing }
RTDraggableSnapToGrid >> gridSize [
	^ gridSize
]

{ #category : #accessing }
RTDraggableSnapToGrid >> gridSize: anInteger [
	"Default value is given by defaultGridSize. Could be 10 for example"
	gridSize := anInteger
]

{ #category : #accessing }
RTDraggableSnapToGrid >> gridSizeFor: anElement [
	anElement view
		ifNotNil:
			[ :v | 
			(v hasAttribute: #RTGridView)
				ifTrue: [ ^ (v attributeAt: #RTGridView) gridSize ] ].
	^ gridSize
]

{ #category : #initialization }
RTDraggableSnapToGrid >> initialize [
	super initialize.
	gridSize := self defaultGridSize.
	strategy := #topLeft
]

{ #category : #hooks }
RTDraggableSnapToGrid >> initializeElement: element [
	strategy = #topLeft
		ifTrue: [ ^ self initializeElementForTopLeft: element ].
	strategy = #center
		ifTrue: [ ^ self initializeElementForCenter: element ]
]

{ #category : #hooks }
RTDraggableSnapToGrid >> initializeElementForCenter: element [
	| totalD spacing|
	totalD := 0 @ 0.
	element when: TRMouseDragStart do: [ :event | totalD := 0 @ 0 ].
	spacing := self gridSizeFor: element.
	element
		when: TRMouseDragging
		do:
			[ :event | 
			| d t |
			t := RTGroup withAll: groupToDrag.
			(t includes: element)
				ifFalse: [ t add: element ].
			d := element encompassingRectangle center.
			d := d + (element view canvas camera distanceFromPixelToSpace: event step).
			totalD := totalD + d.
			d := spacing * ((totalD x / spacing) rounded @ (totalD y / spacing) rounded).
			totalD := totalD - d.
			d := d - element encompassingRectangle center.
			t translateBy: d.
			event signalUpdate ]
]

{ #category : #hooks }
RTDraggableSnapToGrid >> initializeElementForTopLeft: element [
	| totalD spacing|
	totalD := 0 @ 0.
	element when: TRMouseDragStart do: [ :event | totalD := 0 @ 0 ].
	spacing := self gridSizeFor: element.
	element
		when: TRMouseDragging
		do:
			[ :event | 
			| d t |
			t := RTGroup withAll: groupToDrag.
			(t includes: element)
				ifFalse: [ t add: element ].
			d := element encompassingRectangle topLeft.
			d := d + (element view canvas camera distanceFromPixelToSpace: event step).
			totalD := totalD + d.
			d := spacing * ((totalD x / spacing) rounded @ (totalD y / spacing) rounded).
			totalD := totalD - d.
			d := d - element encompassingRectangle topLeft.
			t translateBy: d.
			event signalUpdate ]
]

{ #category : #accessing }
RTDraggableSnapToGrid >> topLeft [
	strategy := #topLeft
]
