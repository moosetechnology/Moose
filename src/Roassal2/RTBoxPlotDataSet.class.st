"
Boxplots are used to better understant how values are spaced out in different sets of data through their quartiles.

To get more info chec RTBoxPlotExample
"
Class {
	#name : #RTBoxPlotDataSet,
	#superclass : #RTAbstractDataSet,
	#instVars : [
		'model',
		'boxShape',
		'boxLineShape',
		'boxWidth',
		'outlierShape',
		'showMean',
		'meanShape'
	],
	#category : #'Roassal2-Builder-BoxPlot'
}

{ #category : #accessing }
RTBoxPlotDataSet >> boxLineShape [
	^ boxLineShape
]

{ #category : #accessing }
RTBoxPlotDataSet >> boxShape [
	^ boxShape
]

{ #category : #accessing }
RTBoxPlotDataSet >> boxWidth [
	^ boxWidth
]

{ #category : #accessing }
RTBoxPlotDataSet >> boxWidth: anObject [
	boxWidth := anObject
]

{ #category : #'min and max' }
RTBoxPlotDataSet >> computeMinAndMaxForX [

	minX := maxX := x rtValue: model.
	(minX < 0 and: [ maxX < 0 ]) ifTrue: [ maxX := 0 ].
	(minX > 0 and: [ maxX > 0 ]) ifTrue: [ minX := 0 ].
]

{ #category : #accessing }
RTBoxPlotDataSet >> getValuesX [
	^ Array with: (x rtValue: model)
]

{ #category : #initialization }
RTBoxPlotDataSet >> initialize [
	super initialize.
	self noDot.
	self showMean: false.
	self x: [ :m | m isNumber ifTrue: [ m ] ifFalse: [ builder datasets indexOf: self ] ].
	boxWidth := [ builder extent x / (builder datasets size * 1.2) ].
	boxShape := RTShapeBuilder new.
	boxShape rectangle.
	boxLineShape := RTShapeBuilder new.
	boxLineShape rectangle color: Color black.
	meanShape := RTShapeBuilder new.
	meanShape circle size: [:e | (boxWidth rtValue: e)* 0.5]; color: Color black.
	outlierShape := RTShapeBuilder new.
	outlierShape circle; color: (Color black alpha: 0.5); size: [ :e | (boxWidth rtValue: e) * 0.5 ].
]

{ #category : #accessing }
RTBoxPlotDataSet >> meanShape [
	^ meanShape
]

{ #category : #accessing }
RTBoxPlotDataSet >> model: anObject [
	model := anObject.
]

{ #category : #accessing }
RTBoxPlotDataSet >> outlierShape [
	^ outlierShape
]

{ #category : #hooks }
RTBoxPlotDataSet >> renderBoxPlotIn: view item: item [
	| box normalizer e mx |
	mx := x rtValue: model.
	boxShape width: boxWidth.
	box := boxShape elementOn: item.
	view add: box.
	normalizer := RTMetricNormalizer new.
	normalizer elements: (Array with: box);
		normalizeX: [:m | mx ]
			min: 0
			max: builder extent x
			minValue: minX
			maxValue: maxX;
		normalizeY: [:m | m q3 + (m iqr negated / 2) ]
			min: 0
			max: builder extent y negated
			minValue: minY
			maxValue: maxY;
		normalizeHeight: [ :m | m iqr negated ]
			min: 0
			max: builder extent y negated
			minValue: minY
			maxValue: maxY.
	
	showMean ifFalse: [ ^ self ].
	e := meanShape elementOn: item.
	view add: e.
	
	normalizer elements: (Array with: e );
		normalizeX: [ :i | mx ]
		min: 0
		max: builder extent x
		minValue: minX
		maxValue: maxX;
		normalizeY: [ :i | i mean ]
		min: 0
		max: builder extent y negated
		minValue: minY
		maxValue: maxY

]

{ #category : #hooks }
RTBoxPlotDataSet >> renderBoxPlotLines: view item: item [
	|e1 e2 e3 e4 e5 b normalizer mx |
	b := boxLineShape.
	b height: 0.5; width: boxWidth.
	mx := x rtValue: model.
	e1 := b elementOn: item maxRegularValue.
	e2 := b elementOn: item median.
	e3 := b elementOn: item minRegularValue.
	view add: e1; add: e2; add: e3.
	b width: 0.5.
	e4 := b elementOn: item.
	e5 := b elementOn: item.
	view add: e4; add: e5.
	
	normalizer := RTMetricNormalizer new.
	normalizer elements: (Array with: e1 with: e2 with: e3 with: e4 with: e5).
	normalizer normalizeX: [ :m | mx ]
		min: 0
		max: builder extent x
		minValue: minX
		maxValue: maxX.
		
	normalizer elements: (Array with: e1 with: e2 with: e3);
		normalizeY: #yourself
		min: 0
		max: builder extent y negated
		minValue: minY
		maxValue: maxY.
		
	
	normalizer elements: (Array with: e4);
		normalizeY: [ :i | i maxRegularValue - ((i maxRegularValue - i q3)/2) ]
		min: 0
		max: builder extent y negated
		minValue: minY
		maxValue: maxY;
		normalizeHeight: [ :i | (i maxRegularValue - i q3) negated ]
		min: 0
		max: builder extent y negated
		minValue: minY
		maxValue: maxY.
		
	normalizer elements: (Array with: e5);
		normalizeY: [ :i | i q1 - ((i q1 - i minRegularValue )/2) ]
		min: 0
		max: builder extent y negated
		minValue: minY
		maxValue: maxY;
		normalizeHeight: [ :i | i minRegularValue - i q1 ]
		min: 0
		max: builder extent y negated
		minValue: minY
		maxValue: maxY.
	
	
]

{ #category : #hooks }
RTBoxPlotDataSet >> renderDotsIn: view item: item [
	| elements |
	elements := dotBuilder elementsOn: points.
	builder view addAll: elements.
	interaction setUpElements: elements.
	
	RTMetricNormalizer new
		elements: elements;
		normalizeX: [ :m | x rtValue: model ]
			min: 0 
			max: builder extent x
			minValue: minX
			maxValue: maxX.
	RTMetricNormalizer new
		elements: elements;
		normalizeY: [ :m | y rtValue: m ]
			min: 0
			max: builder extent y negated
			minValue: minY
			maxValue: maxY.
			
	elementActions do: [ :act | act rtValue: elements ].
	self renderLinesFor: elements in: view.
]

{ #category : #hooks }
RTBoxPlotDataSet >> renderIn: view [
	|  item |
	
	item := RTBoxPlotItem new.
	item model: model;
		values: self getValuesY.
	
	self renderBoxPlotIn: view item: item.
	self renderBoxPlotLines: view item: item.
	self renderOutliersIn: view item: item.
	self renderDotsIn: view item: item.
]

{ #category : #hooks }
RTBoxPlotDataSet >> renderOutliersIn: view item: item [
	| mx elements normalizer |
	mx := x rtValue: model.
	normalizer := RTMetricNormalizer new.
	elements := outlierShape elementsOn: item outliers.
	view add: elements.
	normalizer elements: elements;
		normalizeX: [ :i | mx ]
		min: 0
		max: builder extent x
		minValue: minX
		maxValue: maxX;
		normalizeY: #yourself
		min: 0
		max: builder extent y negated
		minValue: minY
		maxValue: maxY
		 
]

{ #category : #accessing }
RTBoxPlotDataSet >> showMean [
	 ^ showMean
]

{ #category : #accessing }
RTBoxPlotDataSet >> showMean: aBool [
	showMean := aBool
]

{ #category : #accessing }
RTBoxPlotDataSet >> xScale [
	^ RTLinearTransformation instance
]

{ #category : #accessing }
RTBoxPlotDataSet >> yScale [
	^ RTLinearTransformation instance
]
