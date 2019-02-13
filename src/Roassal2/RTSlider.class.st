"
Create a slider on a view.

A `#callback:`can be set to view the `#progress` (as float between 0 and 1).
"
Class {
	#name : #RTSlider,
	#superclass : #RTBuilder,
	#instVars : [
		'callback',
		'position',
		'sliderElements',
		'min',
		'max',
		'useIntegerLabel',
		'value',
		'orientation',
		'size',
		'hasLabel'
	],
	#category : #'Roassal2-Builder-UI-Slider'
}

{ #category : #public }
RTSlider >> build [
	| allElements res |
	allElements := view elements.
	res := super build.
	TRConstraint move: sliderElements to: position and: allElements.
	^ res
]

{ #category : #accessing }
RTSlider >> callback [
	^ callback
]

{ #category : #accessing }
RTSlider >> callback: aOneArgBlock [
	"aOneArgBlock will be called with the current #progress (float between 0.0 and 1.0)."

	callback := aOneArgBlock
]

{ #category : #hooks }
RTSlider >> createShapeBuilder [
	"RTBox new color: (Color red alpha: 0.5); width: 15; height: 20"
	^ super createShapeBuilder
		rectangle;
		color: (Color red alpha: 0.5);
		width: 15;
		height: 20;
		yourself
]

{ #category : #accessing }
RTSlider >> horizontal [
	orientation := #horizontal
]

{ #category : #initialization }
RTSlider >> initialize [
	super initialize.
	hasLabel := false.
	callback := [ :aValue |  ].
	sliderElements := #().
	min := 0.0.
	max := 1.0.
	value := 0.5.
	useIntegerLabel := false.
	size := 200.
	self horizontal
]

{ #category : #testing }
RTSlider >> isHorizontal [
	^ orientation = #horizontal
]

{ #category : #accessing }
RTSlider >> labeled [
	hasLabel := true
]

{ #category : #accessing }
RTSlider >> labelled [
	self deprecated: 'Please, use #labeled instead'.
	self labeled
]

{ #category : #accessing }
RTSlider >> max [
	^ max
]

{ #category : #accessing }
RTSlider >> max: aNumber [
	self assert: [ min <= aNumber ] description: 'Max value cant be smaller than the min value'.
	max := aNumber
]

{ #category : #accessing }
RTSlider >> min [
	^ min
]

{ #category : #accessing }
RTSlider >> min: aNumber [
	self assert: [ aNumber <= max ] description: 'Min value cant be bigger than the max value'.
	min := aNumber
]

{ #category : #accessing }
RTSlider >> min: aMin max: aMax [
	self assert: [ aMin <= aMax ] description: 'Min value cant be bigger than the max value'.
	min := aMin.
	max := aMax
]

{ #category : #accessing }
RTSlider >> move: aSymbol [
	position := aSymbol
]

{ #category : #accessing }
RTSlider >> progress [
	^ (value - min) / (max - min)
]

{ #category : #accessing }
RTSlider >> progress: aFloat [
	self
		assert: [ aFloat between: 0 and: 1 ]
		description: 'A progress must be a float between 0 and 1'.
	self value: min + ((max - min) * aFloat)
]

{ #category : #hooks }
RTSlider >> renderIn: aView [
	| extremity1 extremity2 line cursor dragAndConstraint trachelShape aValue w2 sliderSize |
	sliderSize := self isHorizontal
		ifTrue: [ size @ 0 ]
		ifFalse: [ 0 @ size ].
	extremity1 := (RTBox new
		width: 5;
		height: 10) element.
	extremity2 := (RTBox new
		width: 5;
		height: 10) element.
	line := (RTLine new width: 5) edgeFrom: extremity1 to: extremity2.
	aView add: extremity1.
	aView add: extremity2.
	aView add: line.
	extremity2 translateTo: sliderSize.
	cursor := self elementOn: nil.
	dragAndConstraint := RTConstrainedDraggable new.
	dragAndConstraint
		rectangle: [ w2 := (cursor encompassingRectangle width / 2)
				@ (cursor encompassingRectangle height / 2).
			w2 := w2
				*
					(self isHorizontal
						ifTrue: [ 1 @ 0 ]
						ifFalse: [ 0 @ 1 ]).
			extremity1 position - w2 corner: extremity2 position + w2 ].

	"We compute the slider value, and call the callback"
	dragAndConstraint
		afterBlock: [ self isHorizontal
				ifTrue: [ aValue := (cursor position x - extremity1 position x)
						/ (extremity2 position x - extremity1 position x) ]
				ifFalse: [ aValue := (cursor position y - extremity1 position y)
						/ (extremity2 position y - extremity1 position y) ].
			aValue := aValue * (max - min) + min.
			aValue := (aValue max: min) min: max.
			callback rtValue: aValue.
			hasLabel
				ifTrue: [ trachelShape
						text:
							(useIntegerLabel
								ifTrue: [ (aValue round: 0) asInteger ]
								ifFalse: [ aValue round: 2 ]) asString ] ].
	cursor @ dragAndConstraint.
	aView add: cursor.
	cursor translateTo: sliderSize * self progress.

	"We prepare a label if necessary"
	hasLabel
		ifTrue: [ cursor @ (RTLabeled new text: self value).
			trachelShape := cursor attributeAt: #RTLabelledLabel ].

	"We keep track of the elements we add in the view"
	sliderElements := RTGroup new.
	sliderElements add: cursor.
	sliderElements add: extremity1.
	sliderElements add: extremity2.
	sliderElements setAsFixed
]

{ #category : #accessing }
RTSlider >> size: aNumber [
	"Size of the slider (it's width or height)"

	size := aNumber
]

{ #category : #accessing }
RTSlider >> useIntegerLabel [
	"sets the display of the slider's label using an integral value instead of a floating point one
	ex:
		slider useIntegerLabel
	"
	useIntegerLabel := true
]

{ #category : #accessing }
RTSlider >> value [
	^ value
]

{ #category : #accessing }
RTSlider >> value: aNumber [
	self
		assert: [ aNumber between: min and: max ]
		description: 'Value must be between min and max.'.
	value := aNumber
]

{ #category : #accessing }
RTSlider >> vertical [
	orientation := #vertical
]
