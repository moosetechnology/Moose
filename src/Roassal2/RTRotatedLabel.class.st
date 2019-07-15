"
A RTRotatedLabel describes rotated labels.

| v shape es |
v := RTView new.
shape := RTRotatedLabel new text: [ :c | 'Class ', c name ]; angleInDegree: [ :c | c numberOfMethods \\ 360 ].
es := shape elementsOn: Collection withAllSubclasses.
RTGridLayout on: es.
v addAll: es.
v open
"
Class {
	#name : #RTRotatedLabel,
	#superclass : #RTLabel,
	#instVars : [
		'angle'
	],
	#category : #'Roassal2-Shapes'
}

{ #category : #accessing }
RTRotatedLabel >> angleFor: element [
	^ angle rtValue: element
]

{ #category : #accessing }
RTRotatedLabel >> angleInDegree: aValueOrAOneArgBlock [
	"aValueOrAOneArgBlock is applied on the object model"
	self angleInDegreeElement: [ :anElement | aValueOrAOneArgBlock rtValue: anElement model ]
]

{ #category : #accessing }
RTRotatedLabel >> angleInDegreeElement: aValueOrABlock [
	"The argument will be evaluated against the model"
	angle := aValueOrABlock
]

{ #category : #initialization }
RTRotatedLabel >> initialize [
	super initialize.
	self angleInDegree: 0.
]

{ #category : #hooks }
RTRotatedLabel >> trachelShapeFor: anElement [
	|  shape |
	"ex := (self widthFor: anElement) @ (self heightFor: anElement)."
	"rec := (anElement position ) extent: ex."
	
	shape := TRRotatedLabelShape new.
	shape text: (self textFor: anElement);
			color: (self colorFor: anElement);
			position: anElement position;
			angleInDegree: (self angleFor: anElement);
			fontSize: (self heightFor: anElement).
	^ shape
]
