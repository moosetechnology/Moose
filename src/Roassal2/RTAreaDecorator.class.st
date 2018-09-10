Class {
	#name : #RTAreaDecorator,
	#superclass : #RTAbstractGrapherDecorator,
	#instVars : [
		'color',
		'points'
	],
	#category : #'Roassal2-Builder-Grapher-Decorators'
}

{ #category : #accessing }
RTAreaDecorator >> color [
	^ color
]

{ #category : #accessing }
RTAreaDecorator >> color: c [
	color := c
]

{ #category : #initialization }
RTAreaDecorator >> initialize [
	super initialize.
	self color: Color gray trans.
]

{ #category : #accessing }
RTAreaDecorator >> points [
	^ points
]

{ #category : #accessing }
RTAreaDecorator >> points: pts [
	points := pts
]

{ #category : #rendering }
RTAreaDecorator >> render [
	| svg path t |
	svg := TRSVGPath new.
	svg color: color.
	t := builder getPixelPositionOf: 0@0.
	path := String new writeStream.
	path 
		nextPutAll: 'M';
		nextPutAll: t x asFloat asString;
		nextPutAll: ' ';
		nextPutAll: t y asFloat asString.
	
	points doWithIndex: [ :v :i |
		t := builder getPixelPositionOf: i@v.
		path
			nextPutAll: 'L';
			nextPutAll: t x asFloat asString;
			nextPutAll: ' ';
			nextPutAll: t y asFloat asString.
		 ].
	t := builder getPixelPositionOf: points size @ 0.
	path 
		nextPutAll: 'L';
		nextPutAll: t x asFloat asString;
		nextPutAll: ' ';
		nextPutAll: t y asFloat asString;
		nextPutAll: 'Z'.
	svg path: path contents.
	builder view canvas addShape: svg.
	
]
