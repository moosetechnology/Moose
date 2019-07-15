"
A RTAxisRenderer is a renderer for axis. It simply render in a view an axis configuration

"
Class {
	#name : #RTAxisRenderer,
	#superclass : #RTObject,
	#instVars : [
		'config',
		'builder'
	],
	#category : #'Roassal2-Builder-Grapher-Core'
}

{ #category : #'rendering-utility' }
RTAxisRenderer >> addAllToView: roassalElements [
	self builder view addAll: roassalElements
]

{ #category : #rendering }
RTAxisRenderer >> addTicksFrom: toPosition to: fromPosition [
	"Add ticks on the lines. Return the list of ticks"

	| tickShape ticks tickLength angle ticksShift |
	tickLength := 5.
	angle := (toPosition - fromPosition) angle.
	tickShape := RTBox new
		color: config color;
		height: tickLength;
		width: config lineThickness.
	ticks := tickShape elementsOn: (0 to: self numberOfTicks).
	self addAllToView: ticks.
	ticks pushBack.
	ticksShift := self areTicksCentered
		ifTrue: [ 1 ]
		ifFalse: [ tickLength ].
	RTMetricNormalizer new
		elements: ticks;
		normalizePosition: [ :v | v @ v ]
			min: fromPosition + (angle sin @ angle cos * ticksShift / 2)
			max: toPosition + (angle sin @ angle cos * ticksShift / 2)
			using: [ :aPoint | (config scaleTransformation rtValue: aPoint x) @ (config scaleTransformation rtValue: aPoint y) ].
	ticks rotateByDegrees: angle radiansToDegrees.

	"Ticks should not have any model"
	ticks do: [ :el | el model: nil ].
	^ ticks
]

{ #category : #'rendering-utility' }
RTAxisRenderer >> addToView: roassalElement [
	self builder view add: roassalElement
]

{ #category : #rendering }
RTAxisRenderer >> areTicksCentered [
	^ config ticksCentered
]

{ #category : #'public-rendering' }
RTAxisRenderer >> axisFrom: fromPosition to: toPosition [
	"THIS IS A PUBLIC METHOD"

	"fromPosition is the starting point of the axis. toPosition is the ending point"
	self axisFrom: fromPosition to: toPosition width: 1
]

{ #category : #'public-rendering' }
RTAxisRenderer >> axisFrom: fromPosition to: toPosition width: lineThicknessInPixels [
	"THIS IS A PUBLIC METHOD"

	"fromPosition is the starting point of the axis. toPosition is the ending point"

	| ticks labelShape labelValues labels tickIntervalForLabel labelledTicks |
	"We add the labels"
	self axisLineFrom: fromPosition to: toPosition width: lineThicknessInPixels.
	
	"We insert the title if necessary"
	self insertTitleIfNecessaryTo: toPosition.

	
	self numberOfTicks = 0 ifTrue: [ ^ self ].
	ticks := self addTicksFrom: toPosition to: fromPosition.
	self numberOfLabels = 0 ifTrue: [ ^ self ].
	tickIntervalForLabel := self tickIntervalForLabel.
	labelledTicks := (1 to: ticks size by: tickIntervalForLabel) collect: [ :i | ticks at: i ].
	labelValues := (0 to: self numberOfLabels)
		collect: [ :i | self minValue + (i * (self maxValue - self minValue) / self numberOfLabels) ].

	labelShape := RTLabel new 
		color: self defaultLabelColor;
		text: [ :i | self getStringFromNumber: (labelValues at: i + 1) ];
		height: self labelFontHeight.
	labels := labelShape elementsOn: (0 to: self numberOfLabels).
	labels withIndexDo: [ :label :i | 
		self moveLabel: label againstTick: (labelledTicks at: i).
		self rotateLabelIfNecessary: label.
		label model: nil ].
	
	self addAllToView: labels.	
	labels pushBack
]

{ #category : #rendering }
RTAxisRenderer >> axisLineFrom: aPositionFrom to: aPositionTo [
	"Add the lines"
	self axisLineFrom: aPositionFrom to: aPositionTo width: 1
]

{ #category : #rendering }
RTAxisRenderer >> axisLineFrom: aPositionFrom to: aPositionTo width: numberOfPixels [
	"Add the lines, with a width of numberOfPixels"
	| edge ex2 ex1 |		
	ex1 := (RTBox new size: 0) element.
	ex2 := (RTBox new size: 0) element.
	ex2 translateTo: (aPositionTo).
	ex1 translateTo: (aPositionFrom).
	edge := (RTLine new color: config color; width: numberOfPixels) edgeFrom: ex1 to: ex2.
	self addToView: ex1; addToView: ex2.
	self addToView: edge
]

{ #category : #accessing }
RTAxisRenderer >> builder [
	^ builder
]

{ #category : #accessing }
RTAxisRenderer >> builder: aChartBuilder [
	builder := aChartBuilder
]

{ #category : #accessing }
RTAxisRenderer >> config [
	^ config
]

{ #category : #accessing }
RTAxisRenderer >> config: anAxisConfiguration [
	config := anAxisConfiguration
]

{ #category : #configuration }
RTAxisRenderer >> defaultLabelColor [
	"Label should have the same colors than the axis"
	^ config color
]

{ #category : #'accessing-computed' }
RTAxisRenderer >> getStringFromNumber: aNumber [
	^ config getStringFromNumber: aNumber
]

{ #category : #'public-rendering' }
RTAxisRenderer >> insertTitleIfNecessaryTo: toPosition [
	| lbl |
	self title notEmpty
		ifTrue: [ 
			lbl := (RTLabel new text: self title; color: self defaultLabelColor) element.
			self addToView: lbl.
			lbl translateTo: toPosition - config titlePosition ]
]

{ #category : #accessing }
RTAxisRenderer >> labelFontHeight [
	^ config labelFontHeight 
]

{ #category : #'accessing-computed' }
RTAxisRenderer >> maxValue [
	^ config maxValue
]

{ #category : #'accessing-computed' }
RTAxisRenderer >> minValue [
	^ config minValue
]

{ #category : #action }
RTAxisRenderer >> moveLabel: label againstTick: aTick [
	self positionLabel value: label value: aTick
]

{ #category : #'accessing-computed' }
RTAxisRenderer >> numberOfLabels [
	^ config numberOfLabels
]

{ #category : #'accessing-computed' }
RTAxisRenderer >> numberOfTicks [
	^ config numberOfTicks
]

{ #category : #'accessing-computed' }
RTAxisRenderer >> positionLabel [
	^ config positionLabel
]

{ #category : #'public-rendering' }
RTAxisRenderer >> rotateLabelIfNecessary: label [
	"Rotate and position the label if necessary"
	config areLabelRotated ifFalse: [ ^ self ].
	label rotateByDegrees: config labelRotation.
	label translateBy: (label width / -2 * config labelRotation degreesToRadians cos @ 
								(label width / -2 * config labelRotation degreesToRadians sin)) "+ (5 @ 0)".
]

{ #category : #'accessing-computed' }
RTAxisRenderer >> tickIntervalForLabel [
	^ config tickIntervalForLabel
]

{ #category : #'accessing-computed' }
RTAxisRenderer >> title [
	^ config title
]
