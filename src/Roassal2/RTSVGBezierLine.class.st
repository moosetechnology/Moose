"
A RTSVGBezierLine is represents the SVG path of a bezier line, as defined in Roassal.
"
Class {
	#name : #RTSVGBezierLine,
	#superclass : #RTSVGAbstractLine,
	#instVars : [
		'points'
	],
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #adding }
RTSVGBezierLine >> addCurves: stream with: visitor [
	| p1 p2 |
	p1 := points first.
	stream
		nextPutAll: 'd="M';
		nextPutAll: (visitor number: p1 x);
		nextPutAll: ',';
		nextPutAll: (visitor number: p1 y).
	2 to: points size - 2 do: [ :i | 
		p1 := points at: i.
		p2 := (p1 + (points at: i + 1)) / 2.
		stream
			nextPutAll: 'Q';
			nextPutAll: (visitor number: p1 x);
			nextPutAll: ',';
			nextPutAll: (visitor number: p1 y);
			nextPutAll: ' ';
			nextPutAll: (visitor number: p2 x);
			nextPutAll: ',';
			nextPutAll: (visitor number: p2 y) ].
	p1 := points at: points size - 1.
	p2 := points last.
	stream
		nextPutAll: 'Q';
		nextPutAll: (visitor number: p1 x);
		nextPutAll: ',';
		nextPutAll: (visitor number: p1 y);
		nextPutAll: ' ';
		nextPutAll: (visitor number: p2 x);
		nextPutAll: ',';
		nextPutAll: (visitor number: p2 y);
		nextPutAll: '" '
]

{ #category : #adding }
RTSVGBezierLine >> addOn: stream using: aSVGVisitor [
	| from to shape el |
	shape := self element.
	el := shape element.
	from := aSVGVisitor names at: el from trachelShape.
	to := aSVGVisitor names at: el to trachelShape.
	self id: from , '_' , to.
	self openDef: stream.
	self addPath: stream with: aSVGVisitor.
	self startStyle: stream.
	self addFillColor: stream.
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
RTSVGBezierLine >> addPath: stream with: visitor [
	stream nextPutAll: 'name="bezier[]" '.
	self addCurves: stream with: visitor
]

{ #category : #accessing }
RTSVGBezierLine >> element: anElement points: somePoints width: anInteger color: aColor [
	self element: anElement.
	self points: somePoints.
	self strokeWidth: anInteger.
	self strokeColor: aColor.
]

{ #category : #accessing }
RTSVGBezierLine >> element: anElement points: somePoints width: anInteger color: aColor decoration: aLineDecoration [
	self element: anElement points: somePoints width: anInteger color: aColor.
	self decoration: aLineDecoration
]

{ #category : #initialization }
RTSVGBezierLine >> initialize [
	self type: 'path'.
	self label: 'bezier'
]

{ #category : #accessing }
RTSVGBezierLine >> points [
	^ points
]

{ #category : #accessing }
RTSVGBezierLine >> points: anObject [
	points := anObject
]
