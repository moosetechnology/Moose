"
A RTSVGAbstractMarker represents the SVG marker, set on a Line.



"
Class {
	#name : #RTSVGAbstractMarker,
	#superclass : #RTSVGEntity,
	#instVars : [
		'xExtent',
		'yExtent',
		'size'
	],
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #adding }
RTSVGAbstractMarker >> addMarkerOptions: stream [
	self addViewBox: stream.
	self addRefPosition: stream.
	self addSize: stream.
	self addOrientation: stream
]

{ #category : #adding }
RTSVGAbstractMarker >> addOn: stream using: aSVGVisitor [
	self openDef: stream.
	self addMarkerOptions: stream.
	self closeDefWithContent: stream.
	self openInnerDef: stream.
	self addPath: stream.
	self startStyle: stream.
	self addFillColor: stream.
	self addStrokeColor: stream.
	self addStrokeWidth: stream.
	self closeTag: stream.
	self closeDef: stream.
	self closeFullDef: stream.
]

{ #category : #adding }
RTSVGAbstractMarker >> addOrientation: stream [
	stream nextPutAll: 'orient = "auto"' , String cr
]

{ #category : #adding }
RTSVGAbstractMarker >> addPath: stream [
	self subclassResponsibility 
]

{ #category : #adding }
RTSVGAbstractMarker >> addRefPosition: stream [
	stream nextPutAll: ('refX = "<1p>" refY = "<2p>" ' expandMacrosWith: self xExtent with: (self yExtent / 2) rounded)
]

{ #category : #adding }
RTSVGAbstractMarker >> addSize: stream [
	stream nextPutAll: ('markerWidth = "<1p>" markerHeight = "<1p>" ' expandMacrosWith: size)
]

{ #category : #adding }
RTSVGAbstractMarker >> addViewBox: stream [
	stream nextPutAll: ('viewBox = "0 0 <1p> <2p>" ' expandMacrosWith: self xExtent with: self yExtent)
]

{ #category : #accessing }
RTSVGAbstractMarker >> id [
	^ id
]

{ #category : #accessing }
RTSVGAbstractMarker >> id: aid fillColor: aColor borderColor: anotherColor width: aNumber size: anotherNumber [
	self id: aid.
	self fillColor: aColor.
	self strokeColor: anotherColor.
	self strokeWidth: aNumber.
	self size: anotherNumber
]

{ #category : #initialization }
RTSVGAbstractMarker >> initialize [
	self type: 'marker'.
	self label: 'marker'.
	xExtent := 10.
	yExtent := 10.
]

{ #category : #adding }
RTSVGAbstractMarker >> openInnerDef: stream [
	stream nextPutAll: '<path '
]

{ #category : #accessing }
RTSVGAbstractMarker >> size: anObject [
	size := anObject
]

{ #category : #accessing }
RTSVGAbstractMarker >> xExtent [
	^ xExtent
]

{ #category : #accessing }
RTSVGAbstractMarker >> xExtent: anObject [
	xExtent := anObject
]

{ #category : #accessing }
RTSVGAbstractMarker >> yExtent [
	^ yExtent
]

{ #category : #accessing }
RTSVGAbstractMarker >> yExtent: anObject [
	yExtent := anObject
]
