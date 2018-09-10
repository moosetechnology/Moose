Class {
	#name : #RTDevVarDecorator,
	#superclass : #RTAbstractGrapherDecorator,
	#instVars : [
		'color',
		'points',
		'deviation'
	],
	#category : #'Roassal2-Builder-Grapher-Decorators'
}

{ #category : #accessing }
RTDevVarDecorator >> color [
	^ color
]

{ #category : #accessing }
RTDevVarDecorator >> color: aColor [
	color := aColor.
]

{ #category : #accessing }
RTDevVarDecorator >> deviation [
	^ deviation
]

{ #category : #accessing }
RTDevVarDecorator >> deviation: aNumber [
	deviation := aNumber
]

{ #category : #initialization }
RTDevVarDecorator >> initialize [
	super initialize.
	self color: (Color gray alpha: 0.5).
	self deviation: 0.
]

{ #category : #accessing }
RTDevVarDecorator >> points [
	^ points
]

{ #category : #accessing }
RTDevVarDecorator >> points: pts [
	points := pts
]

{ #category : #drawing }
RTDevVarDecorator >> render [
	| dev svg k str index offset |
	dev := points collectWithIndex: [ :p :i | p + (deviation*i). ].
	
	svg := TRSVGPath new.
	svg color: color.
	offset := -0.15.
	k := builder getPixelPositionOf: (1+offset)@dev first.
	str := 'M', k x asString,' ', k y asString.
	(2 to: dev size) do: [ :i| | p |
		p := dev at: i.
		k := builder getPixelPositionOf: (i+offset)@p.
		str := str, 'L', k x asString,' ', k y asString.
		].
	dev := (points collectWithIndex:[:p :i | p - (deviation*i)] ).
	(1 to: dev size) do: [ :i | | p |
		index := dev size - i +1.
		p := dev at: index.
		k := builder getPixelPositionOf: (index+offset)@p.
		str := str, 'L', k x asString,' ', k y asString. ].
	
	str := str, 'Z'.
	svg path: str.
	builder view canvas addShape: svg.
	
]
