Class {
	#name : #RTAbstractData,
	#superclass : #RTObject,
	#instVars : [
		'builder',
		'maxX',
		'maxY',
		'minX',
		'minY',
		'x',
		'y',
		'elements',
		'barBuilder',
		'elementActions',
		'xScale',
		'yScale',
		'label'
	],
	#category : #'Roassal2-Builder-Grapher-Core'
}

{ #category : #adding }
RTAbstractData >> addedInBuilder: aBuilder [
	self builder: aBuilder.
]

{ #category : #'public - bar shape' }
RTAbstractData >> barChartUsing: barLabelFactory [
	"Draw an histogram with title"
	| v |
	v := self barShape.
	elementActions add: [ :someElements | 
		| lbl |
		self selectElementsForAddingBarTitle doWithIndex: [ :e :index |
			| modelToBeUsed |
			modelToBeUsed := self getModelForElement: e atIndex: index.
			lbl := barLabelFactory createLabelForModel: modelToBeUsed.
			TRConstraint move: lbl below: e.
			lbl translateBy: (lbl width / -2 @ 0) + (5 @ 0).
			elements anyOne view add: lbl.
		] ].
	 ^ v
]

{ #category : #'public - bar shape' }
RTAbstractData >> barChartWithBarCenteredTitle: aBlockOrSymbol [
	"Add bar charts with centered title, the default color is used. This is a public method"
	^ self barChartWithBarCenteredTitle: aBlockOrSymbol color: self defaultLabelColor
]

{ #category : #'public - bar shape' }
RTAbstractData >> barChartWithBarCenteredTitle: aBlockOrSymbol color: aColor [
	"Draw a bar chart with title"
	self barShape.
	elementActions add: [ :someElements | 
		| lbl |
		self selectElementsForAddingBarTitle doWithIndex: [ :e :index |
			| modelToBeUsed |
			modelToBeUsed := self getModelForElement:e atIndex: index.
			lbl := (RTLabel new text: aBlockOrSymbol; color: aColor) 
						elementOn: modelToBeUsed.
			TRConstraint move: lbl below: e.
			elements anyOne view add: lbl.
		] ].
	 
]

{ #category : #'public - bar shape' }
RTAbstractData >> barChartWithBarTitle: aBlockOrSymbol [
	"Draw a barChart with title"
	^ self barChartWithBarTitle: aBlockOrSymbol rotation: -45
]

{ #category : #'public - bar shape' }
RTAbstractData >> barChartWithBarTitle: aBlockOrSymbol rotation: rotationInDegree [
	"Draw an histogram with title"

	^ self barChartWithBarTitle: aBlockOrSymbol rotation: rotationInDegree color: self defaultLabelColor
]

{ #category : #'public - bar shape' }
RTAbstractData >> barChartWithBarTitle: aBlockOrSymbol rotation: rotationInDegree color: aColor [
	"Draw an histogram with title"
	| barLabelFactory |
	barLabelFactory := RTBarLabelFactory new.
	barLabelFactory label: aBlockOrSymbol.
	barLabelFactory rotation: rotationInDegree.
	barLabelFactory color: aColor.
	
	^ self barChartUsing: barLabelFactory
]

{ #category : #accessing }
RTAbstractData >> barShape [
	^ barBuilder
]

{ #category : #accessing }
RTAbstractData >> builder [
	^ builder
]

{ #category : #accessing }
RTAbstractData >> builder: aBuilder [
	builder := aBuilder 
]

{ #category : #hooks }
RTAbstractData >> centralDot [
	^ (RTEllipse new
		size: 0;
		color: Color red) element translateTo: (builder getPixelPositionOf: 0 @ 0)
]

{ #category : #'min and max' }
RTAbstractData >> computeMinAndMax [
	self computeMinAndMaxForX.
	self computeMinAndMaxForY.
]

{ #category : #'min and max' }
RTAbstractData >> computeMinAndMaxForX [
	| computed |
	computed := elements collect: x.
	self assert: [ computed allSatisfy: [ :obj | obj isKindOf: Number ] ] description: 'You have provided objects that are not number. Please adjust what you provide to #points: #x: and #y:'.
	minX := computed min.
	maxX := computed max.

	(minX < 0 and: [ maxX < 0 ]) ifTrue: [ maxX := 0 ].
	"Only set the minX if we want to include the origin."
	self builder hasOrigin ifTrue: [
		(minX > 0 and: [ maxX > 0 ]) ifTrue: [ minX := 0 ]
	].
	
	"We do this to make sure that the bar on the right hand side is not on the right axisX extremity"
	"(self dataSets anySatisfy: #shouldHaveBars) ifTrue: [ maxX := maxX + 1 ]"
	


]

{ #category : #'min and max' }
RTAbstractData >> computeMinAndMaxForY [
	| computed |
	computed := elements collect: y.
	self assert: [ computed allSatisfy: [ :obj | obj isKindOf: Number ] ] description: 'You have provided objects that are not number. Please adjust what you provide to #points: #x: and #y:'.
	minY := computed min.
	maxY := computed max.
	
	(minY < 0 and: [ maxY < 0 ]) ifTrue: [ maxY := 0 ].
	(minY > 0 and: [ maxY > 0 ]) ifTrue: [ minY := 0 ].
	
]

{ #category : #initialization }
RTAbstractData >> defaultLabelColor [
	"Label should be gray per default"
	^ Color gray
]

{ #category : #initialization }
RTAbstractData >> defaultMaxValue [
	^ 1000000
]

{ #category : #initialization }
RTAbstractData >> defaultMinValue [
	^ -1000000
]

{ #category : #accessing }
RTAbstractData >> elements [
	"Private method - not meant to be used by a end user.
	Return the elements added by the data"
	^ elements
]

{ #category : #hooks }
RTAbstractData >> getModelForElement: element atIndex: index [
	"Return the model that is used to insert a label for the element. index is index-th label to be provided."
	"The default behavior is simply to return the model of the element"
	^ element model
]

{ #category : #hooks }
RTAbstractData >> getPixelPositionOf: aPoint [
	"Return the position in the Roassal view of a point"

	| anX anY |
	anX := RTMetricNormalizer new
		getValue: aPoint x min: 0 max: builder extent x minValue: minX maxValue: maxX.
	anY := RTMetricNormalizer new
		getValue: aPoint y min: 0 max: builder extent y negated minValue: minY maxValue: maxY.
			
	^ anX @ anY
]

{ #category : #hooks }
RTAbstractData >> getPositionFromPixelPosition: aPoint [
	"Return the position in the graph from a position in the Roassal view of a point"

	| anX anY |
	anX := RTMetricNormalizer new
		getValue: aPoint x min: minX max: maxX minValue: 0 maxValue: builder extent x.
	anY := RTMetricNormalizer new
		getValue: aPoint y min: minY max: maxY minValue: 0 maxValue: builder extent y.
			
	^ anX @ anY negated
]

{ #category : #initialization }
RTAbstractData >> initialize [
	super initialize.
	elementActions := OrderedCollection new.
	self linear
]

{ #category : #accessing }
RTAbstractData >> label [
	^ label ifNil: [ '' ]
]

{ #category : #accessing }
RTAbstractData >> label: aString [
	"Give a label to the code base. This is useful when a legend is rendered. Here is an example:
	
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

"
	label := aString
]

{ #category : #scale }
RTAbstractData >> linear [
	self xLinear.
	self yLinear
]

{ #category : #scale }
RTAbstractData >> log [
	self xLog.
	self yLog
]

{ #category : #accessing }
RTAbstractData >> maxX [
	^ maxX
]

{ #category : #accessing }
RTAbstractData >> maxX: aNumber [
	"PRIVATE METHOD. Use the method on a Grapher, not on a Data"
	maxX := aNumber
]

{ #category : #accessing }
RTAbstractData >> maxY [
	^ maxY
]

{ #category : #accessing }
RTAbstractData >> maxY: aNumber [
	"PRIVATE METHOD. Use the method on a Grapher, not on a Data"
	maxY := aNumber
]

{ #category : #accessing }
RTAbstractData >> minX [
	^ minX
]

{ #category : #accessing }
RTAbstractData >> minX: aNumber [
	"PRIVATE METHOD. Use the method on a Grapher, not on a Data"
	minX := aNumber
]

{ #category : #accessing }
RTAbstractData >> minY [
	^ minY
]

{ #category : #accessing }
RTAbstractData >> minY: aNumber [
	"PRIVATE METHOD. Use the method on a Grapher, not on a Data"
	minY := aNumber
]

{ #category : #utility }
RTAbstractData >> resetMinAndMax [

	minY := self defaultMaxValue.
	maxY := self defaultMinValue.
	minX := self defaultMaxValue.
	maxX := self defaultMinValue.

]

{ #category : #hooks }
RTAbstractData >> resetShapeBuilderForBar [
	barBuilder := RTShapeBuilder new.
	barBuilder rectangle.
	
	"Default width that compute an appropriate width"
	barBuilder width: [ :object | 
		(builder extent x / (self numberOfPoints * self numberOfMetrics * 2)) asFloat ]
]

{ #category : #hooks }
RTAbstractData >> selectElementsForAddingBarTitle [
	"Return the collection of principal element for each element group.  
	This principal element is used to position the title label"
	self subclassResponsibility
]

{ #category : #scale }
RTAbstractData >> sqrt [
	self xSqrt.
	self ySqrt
]

{ #category : #scale }
RTAbstractData >> xLinear [
	xScale := RTLinearTransformation instance
]

{ #category : #scale }
RTAbstractData >> xLog [
	xScale := RTLogTransformation instance
]

{ #category : #accessing }
RTAbstractData >> xScale [
	^ xScale
]

{ #category : #accessing }
RTAbstractData >> xScale: oneArgBlockOrSymbol [
	xScale := oneArgBlockOrSymbol
]

{ #category : #scale }
RTAbstractData >> xSqrt [
	xScale := RTSqrtTransformation instance
]

{ #category : #scale }
RTAbstractData >> yLinear [
	yScale := RTLinearTransformation instance
]

{ #category : #scale }
RTAbstractData >> yLog [
	yScale := RTLogTransformation instance
]

{ #category : #accessing }
RTAbstractData >> yScale [
	^ yScale
]

{ #category : #accessing }
RTAbstractData >> yScale: oneArgBlockOrSymbol [
	yScale := oneArgBlockOrSymbol
]

{ #category : #scale }
RTAbstractData >> ySqrt [
	yScale := RTSqrtTransformation instance
]
