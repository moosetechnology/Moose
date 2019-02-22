"
I add a grid background to a view.

Additionally any element having RTDraggableSnapToGrid will use my gridSize settings.

!! Example

see class-side
"
Class {
	#name : #RTGridView,
	#superclass : #RTAbstractInteractionView,
	#instVars : [
		'gridShape',
		'gridSize',
		'dashes',
		'color'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #initialization }
RTGridView class >> defaultColor [
	^ Color black alpha: 0.05
]

{ #category : #initialization }
RTGridView class >> defaultGridSize [
	^ 20
]

{ #category : #example }
RTGridView class >> example [
	| v es |
	v := RTView new.
	v @ RTDraggableView.
	v @ (RTGridView new gridSize: 20).
	v @ RTZoomableView.
	es := RTBox new
		color: Color green;
		size: 20;
		elementsOn: #(1 2).
	v addAll: es.
	es @ (RTDraggableSnapToGrid new gridSize: 40).
	es @ RTResizable.
	es first translateTo: 70 negated @ 90 negated.
	es second translateTo: 70 @ 110.
	^v
]

{ #category : #example }
RTGridView class >> example02 [
	| v es |
	v := RTView new.
	v @ RTDraggableView.
	v @ (RTGridView new dashes: #(1 19); gridSize: 20; color: Color black trans).
	v @ RTZoomableView.
	es := RTBox new
		color: Color green;
		size: 20;
		elementsOn: #(1 2).
	v addAll: es.
	es @ (RTDraggableSnapToGrid new gridSize: 40).
	es @ RTResizable.
	es first translateTo: 70 negated @ 90 negated.
	es second translateTo: 70 @ 110.
	^ v
]

{ #category : #adding }
RTGridView >> addCenterMarkerTo: aCanvas [
	aCanvas
		addShape:
			(TRSVGPath new
				strokePaint: (Color black alpha: 0.5);
				borderWidth: 1;
				path: 'M -5 0 H 5 M 0 -5 V 5')
]

{ #category : #adding }
RTGridView >> addGridShapeTo: aCanvas [
	gridShape := TRCanvasGridShape new.
	gridShape spacing: gridSize.
	gridShape dashes: self dashes.
	gridShape color: self color.
	aCanvas addShape: gridShape
]

{ #category : #accessing }
RTGridView >> color [
	^ color
]

{ #category : #accessing }
RTGridView >> color: colorOfTheGrid [
	color := colorOfTheGrid
]

{ #category : #accessing }
RTGridView >> dashes [
	"Return the dash pattern associated"
	^ dashes
]

{ #category : #accessing }
RTGridView >> dashes: integers [
	"Set the dash pattern for the line. Could be #(1 20) for example"
	dashes := integers
]

{ #category : #accessing }
RTGridView >> gridSize [
	^ gridSize
]

{ #category : #accessing }
RTGridView >> gridSize: aNumber [
	gridSize := aNumber
]

{ #category : #initialization }
RTGridView >> initialize [
	super initialize.
	self gridSize: self class defaultGridSize.
	self color: self class defaultColor
]

{ #category : #hooks }
RTGridView >> initializeElement: aView [
	aView attributeAt: self className put: self.
	self addGridShapeTo: aView canvas.
	self addCenterMarkerTo: aView canvas.
	self registerMovementEvents: aView canvas
]

{ #category : #hooks }
RTGridView >> registerMovementEvents: aCanvas [
	aCanvas camera
		addCallback:
			(TRTranslationCallback
				block: [ :shape :step | 
					gridShape addToOffset: step.
					gridShape signalUpdate ]).
	aCanvas when: TRMouseWheelEvent do: [ :e | gridShape resetPath ]
]
