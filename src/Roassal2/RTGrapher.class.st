"
RTGrapher describes a chart. Data set may be added and axis may be configured. Consider the following example:

b := RTGrapher new.
ds := RTDataSet new. 
ds dotShape color: Color red. 
ds points: #(5 1 20 8).
b add: ds.
b build.

"
Class {
	#name : #RTGrapher,
	#superclass : #RTAbstractGrapher,
	#instVars : [
		'datasets',
		'generator',
		'shouldUseNiceLabelsForX',
		'shouldUseNiceLabelsForY',
		'legendBuilder'
	],
	#category : #'Roassal2-Builder-Grapher-Core'
}

{ #category : #'public - adding' }
RTGrapher >> add: aDataSet [
	"Essential method. Add a dataset into the grapher. Only non-empty set are considered"
	self assert: [ (aDataSet isKindOf: RTAbstractData) or: [ aDataSet isKindOf: RTAbstractDataSet ]] description: 'Wrong argument'.
	aDataSet numberOfPoints = 0 ifTrue: [ ^ self ].
	
	datasets add: aDataSet.
	aDataSet addedInBuilder: self
]

{ #category : #'public - axis' }
RTGrapher >> axisX [
	| s |
	self checkIfDataSetHaveBeenAdded.
	s := super axisX.
	s scaleTransformation: self xScale.
	^ s
]

{ #category : #'public - axis' }
RTGrapher >> axisXWithNumberOfTicks: aNumber [
	self axisX numberOfTicks: aNumber

]

{ #category : #'public - axis' }
RTGrapher >> axisY [
	| s |
	self checkIfDataSetHaveBeenAdded.
	s := super axisY.
	s scaleTransformation: self yScale.
	^ s
]

{ #category : #'public - axis' }
RTGrapher >> axisYWithNumberOfTicks: aNumber [
	self axisY numberOfTicks: aNumber

]

{ #category : #utility }
RTGrapher >> checkIfDataSetHaveBeenAdded [
	datasets ifEmpty: [ self error: 'No dataset has been added?' ]
]

{ #category : #'public - bar chart' }
RTGrapher >> configureForBarCharts [
	"Public method
	
	Configure the grapher to have bar within the X-axis limits
	Here is an example:
-=-=-=-=-=-=-=-=
g := RTGrapher new.

ds := RTData new.
ds barShape.
ds points: #(1 2 3 -2).
ds maxX: 10.
g add: ds.

g configureForBarCharts.

g
-=-=-=-=-=-=-=-=
	"
	self datasets do: #offsetForBarCharts.
	self minX: 0.5.
	self maxX: self getMaxNumberOfPoints.
	self axisX noTick.
]

{ #category : #hooks }
RTGrapher >> datasetComputeMinAndMax [
	datasets do: #computeMinAndMax
]

{ #category : #'data sets' }
RTGrapher >> datasets [
	^ datasets copy
]

{ #category : #accessing }
RTGrapher >> getMaxNumberOfPoints [
	"Return the maximum number of points any of the dataset has."
	^ datasets inject: 0 into: [ :max :ds | max max: ds numberOfPoints ]
]

{ #category : #utility }
RTGrapher >> getPixelPositionOf: aPoint [
	"Return the position in pixel in the View for a given data point"
	"This method should be called only if all the dataset have been set the min and max values"
	^ datasets first getPixelPositionOf: aPoint
]

{ #category : #utility }
RTGrapher >> getPositionFromPixelPosition: aPoint [
	"Return the position in pixel in the View for a given data point"
	"This method should be called only if all the dataset have been set the min and max values"
	^ datasets first getPositionFromPixelPosition: aPoint
]

{ #category : #'data sets' }
RTGrapher >> hasDataSet [
	^ self numberOfDataSets > 0
]

{ #category : #'min and max' }
RTGrapher >> homogenizeMinAndMax [
	| tminX tmaxX tminY tmaxY block r |
	generator setLooseFlag: true.
	block := [ :axis :lmin :lmax | 
		| result nticks |
		nticks := axis numberOfTicks isZero
			ifTrue: [ 2 ]
			ifFalse: [ axis numberOfTicks ].
		result := generator searchMin: lmin max: lmax desired: nticks.
		axis numberOfTicks isZero
			ifFalse: [ axis numberOfTicks: result numberOfTicks ].
		axis numberOfLabels isZero
			ifFalse: [ axis numberOfLabels: result numberOfTicks ].
		result ].
	shouldUseNiceLabelsForX
		ifTrue: [ 
			r := block value: self getAxisX value: self minX value: self maxX.
			self minX: (tminX := r min).
			self maxX: (tmaxX := r max) ]
		ifFalse: [ 
			tminX := self minX.
			tmaxX := self maxX ].
	shouldUseNiceLabelsForY
		ifTrue: [ 
			r := block value: self getAxisY value: self minY value: self maxY.
			self minY: (tminY := r min).
			self maxY: (tmaxY := r max) ]
		ifFalse: [ 
			tminY := self minY.
			tmaxY := self maxY ].
	datasets
		do: [ :ds | 
			ds minX: tminX.
			ds minY: tminY.
			ds maxX: tmaxX.
			ds maxY: tmaxY ]
]

{ #category : #hooks }
RTGrapher >> inferLegendInteractions [
	datasets
		select:
			[ :each | each interaction hasInteractionOfType: RTDataHighlightInteraction ]
		thenDo: [ :each | 
			(self legend legendElement attributeAt: #nestedElements)
				select: [ :grp | grp size > 1 and: [ grp second model = each ] ]
				thenDo: [ :grp | 
					| int |
					int := each interaction
						interactionOfType: RTDataHighlightInteraction.
					int legendElements: grp.
					grp @ int ] ].
	datasets
		select:
			[ :each | each interaction hasInteractionOfType: RTDataToggleInteraction ]
		thenDo: [ :each | 
			(self legend legendElement attributeAt: #nestedElements)
				select: [ :grp | grp size > 1 and: [ grp second model = each ] ]
				thenDo: [ :grp | 
					| int |
					int := each interaction
						interactionOfType: RTDataToggleInteraction.
					int legendElements: grp.
					grp @ int ] ]
]

{ #category : #initialization }
RTGrapher >> initialize [
	super initialize.
	
	"Collection of data sets"
	datasets := OrderedCollection new.
	
	generator := RTLabelGenerator nice: RTNiceStepSizeGenerator new.
	self shouldUseNiceLabels: true
]

{ #category : #accessing }
RTGrapher >> legend [
	"Turn on the legend for the graph. In addition, the returned value can be used to complete the legend. Consider the following code:
	
-=-=-=-=
g := RTGrapher new.
d := RTData new.
d label: 'Collection code'.
d dotShape color: Color red trans.
d points: (Collection withAllSubclasses).
d x: #numberOfLinesOfCode.
d y: #numberOfMethods.
g add: d.

d := RTData new.
d label: 'Roassal code'.
d dotShape color: Color blue trans.
d points: (RTObject withAllSubclasses).
d x: #numberOfLinesOfCode.
d y: #numberOfMethods.
g add: d.

g axisX noDecimal; title: 'Number of lines of code'; withThousandsSeparator.
g axisY noDecimal; title: 'Number of Methods'.

g legend addText: 'Collection vs Roassal code base'.
g
-=-=-=-=

	"
	^ legendBuilder
		ifNil: [ self resetLegend.
			legendBuilder ]
]

{ #category : #accessing }
RTGrapher >> legend: aLegendBuilder [
	legendBuilder := aLegendBuilder
]

{ #category : #accessing }
RTGrapher >> maxX [
	^ self hasDataSet 
		ifTrue: [ maxX max: self maxXFromDataSets ]
		ifFalse: [ maxX ]
]

{ #category : #'data sets' }
RTGrapher >> maxXFromDataSets [
	^ (datasets collect: #maxX) max
]

{ #category : #accessing }
RTGrapher >> maxY [
	^ self hasDataSet 
		ifTrue: [ maxY max: self maxYFromDataSets ]
		ifFalse: [ maxY ] 
]

{ #category : #'data sets' }
RTGrapher >> maxYFromDataSets [
	^ (datasets collect: #maxY) max
]

{ #category : #accessing }
RTGrapher >> minX [
	^ self hasDataSet 
		ifTrue: [ minX min: self minXFromDataSets ]
		ifFalse: [ minX ]
]

{ #category : #'data sets' }
RTGrapher >> minXFromDataSets [
	^ (datasets collect: #minX) min
]

{ #category : #accessing }
RTGrapher >> minY [
	^ self hasDataSet 
		ifTrue: [ minY min: self minYFromDataSets ]
		ifFalse: [ minY ] 
]

{ #category : #'data sets' }
RTGrapher >> minYFromDataSets [
	^ (datasets collect: #minY) min
]

{ #category : #accessing }
RTGrapher >> numberOfDataSets [
	^ datasets size
]

{ #category : #accessing }
RTGrapher >> numberOfDecorators [
	"Return the number of decorators that have been added"
	^ decorators size
]

{ #category : #hooks }
RTGrapher >> renderDataSetsIn: aView [
	datasets do: [ :aDataset | aDataset renderIn: aView ]
]

{ #category : #hooks }
RTGrapher >> renderDataset: aDataset inLegend: aLegend [
	| color |
	color := aDataset shouldConnect
		ifTrue: [ aDataset lineShape color rtValue: RTElement new ]
		ifFalse: [ aDataset dotShape color rtValue: RTElement new ].
	aLegend addColor: color object: aDataset text: #label
]

{ #category : #hooks }
RTGrapher >> renderIn: aView [
	self datasetComputeMinAndMax.
	self defineAxesIfNecessary.
	self homogenizeMinAndMax.
	self renderAxis.
	self renderAllDecoratorsInFront.
	self renderDataSetsIn: aView.
	self renderAllDecoratorsBehind.
	legendBuilder ifNotNil: [ self renderLegend ]
]

{ #category : #hooks }
RTGrapher >> renderLegend [
	self legend view: self view.
	datasets
		do: [ :each | self renderDataset: each inLegend: self legend ].
	self legend build.
	self inferLegendInteractions
]

{ #category : #resetting }
RTGrapher >> resetLegend [
	"Private method. Not meant to be used publically"
	legendBuilder := self createLegendBuilder
]

{ #category : #accessing }
RTGrapher >> shouldUseNiceLabels: aBoolean [
	"
	Use an algorithm to determine the best values for the ticks. 
	

-=-=-=-=-=-=-=-=-=-=-=-=
g := RTGrapher new.
g shouldUseNiceLabels: true.

ds := RTData new.
ds barShape.
ds points: #(1.2 2.1 3.9).
g add: ds.

g
-=-=-=-=-=-=-=-=-=-=-=-=
	"
	self shouldUseNiceLabelsForX: aBoolean.
	self shouldUseNiceLabelsForY: aBoolean.
]

{ #category : #accessing }
RTGrapher >> shouldUseNiceLabelsForX: aBoolean [
	"
	Use an algorithm to adequately select the value of the ticks on the X-axis.

	Consider the following script. Try replacing false by true
-=-=-=
g := RTGrapher new.
g shouldUseNiceLabelsForY: false.
g shouldUseNiceLabelsForX: false.

ds := RTData new.
ds points: #(1.2 2.1 3.9).
ds x: #yourself.
ds y: #yourself.
g add: ds.

g
-=-=-=
	"

	shouldUseNiceLabelsForX := aBoolean
]

{ #category : #accessing }
RTGrapher >> shouldUseNiceLabelsForY: aBoolean [
	"
	Use an algorithm to adequately select the value of the ticks on the Y-axis.

	Consider the following script. Try replacing false by true
-=-=-=
g := RTGrapher new.
g shouldUseNiceLabelsForY: false.
g shouldUseNiceLabelsForX: false.

ds := RTData new.
ds points: #(1.2 2.1 3.9).
ds x: #yourself.
ds y: #yourself.
g add: ds.

g
-=-=-=
	"
	shouldUseNiceLabelsForY := aBoolean
]

{ #category : #accessing }
RTGrapher >> xScale [
	"Return the scale transformation that should be used for the X-axis"
	| s |
	s := datasets collect: #xScale.
	s := s asSet.
	self assert: [ s size = 1 ] description: 'You are trying to have more than one data set with different scale. Please, homogeneize'.
	^ s anyOne
]

{ #category : #accessing }
RTGrapher >> yScale [
	"Return the scale transformation that should be used for the Y-axis"
	| s |
	s := datasets collect: #yScale.
	s := s asSet.
	self assert: [ s size = 1 ] description: 'You are trying to have more than one data set with different scale. Please, homogeneize'.
	^ s anyOne
]
