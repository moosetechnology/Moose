"
A data set is a set of points intended to be charted. A data set has to be added to a RTGrapher.  Look at the class comment of my subclasses for detail.
"
Class {
	#name : #RTAbstractStackedDataSet,
	#superclass : #RTAbstractDataSet,
	#category : #'Roassal2-Builder-Grapher-Core'
}

{ #category : #public }
RTAbstractStackedDataSet >> barChartWithBarCenteredTitle: aBlockOrSymbol [
	"Add bar charts with centered title, the default color is used. This is a public method"
	^ self barChartWithBarCenteredTitle: aBlockOrSymbol color: self defaultLabelColor
]

{ #category : #public }
RTAbstractStackedDataSet >> barChartWithBarCenteredTitle: aBlockOrSymbol color: aColor [
	"Draw a bar chart with title"
	self barShape.
	elementActions add: [ :elements | 
		| lbl |
		elements do: [ :e |
			lbl := (RTLabel new text: aBlockOrSymbol; color: aColor) elementOn: e model.
			TRConstraint move: lbl below: e.
			"lbl translateBy: (lbl width / -2 @ 0) + (5 @ 0)."
			elements anyOne view add: lbl.
		] ].
	 
]

{ #category : #public }
RTAbstractStackedDataSet >> barChartWithBarTitle: aBlockOrSymbol [
	"Draw a barChart with title"
	self barChartWithBarTitle: aBlockOrSymbol rotation: -45
]

{ #category : #public }
RTAbstractStackedDataSet >> barChartWithBarTitle: aBlockOrSymbol rotation: rotationInDegree [
	"Draw an histogram with title"

	self barChartWithBarTitle: aBlockOrSymbol rotation: rotationInDegree color: self defaultLabelColor
]

{ #category : #public }
RTAbstractStackedDataSet >> barChartWithBarTitle: aBlockOrSymbol rotation: rotationInDegree color: aColor [
	"Draw an histogram with title"
	self barShape.
	elementActions add: [ :elements | 
		| lbl |
		elements do: [ :e |
			lbl := (RTLabel new text: aBlockOrSymbol; color: aColor) elementOn: e model.
			lbl rotateByDegrees: rotationInDegree.
			TRConstraint move: lbl below: e.
			lbl translateBy: (lbl width / -2 @ 0) + (5 @ 0).
			elements anyOne view add: lbl.
		] ].
	 
]

{ #category : #hooks }
RTAbstractStackedDataSet >> centralDot [
	^ (RTEllipse new
		size: 0;
		color: Color red) element translateTo: (builder getPixelPositionOf: 0 @ 0)
]

{ #category : #'min and max' }
RTAbstractStackedDataSet >> computeMinAndMaxForX [
	minX := 1.
	maxX := builder getMaxNumberOfPoints.

	(minX < 0 and: [maxX < 0]) ifTrue: [ maxX := 0 ].
	(minX > 0 and: [maxX > 0]) ifTrue: [ minX := 0 ].
	

]

{ #category : #public }
RTAbstractStackedDataSet >> defaultLabelColor [
	^ Color lightGray
]

{ #category : #obsolete }
RTAbstractStackedDataSet >> histogramWithBarTitle: aBlockOrSymbol [
	"Draw an histogram with title"
	"THIS IS AN OBSOLETE METHOD. Rewrite your code to use RTData and barShape.
For example:
	
b := RTGrapher new.
ds := RTData new.
ds points: #(1 4 2 3 5 6).
ds barShape.
b add: ds.
b
	"
	self histogramWithBarTitle: aBlockOrSymbol rotation: -45
]

{ #category : #obsolete }
RTAbstractStackedDataSet >> histogramWithBarTitle: aBlockOrSymbol rotation: rotationInDegree [
	"Draw an histogram with title"
	self histogramWithBarTitle: aBlockOrSymbol rotation: rotationInDegree color: Color lightGray
]

{ #category : #obsolete }
RTAbstractStackedDataSet >> histogramWithBarTitle: aBlockOrSymbol rotation: rotationInDegree color: aColor [
	"Draw an histogram with title"
	self barShape.
	elementActions add: [ :elements | 
		| lbl |
		elements do: [ :e |
			lbl := (RTLabel new text: aBlockOrSymbol; color: aColor) elementOn: e model.
			lbl rotateByDegrees: rotationInDegree.
			TRConstraint move: lbl below: e.
			lbl translateBy: (lbl width / -2 @ 0) + (5 @ 0).
			elements anyOne view add: lbl.
		] ].
	 
]

{ #category : #hooks }
RTAbstractStackedDataSet >> renderBarChartIn: aView [
	| centralDot elements positiveElements negativeElements |
	centralDot := self centralDot.
	
	elements := histogramBuilder elementsOn: points.
	builder view addAll: elements.
	interaction setUpElements: elements.

	RTMetricNormalizer new
		elements: elements;
		normalizeElementX: [ :element | (elements indexOf: element) + 0.513 ]
			min: 0
			max: builder extent x
			minValue: 1
			maxValue: maxX + 1.

	"We treat the element with a positive value"
	positiveElements := elements select: [ :el | (y rtValue: el model) >= 0 ].
	positiveElements
		ifNotEmpty: [
			RTMetricNormalizer new
				elements: positiveElements;
				normalizeHeight: [ :model | y rtValue: model ]
					min: 0
					max: builder extent y + centralDot position y
					minValue: 0
					maxValue: maxY ].
	RTAlignment new elements:  positiveElements; alignFromBottomUsing: centralDot. 
		
	"We treat the element with a negative value"
	negativeElements := elements copyWithoutAll: positiveElements.
	negativeElements
		ifNotEmpty: [ 
			RTMetricNormalizer new
				elements: negativeElements;
				normalizeHeight: [ :model | y rtValue: model ]
					min: "builder extent y -"  centralDot position y negated 
					max: 0
					minValue: minY
					maxValue: 0.
				RTAlignment new elements:  negativeElements; alignFromBottomUsing: centralDot. ].	"We set the actions, if any"
	elementActions do: [ :act | act rtValue: elements ]
]
