Class {
	#name : #RTAbstractDataSet,
	#superclass : #RTObject,
	#instVars : [
		'points',
		'x',
		'y',
		'builder',
		'dotBuilder',
		'histogramBuilder',
		'lineBuilder',
		'minX',
		'maxX',
		'minY',
		'maxY',
		'shouldConnect',
		'interaction',
		'elementActions'
	],
	#category : #'Roassal2-Builder-Grapher-Core'
}

{ #category : #hooks }
RTAbstractDataSet >> addedInBuilder: aBuilder [
	self builder: aBuilder
]

{ #category : #utility }
RTAbstractDataSet >> adjustMinAndMaxValues [
	"Values are adjusted to always have 0 @ 0 in the chart"
	minY > 0
		ifTrue: [ minY := 0 ].
	maxY < 0
		ifTrue: [ maxY := 0 ].
		
	minX > 0
		ifTrue: [ minX := 0 ].
	maxX < 0
		ifTrue: [ maxX := 0 ].
]

{ #category : #accessing }
RTAbstractDataSet >> builder: aBuilder [
	builder := aBuilder 
]

{ #category : #'min and max' }
RTAbstractDataSet >> computeMinAndMax [
	self computeMinAndMaxForX.
	self computeMinAndMaxForY.
]

{ #category : #'min and max' }
RTAbstractDataSet >> computeMinAndMaxForX [
	| computed |
	computed := points collect: x.
	minX := computed min.
	maxX := computed max.

	(minX < 0 and: [ maxX < 0 ]) ifTrue: [ maxX := 0 ].
	(minX > 0 and: [ maxX > 0 ]) ifTrue: [ minX := 0 ].
	


]

{ #category : #'min and max' }
RTAbstractDataSet >> computeMinAndMaxForY [
	| computed |
	computed := points collect: y.
	self assert: [ computed allSatisfy: [ :obj | obj isKindOf: Number ] ] description: 'You have provided objects that are not number. Please adjust what you provide to #points: #x: and #y:'.
	minY := computed min.
	maxY := computed max.
	
	(minY < 0 and: [ maxY < 0 ]) ifTrue: [ maxY := 0 ].
	(minY > 0 and: [ maxY > 0 ]) ifTrue: [ minY := 0 ].
	
]

{ #category : #'public - lines' }
RTAbstractDataSet >> connect [
	shouldConnect := true
]

{ #category : #'public - lines' }
RTAbstractDataSet >> connectColor: aColor [
	"Draw a line between each point, of a given color"
	^ self connectUsing: (RTLine new color: aColor)
]

{ #category : #'public - lines' }
RTAbstractDataSet >> connectUsing: aShape [
	"Connect all the point, using a particular shape"
	lineBuilder shape: aShape.
	self connect
]

{ #category : #initialization }
RTAbstractDataSet >> defaultMaxValue [
	^ 1000000
]

{ #category : #initialization }
RTAbstractDataSet >> defaultMinValue [
	^ -1000000
]

{ #category : #'public - dots' }
RTAbstractDataSet >> dotShape [
	^ dotBuilder
]

{ #category : #'public - effects' }
RTAbstractDataSet >> dotSize: metricAsBlockOrSymbol min: minValue max: maxValue using: transformation [
	"Set the size of the dots for each element"
	elementActions add: [ :elements |
		RTMetricNormalizer new
			elements: elements;
			normalizeSize: metricAsBlockOrSymbol min: minValue max: maxValue using: transformation ]
]

{ #category : #hooks }
RTAbstractDataSet >> getPixelPositionOf: aPoint [
	"Return the position in the Roassal view of a point"

	| anX anY |
	anX := RTMetricNormalizer new
		getValue: aPoint x min: 0 max: builder extent x minValue: minX maxValue: maxX.
	anY := RTMetricNormalizer new
		getValue: aPoint y min: 0 max: builder extent y negated minValue: minY maxValue: maxY.
			
	^ anX @ anY
]

{ #category : #hooks }
RTAbstractDataSet >> getPositionFromPixelPosition: aPoint [
	"Return the position in the graph from a position in the Roassal view of a point"

	| anX anY |
	anX := RTMetricNormalizer new
		getValue: aPoint x min: minX max: maxX minValue: 0 maxValue: builder extent x.
	anY := RTMetricNormalizer new
		getValue: aPoint y min: minY max: maxY minValue: 0 maxValue: builder extent y.
			
	^ anX @ anY negated
]

{ #category : #accessing }
RTAbstractDataSet >> getValuesX [
	^ points collect: x
]

{ #category : #accessing }
RTAbstractDataSet >> getValuesY [
	^ points collect: y
]

{ #category : #'public - effects' }
RTAbstractDataSet >> highlightIf: aOneArgBlock using: secondOneArgBlock [
	"
	aOneArgBlock is the a one-arg condition
	If true, secondOneArgBlock is then used for the label
	"

	elementActions add: [ :elements |
		elements do: [ :element |
		(aOneArgBlock rtValue: element model) ifTrue: [ 
			element @ (RTLabeled new text: [ :model | secondOneArgBlock rtValue: model ]; setAsHighlightable).
		] ] ]
]

{ #category : #initialization }
RTAbstractDataSet >> initialize [
	super initialize.
	points := #().
	x := #yourself.
	y := #yourself.
	self resetMinAndMax.
 
	dotBuilder := RTShapeBuilder new.
	dotBuilder circle size: 5.
	
	"Maybe this can be lazily done"
	histogramBuilder := RTShapeBuilder new.
	histogramBuilder rectangle.
	
	"Maybe this can be lazily done"
	lineBuilder := RTShapeBuilder new.
	
	interaction := RTInteractionBuilder new.
	interaction popup.
	shouldConnect := false.
	
	elementActions := OrderedCollection new.
]

{ #category : #accessing }
RTAbstractDataSet >> interaction [
	^ interaction
]

{ #category : #accessing }
RTAbstractDataSet >> lineShape [
	^ lineBuilder
]

{ #category : #accessing }
RTAbstractDataSet >> maxX [
	^ maxX
]

{ #category : #accessing }
RTAbstractDataSet >> maxX: anObject [
	maxX := anObject
]

{ #category : #accessing }
RTAbstractDataSet >> maxY [
	^ maxY
]

{ #category : #accessing }
RTAbstractDataSet >> maxY: anObject [
	maxY := anObject
]

{ #category : #accessing }
RTAbstractDataSet >> minX [
	^ minX
]

{ #category : #accessing }
RTAbstractDataSet >> minX: anObject [
	minX := anObject
]

{ #category : #accessing }
RTAbstractDataSet >> minY [
	^ minY
]

{ #category : #accessing }
RTAbstractDataSet >> minY: anObject [
	minY := anObject
]

{ #category : #'public - dots' }
RTAbstractDataSet >> noDot [
	"No dot are shown"
	self dotShape rectangle size: 0
]

{ #category : #accessing }
RTAbstractDataSet >> numberOfPoints [
	"Return the number of points the dataset is representing"
	^ points size
]

{ #category : #accessing }
RTAbstractDataSet >> points [
	^ points
]

{ #category : #accessing }
RTAbstractDataSet >> points: objects [
	points := objects
]

{ #category : #hooks }
RTAbstractDataSet >> renderDotAndLinesIn: aView [

	| elements |
	elements := dotBuilder elementsOn: points.
	builder view addAll: elements.
	interaction setUpElements: elements.
	
	RTMetricNormalizer new
		elements: elements;
		normalizeX: [ :model | x rtValue: model ]
			min: 0
			max: builder extent x
			minValue: minX
			maxValue: maxX.
			
	RTMetricNormalizer new
		elements: elements;
		normalizeY: [ :model | y rtValue: model ]
			min: 0
			max: builder extent y negated
			minValue: minY
			maxValue: maxY.
			
	elementActions do: [ :act | act rtValue: elements ].
			
	self renderLinesFor: elements in: aView
]

{ #category : #hooks }
RTAbstractDataSet >> renderIn: aView [

	"This is a bit ugly. Maybe having a class hierarchy would be better"
	self renderDotAndLinesIn: aView.

]

{ #category : #utility }
RTAbstractDataSet >> renderLinesFor: elements in: aView [
	"Render the lines between elements if necessary"
	| t l |
	shouldConnect ifFalse: [ ^ self ].

	t := elements first.
	elements allButFirst
		do: [ :tt | 
			l := lineBuilder edgeFrom: t to: tt.
			interaction setUpElement: l.
			aView add: l.
			t := tt ]
]

{ #category : #utility }
RTAbstractDataSet >> resetMinAndMax [

	minY := self defaultMaxValue.
	maxY := self defaultMinValue.
	minX := self defaultMaxValue.
	maxX := self defaultMinValue.

]

{ #category : #accessing }
RTAbstractDataSet >> shouldConnect [
	^ shouldConnect
]

{ #category : #accessing }
RTAbstractDataSet >> x: blockOrSymbol [
	x := blockOrSymbol
]

{ #category : #accessing }
RTAbstractDataSet >> y: blockOrSymbol [
	y := blockOrSymbol
]
