"
A RTSVGOval is the SVG Ellipse that translates from Roassal's Ellipse.
"
Class {
	#name : #RTSVGOval,
	#superclass : #RTSVGEntity,
	#instVars : [
		'box',
		'rx',
		'ry'
	],
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #adding }
RTSVGOval >> addOn: stream using: aSVGVisitor [
	aSVGVisitor names at: self element put: self id.
	self openDef: stream.
	self addPosition: stream.
	self addWidth: (self rx) height: (self ry) into: stream.
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
RTSVGOval >> addPosition: stream [
	stream
		nextPutAll:
				('cx="<1p>" cy="<2p>" ' expandMacrosWith: self box center x rounded with: self box center y rounded).
]

{ #category : #adding }
RTSVGOval >> addWidth: x height: y into: stream [
	stream
		nextPutAll:
				('rx="<1p>" ry="<2p>" ' expandMacrosWith: x with: y).
]

{ #category : #accessing }
RTSVGOval >> box [
	^ box
]

{ #category : #accessing }
RTSVGOval >> box: anObject [
	box := anObject
]

{ #category : #accessing }
RTSVGOval >> element: anElement box:aRectangle color: aColor borderWidth: anInteger borderColor: anotherColor [
	self element: anElement; box: aRectangle; fillColor: aColor; strokeColor: anotherColor; strokeWidth: anInteger
]

{ #category : #initialization }
RTSVGOval >> initialize [
	self type: 'ellipse'.
	self label: 'ellipse'
]

{ #category : #accessing }
RTSVGOval >> rx [
	rx ifNil: [ rx := (box width /2) rounded ].
	^ rx
]

{ #category : #accessing }
RTSVGOval >> rx: anObject [
	rx := anObject
]

{ #category : #accessing }
RTSVGOval >> ry [
	ry ifNil: [ ry := (box height /2) rounded ].
	^ ry
]

{ #category : #accessing }
RTSVGOval >> ry: anObject [
	ry := anObject
]
