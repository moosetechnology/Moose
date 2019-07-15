"
I am bridging RoassalModel and RTView
"
Class {
	#name : #MorphicRoassalAdapter,
	#superclass : #AbstractMorphicAdapter,
	#instVars : [
		'view',
		'canvas'
	],
	#category : #'Roassal2Spec-Core'
}

{ #category : #private }
MorphicRoassalAdapter >> adapt: aComposableModel [

	super adapt: aComposableModel.
	
	view := widget.
	canvas := view setUpCanvas.
	widget := canvas buildMorph.
	widget
		setProperty: #model toValue: self;
		hResizing: #spaceFill;
		vResizing: #spaceFill.
	
	self basicApplyScript
	
]

{ #category : #private }
MorphicRoassalAdapter >> applyScript [

	self freeCanvas.
	self basicApplyScript
]

{ #category : #private }
MorphicRoassalAdapter >> basicApplyScript [

	self model script 
		cull: view 
		cull: canvas.
		
	self widgetDo: [ :w | w startStepping ]
]

{ #category : #private }
MorphicRoassalAdapter >> buildWidget [
	self flag: 'Remove whenLastEventChangedDo:'.
	^ RTViewForSpec new
		whenLastEventChangedDo: self whenLastEventChangedBlock;
		yourself
]

{ #category : #private }
MorphicRoassalAdapter >> freeCanvas [

	view := self buildWidget.
	canvas := view setUpCanvas.
	widget extent: canvas extent.

	widget canvas: canvas.
]

{ #category : #protocol }
MorphicRoassalAdapter >> view [

	^ view
]

{ #category : #protocol }
MorphicRoassalAdapter >> whenLastEventChangedBlock [
	self flag: 'Remove me'.
	"^ [ :evt | self model lastEvent: evt ]"
	^ [ :evt | ]
]
