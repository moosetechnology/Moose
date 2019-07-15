"
A RTSVGPathEntity is SVG path that translates from a generic SVG path, as represented in Roassal.
"
Class {
	#name : #RTSVGPathEntity,
	#superclass : #RTSVGEntity,
	#instVars : [
		'path',
		'center',
		'scale'
	],
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #adding }
RTSVGPathEntity >> addOn: stream using: aSVGVisitor [
	aSVGVisitor names at: self element put: self id.
	
	self openDef: stream.
	self addPath: stream.
	self startStyle: stream.
	self addFillColor: stream.
	self addFillOpacity: stream.
	self addStrokeColor: stream.
	self addStrokeWidth: stream.
	self closeTag: stream.
	self startTransform: stream.
	self addTranslation: self center into: stream.
	self addScale: self scale into: stream. 
	self closeTag: stream.
	self startClass: stream.
	self addContainedInteractions: aSVGVisitor.
	self closeTag: stream.
	self addExternalInteractions: aSVGVisitor.
	self closeDef: stream.

]

{ #category : #adding }
RTSVGPathEntity >> addPath: stream [
	stream nextPutAll: 'd="' , self path , '" '
]

{ #category : #accessing }
RTSVGPathEntity >> center [
	^ center
]

{ #category : #accessing }
RTSVGPathEntity >> center: anObject [
	center := anObject
]

{ #category : #accessing }
RTSVGPathEntity >> element: anElement path: aPath center: aPoint scale: anInteger fillColor: aColor borderColor: anotherColor width: anotherInteger [ 
	self element: anElement.
	self path: aPath.
	self center: aPoint.
	self scale: anInteger.
	self fillColor: aColor.
	self strokeColor: anotherColor.
	self strokeWidth: anotherInteger
]

{ #category : #initialization }
RTSVGPathEntity >> initialize [
	self type: 'path'.
	self label: 'p'
]

{ #category : #accessing }
RTSVGPathEntity >> path [
	^ path
]

{ #category : #accessing }
RTSVGPathEntity >> path: anObject [
	path := anObject
]

{ #category : #accessing }
RTSVGPathEntity >> scale [
	^ scale
]

{ #category : #accessing }
RTSVGPathEntity >> scale: anObject [
	scale := anObject
]
