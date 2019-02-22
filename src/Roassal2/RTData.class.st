"
A data set for which each element has to be plotted using two functions, one against the X-axis and another against the Y-axis), is modelled using the class RTData. 

-=-=-=
""Since no x: and y: have been specified, it simply lines up all the values""
b := RTGrapher new.
ds := RTData new. 
ds dotShape color: Color red. 
ds points: #(5 1 20 8).
b add: ds.
b.
-=-=-=

-=-=-=
b := RTGrapher new.
ds := RTData new. 
ds dotShape color: Color red. 
ds points: #(5 1 20 8).
ds y: [ :x | x * x ].
b add: ds.
b.
-=-=-=

-=-=-=
b := RTGrapher new.
ds := RTData new. 
ds dotShape color: Color red. 
ds points: (1 to: 100).
ds y: [ :x | x * x ].
b add: ds.
b.
-=-=-=

-=-=-=
""Use objects instead of numerical values""
b := RTGrapher new.
ds := RTData new. 
ds dotShape color: (Color red alpha: 0.3). 
ds points: Collection withAllSubclasses.
ds y: #numberOfLinesOfCode.
ds x: #numberOfMethods.
b add: ds.
b.
-=-=-=
"
Class {
	#name : #RTData,
	#superclass : #RTAbstractData,
	#instVars : [
		'dotBuilder',
		'lineBuilder',
		'shouldConnect',
		'interaction',
		'shouldHaveBars',
		'sampling'
	],
	#category : #'Roassal2-Builder-Grapher-Core'
}

