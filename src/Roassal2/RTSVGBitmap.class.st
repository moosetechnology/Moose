"
NOT WORKING, REFRAIN FROM USAGE
"
Class {
	#name : #RTSVGBitmap,
	#superclass : #RTSVGEntity,
	#instVars : [
		'form',
		'box'
	],
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #adding }
RTSVGBitmap >> addForm: stream [
	stream
		nextPutAll: ' xlink:href="data:image/png;base64,',form,'" '
	
]

{ #category : #adding }
RTSVGBitmap >> addOn: stream using: aSVGVisitor [
	aSVGVisitor names at: self element put: self id.
	self openDef: stream.
	self addPosition: stream.
	self addWidth: (self box width rounded) height: (self box height rounded) into: stream.
	self addForm: stream.
	self startClass: stream.
	self closeTag: stream.
	self addExternalInteractions: aSVGVisitor.
	self closeDef: stream.

]

{ #category : #adding }
RTSVGBitmap >> addPosition: stream [
	stream
		nextPutAll:
				('x="<1p>" y="<2p>" ' expandMacrosWith: self box topLeft x rounded with: self box topLeft y rounded).
]

{ #category : #accessing }
RTSVGBitmap >> box [
	^ box
]

{ #category : #accessing }
RTSVGBitmap >> box: anObject [
	box := anObject
]

{ #category : #accessing }
RTSVGBitmap >> element: anElement form: aForm box: aRectangle [
	self element: anElement.
	self form: aForm.
	self box. aRectangle.
]

{ #category : #accessing }
RTSVGBitmap >> form [
	^ form
]

{ #category : #accessing }
RTSVGBitmap >> form: anObject [
	form := anObject
]

{ #category : #initialization }
RTSVGBitmap >> initialize [
	self type: 'image'.
	self label: 'bitmap'
]
