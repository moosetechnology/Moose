"
A RTSVGArc is represents the SVG path for a radial arc, as in Roassal.

"
Class {
	#name : #RTSVGArc,
	#superclass : #RTSVGEntity,
	#instVars : [
		'center',
		'innerRadius',
		'outterRadius',
		'alphaAngle',
		'betaAngle'
	],
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #adding }
RTSVGArc >> addOn: stream using: aSVGVisitor [
	aSVGVisitor names at: self element put: self id.
	self openDef: stream.
	self addPath: stream.
	self startStyle: stream.
	self addFillColor: stream.
	self closeTag: stream.
	self startClass: stream.
	self closeTag: stream.
	self addExternalInteractions: aSVGVisitor.
	self closeDef: stream.
	
	
]

{ #category : #adding }
RTSVGArc >> addPath: stream [
	| aAngle bAngle xAngle i e xcos xsin acos asin bcos bsin c b|
	aAngle := self alphaAngle degreesToRadians.
	bAngle := self betaAngle degreesToRadians.
	i := self innerRadius.
	e := self outterRadius.
	xAngle := (aAngle + bAngle) /2.
	xcos := xAngle cos.
	xsin := xAngle sin negated.
	acos := aAngle cos.
	asin := aAngle sin negated.
	bcos := bAngle cos.
	bsin := bAngle sin negated.
	
	c := self center.
	b := [ :a | a asFloat asString ].
	stream
		nextPutAll: 'd="M ',(b value: i*acos+c x),' ',(b value: i*asin + c y);
		nextPutAll: ' L ',(b value: e*acos+c x),' ',(b value: e*asin+c y);
		nextPutAll: ' A ',(b value: e),' ',(b value: e), ' 0 0 0 ', (b value: e*xcos+c x),' ',(b value: e*xsin+c y);
		nextPutAll: ' A ',(b value: e),' ',(b value: e), ' 0 0 0 ', (b value: e*bcos+c x),' ',(b value: e*bsin+c y);
		nextPutAll: ' L ',(b value: i * bcos+c x),' ',(b value: i*bsin + c y);
		nextPutAll: ' A ',(b value: i),' ',(b value: i), ' 0 0 1 ', (b value: i*xcos+c x),' ',(b value: i*xsin+c y);
		nextPutAll: ' A ',(b value: i+c x),' ',(b value: i+c y), ' 0 0 1 ', (b value: i*acos+c x),' ',(b value: i*asin+c y);
		nextPutAll: ' Z" '.
]

{ #category : #accessing }
RTSVGArc >> alphaAngle [
	^ alphaAngle
]

{ #category : #accessing }
RTSVGArc >> alphaAngle: anObject [
	alphaAngle := anObject
]

{ #category : #accessing }
RTSVGArc >> betaAngle [
	^ betaAngle
]

{ #category : #accessing }
RTSVGArc >> betaAngle: anObject [
	betaAngle := anObject
]

{ #category : #accessing }
RTSVGArc >> center [
	^ center
]

{ #category : #accessing }
RTSVGArc >> center: anObject [
	center := anObject
]

{ #category : #accessing }
RTSVGArc >> element: anElement center: aPoint r1: iRadius r2: oRadius aAngle: aAngle bAngle: bAngle color: aColor [
	self element: anElement.
	self center: aPoint.
	self innerRadius: iRadius.
	self outterRadius: oRadius.
	self alphaAngle: aAngle.
	self betaAngle: bAngle.
	self fillColor: aColor.
]

{ #category : #utils }
RTSVGArc >> getPointFrom: aCenter angle: anAngle radius: aNumber [
	|x y|
	x := (aCenter x + (anAngle cos * aNumber)) rounded.
	y := (aCenter y + (anAngle sin * aNumber)) rounded.
	^  x@y
]

{ #category : #initialization }
RTSVGArc >> initialize [
	self type: 'path'.
	self label: 'arc'
]

{ #category : #accessing }
RTSVGArc >> innerRadius [
	^ innerRadius
]

{ #category : #accessing }
RTSVGArc >> innerRadius: anObject [
	innerRadius := anObject
]

{ #category : #utils }
RTSVGArc >> makePositive: anAngle [
	| result |
	anAngle < 0
		ifTrue: [ result := anAngle + 360 ]
		ifFalse: [ result := anAngle ].
	^ result
]

{ #category : #accessing }
RTSVGArc >> outterRadius [
	^ outterRadius
]

{ #category : #accessing }
RTSVGArc >> outterRadius: anObject [
	outterRadius := anObject
]

{ #category : #utils }
RTSVGArc >> toRadian: anAngle [
	| result |
	result := Float pi * anAngle / 180.
	^ result
]