{ #category : #hooks }
RTData >> addedInBuilder: aBuilder [
	super addedInBuilder: aBuilder.
	aBuilder shouldUseNiceLabelsForX: false
]

{ #category : #utility }
RTData >> adjustMinAndMaxValues [
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

{ #category : #'public - bar shape' }
RTData >> barShape [
	shouldHaveBars := true.
	^ super barShape
]

{ #category : #'public - lines' }
RTData >> connect [
	"Connect the dot to form a connected line"
	shouldConnect := true
]

{ #category : #'public - lines' }
RTData >> connectColor: aColor [
	"Draw a line between each point, of a given color"
	^ self connectUsing: (RTLine new color: aColor)
]

{ #category : #'public - lines' }
RTData >> connectUsing: aShape [
	"Connect all the point, using a particular shape"
	lineBuilder shape: aShape.
	self connect
]

{ #category : #'public - dots' }
RTData >> dotShape [
	"Return the shape builder that is used to render a dot, i.e., a data point"
	^ dotBuilder
]

{ #category : #'public - effects' }
RTData >> dotSize: metricAsBlockOrSymbol min: minValue max: maxValue using: transformation [
	"Set the size of the dots for each element"
	elementActions add: [ :elems |
		RTMetricNormalizer new
			elements: elems;
			normalizeSize: metricAsBlockOrSymbol min: minValue max: maxValue using: transformation ]
]

{ #category : #utility }
RTData >> executeUserDeclaredActions [
	"Execute the actions on all the elements (i.e., dots)"
	elementActions do: [ :act | act rtValue: elements ]
]

{ #category : #accessing }
RTData >> getSamplingIfNecessaryOf: objects [
	"Return a sampling of the objects if necessary. Consider: 
	
	d := RTData new.
	d samplingIfMoreThan: 100.
	d points: (1 to: 1000).
	d y: #yourself.
	g := RTGrapher new.
	g add: d.
	g
	"
	^ sampling
		ifNil: [ objects ]
		ifNotNil: [ | r indexes |
			r := Random seed: 42.
			indexes := (1 to: sampling)
				collect: [ :i | (1 to: objects size) atRandom: r ].
			(indexes asSet sortedAs: #yourself)
				collect: [ :in | objects at: in ] ]
]

{ #category : #accessing }
RTData >> getValuesX [
	^ elements collect: x
]

{ #category : #accessing }
RTData >> getValuesY [
	^ elements collect: y
]

{ #category : #'public - effects' }
RTData >> highlightIf: aOneArgBlock using: secondOneArgBlock [
	"
	aOneArgBlock is the a one-arg condition
	If true, secondOneArgBlock is then used for the label
	"

	elementActions add: [ :elems |
		elems do: [ :element |
		(aOneArgBlock rtValue: element model) ifTrue: [ 
			element @ (RTLabeled new text: [ :model | secondOneArgBlock rtValue: model ]; setAsHighlightable).
		] ] ]
]

{ #category : #obsolete }
RTData >> histogramWithBarTitle: aBlockOrSymbol rotation: rotationInDegree color: aColor [
	"Obsolete: use #barChartWithBarTitle: instead"
	"Draw an histogram with title"
	self barShape.
	elementActions add: [ :elems | 
		| lbl |
		elems do: [ :e |
			lbl := (RTLabel new text: aBlockOrSymbol; color: aColor) elementOn: e model.
			lbl rotateByDegrees: rotationInDegree.
			TRConstraint move: lbl below: e.
			lbl translateBy: (lbl width / -2 @ 0) + (5 @ 0).
			elems anyOne view add: lbl.
		] ].
	 
]

{ #category : #initialization }
RTData >> initialize [
	"Maybe this can be lazily done"

	super initialize.
	elements := #().
	self stack.
	self y: #yourself.
	self resetMinAndMax.
	self resetShapeBuilderForDot.
	self resetShapeBuilderForBar.
	self resetShapeBuilderForLine.
	self resetInteractionBuilder.
	shouldConnect := false.
	shouldHaveBars := false. 
]

{ #category : #accessing }
RTData >> interaction [
	^ interaction
]

{ #category : #testing }
RTData >> isStacked [
	"Return true if the data is stacked"
	^ self getValuesX = (1 to: self numberOfPoints)
]

{ #category : #accessing }
RTData >> lineShape [
	^ lineBuilder
]

{ #category : #'public - dots' }
RTData >> moveDotInFront [
	"
	Make the dots placed in front of the lines (if connected). Per default, dots are behind. Here is an example.
	
	b := RTGrapher new.
	ds := RTData new.
	ds dotShape color: Color red; size: 10.
	ds points: (Collection withAllSubclasses copyFrom: 1 to: 10).
	ds y: #numberOfMethods.
	ds connectColor: Color blue. 
	ds moveDotInFront.
	b add: ds.

	b
	"

	elementActions add: [ :elems |
		elems pushFront ]
]

{ #category : #obsolete }
RTData >> noAlignmentOffset [

	"This offset is used when a stacked bar chart is used. This alignmentOffset may be removed in case the barchart has to be aligned with other data sets, such as line charts."
	"You should use this method in case you wish you combine the chart with line or dots. For example:
	
b := RTGrapher new.

d := RTData new.
d points: #(3 4 3.5).
d barShape.
d noAlignmentOffset.
b add: d.

d := RTData new.
d points: #(3 4 3.5).
d connectColor: Color red.
b add: d.

b
	"
	"alignmentOffset := 0"
]

{ #category : #'public - dots' }
RTData >> noDot [
	"No dot are shown"
	self dotShape rectangle size: 0
]

{ #category : #accessing }
RTData >> numberOfPoints [
	"Return the number of points the dataset is representing"
	^ elements size
]

{ #category : #'public - bar shape' }
RTData >> offsetForBarCharts [
	"Make all the elements from left to right"
	self xElement: [ :anElement | (elements indexOf: anElement) - 0.5 ].

]

{ #category : #accessing }
RTData >> points [
	^ elements collect: #model
]

{ #category : #accessing }
RTData >> points: objects [
	"This is an essential method.
	Return the elements that have been added."

	| objectsToConsider |
	objectsToConsider := self getSamplingIfNecessaryOf: objects.
	elements := dotBuilder elementsOn: objectsToConsider.
	^ elements
]

{ #category : #hooks }
RTData >> renderBarChartIn: aView [
	| centralDot positiveElements negativeElements |
	centralDot := self centralDot.
	
	elements := barBuilder elementsOn: self points.
	builder view addAll: elements.
	interaction setUpElements: elements.
	RTMetricNormalizer new
		elements: elements;
		normalizeElementX: [ :anElement | x rtValue: anElement ]
			min: 0
			max: builder extent x
			minValue: (xScale rtValue: minX)
			maxValue: (xScale rtValue: maxX)
			using: xScale.


	"We treat the element with a positive value"
	positiveElements := elements select: [ :el | (y rtValue: el) >= 0 ].
	positiveElements
		ifNotEmpty: [
			RTMetricNormalizer new
				elements: positiveElements;
				normalizeElementHeight: [ :anElement | y rtValue: anElement ]
					min: 0
					max: builder extent y + centralDot position y
					minValue: 0
					maxValue: (yScale rtValue: maxY)
					using: yScale ].

	RTAlignment new elements: positiveElements; fixedElement: centralDot; bottom.
	"TRConstraint use: centralDot alignFromBottom: positiveElements.	"
		
	"We treat the element with a negative value"
	negativeElements := elements copyWithoutAll: positiveElements.
	negativeElements
		ifNotEmpty: [ 
			RTMetricNormalizer new
				elements: negativeElements;
				normalizeElementHeight: [ :anElement | y rtValue: anElement ]
					min: centralDot position y negated 
					max: 0
					minValue: (yScale rtValue: minY)
					maxValue: 0
					using: yScale.
			RTAlignment new elements: negativeElements; fixedElement: centralDot; top.
			"TRConstraint use: centralDot alignFromTop: negativeElements "].	
	
	"We set the actions, if any"
	elementActions do: [ :act | act rtValue: elements ]
]

{ #category : #hooks }
RTData >> renderDotAndLinesIn: aView [
	builder view addAll: elements.
	interaction setUpElements: elements.
	RTMetricNormalizer new
		elements: elements;
		normalizeElementX: [ :anElement | x rtValue: anElement ]
			min: 0
			max: builder extent x
			minValue: (xScale rtValue: minX)
			maxValue: (xScale rtValue: maxX)
			using: xScale.
	RTMetricNormalizer new
		elements: elements;
		normalizeElementY: [ :anElement | y rtValue: anElement ]
			min: 0
			max: builder extent y negated
			minValue: (yScale rtValue: minY)
			maxValue: (yScale rtValue: maxY)
			using: yScale.
	self renderLinesFor: elements in: aView.
	self executeUserDeclaredActions
]

{ #category : #hooks }
RTData >> renderIn: aView [

	"This is a bit ugly. Maybe having a class hierarchy would be better"
	shouldHaveBars 
		ifTrue: [ self renderBarChartIn: aView ]
		ifFalse: [ self renderDotAndLinesIn: aView ]
	

]

{ #category : #utility }
RTData >> renderLinesFor: elems in: aView [
	"Render the lines between elements if necessary"
	| t l |
	shouldConnect ifFalse: [ ^ self ].

	t := elems first.
	elems allButFirst
		do: [ :tt | 
			l := lineBuilder edgeFrom: t to: tt.
			interaction setUpElement: l.
			aView add: l.
			t := tt ]
]

{ #category : #initialization }
RTData >> resetInteractionBuilder [
	interaction := RTDataInteractionBuilder new.
	interaction dataSet: self.
	interaction popup
]

{ #category : #hooks }
RTData >> resetShapeBuilderForBar [
	super resetShapeBuilderForBar.
	
	"Default width that compute an appropriate width"
	barBuilder width: [ :object | 
		(builder extent x / (self numberOfPoints * 2)) asFloat ]
]

{ #category : #initialization }
RTData >> resetShapeBuilderForDot [
	dotBuilder := RTShapeBuilder new.
	dotBuilder circle size: 5
]

{ #category : #initialization }
RTData >> resetShapeBuilderForLine [
	lineBuilder := RTShapeBuilder new
]

{ #category : #'public - configuration' }
RTData >> samplingIfMoreThan: aThreshold [
	"This method is useful in case there are many elements to be visualized.
	If the number of objects provided to #points: is greater than aThreshold, then 
	aThreshold elements are picked from the objects.
	
	This coudl be improved. For example, different strategies to do the sampling can be envisioned.
	"
	sampling := aThreshold
]

{ #category : #hooks }
RTData >> selectElementsForAddingBarTitle [
	"Return the collection of principal element for each element group.  
	This principal element is used to position the title label"
	^ elements
]

{ #category : #accessing }
RTData >> shouldConnect [
	^ shouldConnect
]

{ #category : #accessing }
RTData >> shouldHaveBars [
	"Return true if bar are used"
	^ shouldHaveBars
]

{ #category : #'public - configuration' }
RTData >> stack [
	"Make all the elements from left to right"
	self xElement: [ :anElement | elements indexOf: anElement ] 
]

{ #category : #accessing }
RTData >> x: blockOrSymbol [
	blockOrSymbol isSymbol
		ifTrue: [ self
				xElement: [ :anElement | 
					anElement model isDictionary
						ifTrue: [ anElement model at: blockOrSymbol ]
						ifFalse: [ blockOrSymbol rtValue: anElement model ] ] ]
		ifFalse: [ self xElement: [ :anElement | blockOrSymbol rtValue: anElement model ] ]
]

{ #category : #accessing }
RTData >> xElement: blockOrSymbol [
	x := blockOrSymbol
]

{ #category : #accessing }
RTData >> y [
	^ y
]

{ #category : #accessing }
RTData >> y: blockOrSymbol [
	blockOrSymbol isSymbol
		ifTrue: [ self
				yElement: [ :anElement | 
					anElement model isDictionary
						ifTrue: [ anElement model at: blockOrSymbol ]
						ifFalse: [ blockOrSymbol rtValue: anElement model ] ] ]
		ifFalse: [ self yElement: [ :anElement | blockOrSymbol rtValue: anElement model ] ]
]

{ #category : #accessing }
RTData >> yElement: blockOrSymbol [
	y := blockOrSymbol
]
