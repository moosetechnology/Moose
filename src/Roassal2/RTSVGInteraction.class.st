"
A RTSVGInteraction represents ay interaction present on a SVG export. It translates itself as javascript functions applied to SVG elements using its ""id"" or ""class"" attributes as anchor.

The type field represents both the interaction type and how it will be translated to javascript, it is used to set the actual interactions to exactly the right elements.

The target refers to the Roassal elements (as members of a class) affected by this interaction.

Both contained and external are booleans used to determine where to insert the code in javascript. This position WIDELY varies, depending on the intended interaction.
"
Class {
	#name : #RTSVGInteraction,
	#superclass : #RTObject,
	#instVars : [
		'type',
		'target',
		'contained',
		'external'
	],
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #'as yet unclassified' }
RTSVGInteraction class >> on: anExporter targets: aRTShape [
	| generator |
	generator := [ :e |  self new target: e;  yourself ].
	self on: anExporter targets: aRTShape generator: generator
]

{ #category : #'as yet unclassified' }
RTSVGInteraction class >> on: anExporter targets: aRTShape generator: generator [
	| interaction |
	anExporter view elements
		do: [ :e | 
			e trachelShape class = aRTShape
				ifTrue: [ 
					interaction := generator value: e.
					anExporter interactions at: e ifAbsent: [ anExporter interactions at: e put: OrderedCollection new ].
					(anExporter interactions at: e) add: interaction ] ]
]

{ #category : #adding }
RTSVGInteraction >> addEventHandlers: aStream id: aString element: aRTElement center: aPoint [
	self subclassResponsibility 
]

{ #category : #adding }
RTSVGInteraction >> addFunctions: aStream [
	self subclassResponsibility
]

{ #category : #adding }
RTSVGInteraction >> addGlobalHandlers: aStream [
	self subclassResponsibility
]

{ #category : #accessing }
RTSVGInteraction >> contained [
	^contained
]

{ #category : #accessing }
RTSVGInteraction >> external [
	^external
]

{ #category : #initialization }
RTSVGInteraction >> initialize [
	super initialize.
	self type: 'interaction'
]

{ #category : #accessing }
RTSVGInteraction >> target [
	^ target
]

{ #category : #accessing }
RTSVGInteraction >> target: anObject [
	target := anObject
]

{ #category : #adding }
RTSVGInteraction >> targetColorAttribute [
	self target trachelShape class = TRArcShape ifTrue: [ ^'fill' ].
	self target trachelShape class = TRBezierShape ifTrue: [ ^'stroke' ].
	self target trachelShape class = TRBoxShape ifTrue: [ ^'fill' ].
	self target trachelShape class = TREllipseShape ifTrue: [ ^'fill' ].
	self target trachelShape class = TRLabelShape ifTrue: [ ^'fill' ].
	self target trachelShape class = TRLineShape ifTrue: [ ^'stroke' ].
	self target trachelShape class = TRRotatedLabelShape ifTrue: [ ^'fill' ].
	self target trachelShape class = TRSVGPath ifTrue: [ ^'fill' ].
	self error: 'Should not be here'
]

{ #category : #adding }
RTSVGInteraction >> targetNameAttribute [
	self target trachelShape class = TRArcShape ifTrue: [ ^'arc' ].
	self target trachelShape class = TRBezierShape ifTrue: [ ^'bezier' ].
	self target trachelShape class = TRBoxShape ifTrue: [ ^'rect' ].
	self target trachelShape class = TREllipseShape ifTrue: [ ^'ellipse' ].
	self target trachelShape class = TRLabelShape ifTrue: [ ^'text' ].
	self target trachelShape class = TRLineShape ifTrue: [ ^'line' ].
	self target trachelShape class = TRRotatedLabelShape ifTrue: [ ^'text' ].
	self target trachelShape class = TRSVGPath ifTrue: [ ^'p' ].
]

{ #category : #accessing }
RTSVGInteraction >> type [
	^ type
]

{ #category : #accessing }
RTSVGInteraction >> type: anObject [
	type := anObject
]
