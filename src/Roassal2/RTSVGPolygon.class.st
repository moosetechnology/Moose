"
A RTSVGPolygon is represents the SVG Polygon of a regular polygon, as defined in Roassal.
"
Class {
	#name : #RTSVGPolygon,
	#superclass : #RTSVGEntity,
	#instVars : [
		'box',
		'points'
	],
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #adding }
RTSVGPolygon >> addOn: stream using: aSVGVisitor [
	aSVGVisitor names at: self element put: self id.
	self openDef: stream.
	self addPosition: stream.
	self addPoints: (self points) into: stream visitor: aSVGVisitor.
	self startStyle: stream.
	self addFillColor: stream.
	self addFillOpacity: stream.
	((self strokeWidth) > 0 and: (self strokeColor) ~= nil)
		ifTrue: [ 
			self addStrokeColor: stream.
			self addStrokeWidth: stream ].	
	self closeTag: stream.
	self startClass: stream.
	self closeTag: stream.
	self addExternalInteractions: aSVGVisitor.
	self closeDef: stream.
]

{ #category : #adding }
RTSVGPolygon >> addPoints: array into: stream visitor: visitor [
	| s |
	s := String new writeStream.
	array do: [ :p | s 
		nextPutAll: (visitor number: p x );
		nextPutAll: ',';
		nextPutAll: (visitor number: p y);
		nextPutAll: ' '. ].
	stream
		nextPutAll:
				('points="', s contents,'" ').
]

{ #category : #adding }
RTSVGPolygon >> addPosition: stream [
	stream
		nextPutAll:
				('x="<1p>" y="<2p>" ' expandMacrosWith: self box topLeft x rounded with: self box topLeft y rounded).
]

{ #category : #accessing }
RTSVGPolygon >> box [
	^ box
]

{ #category : #accessing }
RTSVGPolygon >> box: anObject [
	box := anObject
]

{ #category : #'as yet unclassified' }
RTSVGPolygon >> element: anElement box: aRectangle color: aColor borderWidth: anInteger borderColor: anotherColor [
	self element: anElement.
	self box: aRectangle.
	self fillColor: aColor.
	self strokeWidth:  anInteger.
	self strokeColor: anotherColor.
	self points: (self setPoints: anElement in: aRectangle).
]

{ #category : #initialization }
RTSVGPolygon >> initialize [
	self type: 'polygon'.
	self label: 'polygon'
]

{ #category : #accessing }
RTSVGPolygon >> points [
	^ points
]

{ #category : #accessing }
RTSVGPolygon >> points: anArrayOfPoints [
	points := anArrayOfPoints 
]

{ #category : #'as yet unclassified' }
RTSVGPolygon >> setPoints: anElement in: aRectangle [
	|  roundedPoints |
	roundedPoints := ((anElement copy translateTo: (aRectangle center)) vertices).
	roundedPoints := roundedPoints collect: [ :p | (p x rounded) @ (p y rounded)].
	^ roundedPoints
]
