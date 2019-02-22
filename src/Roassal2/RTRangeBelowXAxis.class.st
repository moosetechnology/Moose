"
Enable one to define a range of values. For example:

-=-=-=-=
b := RTGrapher new.
d := RTData new.
d points: (1 to: 5).
d y: #yourself.
b add: d.
b addDecorator: (RTRangeBelowXAxis new startValue: 2.5; endValue: 4; label: 'A').
b addDecorator: (RTRangeBelowXAxis new startValue: 0; endValue: 2; label: 'B').
b 
-=-=-=-=
"
Class {
	#name : #RTRangeBelowXAxis,
	#superclass : #RTAbstractGrapherDecorator,
	#instVars : [
		'label',
		'startValue',
		'endValue',
		'markerColor',
		'distanceInPixelsFromAxis'
	],
	#category : #'Roassal2-Builder-Grapher-Decorators'
}

{ #category : #'default configuration' }
RTRangeBelowXAxis >> defaultMarkerColor [
	^ Color black
]

{ #category : #'default configuration' }
RTRangeBelowXAxis >> defaultSizeInPixelsFromAxis [
	^ -50
]

{ #category : #accessing }
RTRangeBelowXAxis >> endValue [
	^ endValue
]

{ #category : #accessing }
RTRangeBelowXAxis >> endValue: aNumericalValue [
	endValue := aNumericalValue
]

{ #category : #initialization }
RTRangeBelowXAxis >> initialize [
	super initialize.
	self markerColor: self defaultMarkerColor.
	self startValue: 0.
	self endValue: 1.
	distanceInPixelsFromAxis := self defaultSizeInPixelsFromAxis
]

{ #category : #accessing }
RTRangeBelowXAxis >> label [
	^ label
]

{ #category : #accessing }
RTRangeBelowXAxis >> label: aString [
	label := aString
]

{ #category : #accessing }
RTRangeBelowXAxis >> markerColor [
	^ markerColor
]

{ #category : #accessing }
RTRangeBelowXAxis >> markerColor: aColor [
	markerColor := aColor
]

{ #category : #hooks }
RTRangeBelowXAxis >> render [	
	| fromPosition toPosition e1 e2 l lineShape tickShape |
	fromPosition := builder getPixelPositionOf: startValue @ 0.
	toPosition := builder getPixelPositionOf: endValue @ 0.
	fromPosition := fromPosition - (0 @ distanceInPixelsFromAxis).
	toPosition := toPosition - (0 @ distanceInPixelsFromAxis).
	
	tickShape := RTBox new height: 10; width: 1; color: self markerColor.
	e1 := tickShape element.
	e2 := tickShape element.
	e1 translateTo: fromPosition.
	e2 translateTo: toPosition.
	
	lineShape := RTLine new.
	lineShape color: markerColor.
	l := lineShape edgeFrom: e2 to: e1.
	
	label := RTLabel new color: markerColor; elementOn: label.
	TRConstraint move: label between: e1 and: e2.
	TRConstraint move: label above: l.
	builder view add: e1; add: e2; add: l; add: label
]

{ #category : #accessing }
RTRangeBelowXAxis >> startValue [
	^ startValue
]

{ #category : #accessing }
RTRangeBelowXAxis >> startValue: aNumericalValue [
	startValue := aNumericalValue
]
