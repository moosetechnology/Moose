"
A RTSVGLine is represents the SVG line of a regular line, as defined in Roassal.
"
Class {
	#name : #RTSVGLine,
	#superclass : #RTSVGAbstractLine,
	#instVars : [
		'extent'
	],
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #adding }
RTSVGLine >> addOn: stream using: aSVGVisitor [
	
	self id: (aSVGVisitor nameFor: self element).
	self openDef: stream.
	self addPosition: stream.
	self startStyle: stream.
	self addStrokeColor: stream.
	self addStrokeOpacity: stream.
	self addStrokeWidth: stream.
	self closeTag: stream.
	self decoration ifNotNil: [ self addMarker: stream ].
	self startClass: stream.
	self closeTag: stream.
	self addExternalInteractions: aSVGVisitor.
	self closeDef: stream.
	
]

{ #category : #adding }
RTSVGLine >> addPosition: stream [
	stream
		nextPutAll:
				('x1="<1p>" y1="<2p>" ' expandMacrosWith: self position x rounded with: self position y rounded);
		nextPutAll:
				('x2="<1p>" y2="<2p>" ' expandMacrosWith: self extent x rounded with: self extent y rounded).
]

{ #category : #accessing }
RTSVGLine >> element: anElement from: aPoint to: anotherPoint width: anInteger color: aColor [
	self element: anElement.
	self position: aPoint.
	self extent: anotherPoint.
	self strokeWidth: anInteger.
	self strokeColor: aColor.
]

{ #category : #accessing }
RTSVGLine >> element: anElement from: aPoint to: anotherPoint width: anInteger color: aColor decoration: aLineDecoration [
	self element: anElement from: aPoint to: anotherPoint  width: anInteger color: aColor.
	self decoration: aLineDecoration 
]

{ #category : #accessing }
RTSVGLine >> extent [
	^ extent
]

{ #category : #accessing }
RTSVGLine >> extent: anObject [
	extent := anObject
]

{ #category : #initialization }
RTSVGLine >> initialize [
	self type: 'line'.
	self label: 'line'
]
