"
Draw the deviation area around a curve.

Here is an example:
-=-=-=-=
b := RTGrapher new.
colors := Array with: Color red with: Color blue.
points := OrderedCollection new.
colors do: [ :c |
	ds := RTData new.
	pts := ((1 to: 100) collect: [ :i | 50 atRandom - 25 ]) cumsum.
	points add: pts.
	ds points: pts.
	dec := RTDevVarDecorator new.
	dec moveBehind;
		deviation: 0.5;
		color: (c alpha: 0.3);
		points: pts.
	ds connectUsing: (RTLine new color: (c alpha: 0.5); width: 1 ).
	b add: ds.
	b addDecorator: dec.
	 ].

b axisX; axisY.
b build.

lb := RTLegendBuilder new.
lb view: b view.
colors doWithIndex: [ :c :i | 
	lb addColor: c text: 'Series  ', i printString ].
lb build.
b view @ RTZoomableView @ RTZoomableBoxView.
^ b view
-=-=-=-=
"
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
