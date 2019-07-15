"
I am a simple selection Box interaction to  create elastic boxs that allow to explore the edges from a view

Here is an example:

b := RTMondrian new.
b nodes: RTObject withAllSubclasses.
b edges moveBehind; connectToAll: #dependentClasses.
b layout grid.
b build.
b view @ RTSelectionBox.
b view


Another:

b := RTMondrian new.
b nodes: (1 to: 1000).
b edges connectFrom: [ :v | v // 2 ].
b layout grid.
b build.
b view @ RTSelectionBox.
b view
"
Class {
	#name : #RTSelectionBox,
	#superclass : #RTInteraction,
	#instVars : [
		'aView',
		'edges',
		'lastClick'
	],
	#category : #'Roassal2-Experimental'
}

{ #category : #public }
RTSelectionBox >> addBox [
	^ self addBox: Color random
]

{ #category : #public }
RTSelectionBox >> addBox: aColor [
	| box |
	box := RTClipBox new
			size: 100;
			borderColor: aColor;
			borderWidth: 1;
			color: Color transparent;
			element.
	lastClick isNil ifFalse: [ 
		box translateTo: lastClick position ].
	aView add: box.
	box trachelShape edges: edges.
	box @ RTDraggable.
	box @ RTResizable.
	aView signalUpdate.
	^ box
]

{ #category : #hooks }
RTSelectionBox >> initializeElement: view [
	| actions |
	aView := view.
	edges := aView edges.
	edges do: #remove.
	actions := Array 
		with: 'Add box from and to'-> [ self addBox trachelShape condition: [ :rec :ed| 
			(rec containsPoint: ed from position) and: [ rec containsPoint: ed to position ] ] ]
		with: 'Add box from'->[ self addBox trachelShape condition: [ :rec :ed |
			rec containsPoint: ed from position ] ]
		with: 'Add box to'->[ self addBox trachelShape condition: [ :rec :ed |
			rec containsPoint: ed to position ] ]
		with: 'Add box (from or to)'-> [ self addBox trachelShape condition: [ :rec :ed |
			(rec containsPoint: ed from position) or: [ rec containsPoint: ed to position ]] ].
	aView when: TRMouseRightClick do: [ :evt |
		lastClick := evt.
		TRUtil instance widgetFactory menuForAssociations: actions on: aView ].
		
]
