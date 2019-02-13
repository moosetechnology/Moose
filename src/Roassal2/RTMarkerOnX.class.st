"
=-=-=-=-
| b ds |
b := RTGrapher new.

ds := RTData new.
ds connectColor: Color blue.
ds points: #(3 4 5 6 7).
ds x: #yourself.
ds y: #yourself.

b add: ds.
b addDecorator: (RTMarkerOnX new value: 5).
b addDecorator: (RTMarkerOnX new value: 6).
b
=-=-=-=-
"
Class {
	#name : #RTMarkerOnX,
	#superclass : #RTAbstractGrapherDecorator,
	#instVars : [
		'value',
		'markerColor'
	],
	#category : #'Roassal2-Builder-Grapher-Decorators'
}

{ #category : #hooks }
RTMarkerOnX >> initialize [
	super initialize.
	self markerColor: Color red
]

{ #category : #accessing }
RTMarkerOnX >> markerColor [
	^ markerColor
]

{ #category : #accessing }
RTMarkerOnX >> markerColor: aColor [
	markerColor := aColor
]

{ #category : #hooks }
RTMarkerOnX >> render [	
	| fromPosition toPosition e1 e2 l lineShape |
	fromPosition := builder getPixelPositionOf: value @ 0.
	toPosition := fromPosition - (0 @ 30).
	e1 := (RTBox new size: 1) element.
	e2 := (RTBox new size: 1) element.
	e1 translateTo: fromPosition.
	e2 translateTo: toPosition.
	
	lineShape := RTArrowedLine new.
	lineShape head width: 3.
	lineShape width: 3.
	lineShape color: markerColor.
	l := lineShape edgeFrom: e2 to: e1.
	builder view add: e1; add: e2; add: l
]

{ #category : #accessing }
RTMarkerOnX >> value [
	^ value
]

{ #category : #accessing }
RTMarkerOnX >> value: aNumber [
	value := aNumber
]
