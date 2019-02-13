"
RTData renders bars and dots in vertical way
"
Class {
	#name : #RTHorizontalData,
	#superclass : #RTData,
	#category : #'Roassal2-Builder-Grapher-Core'
}

{ #category : #hooks }
RTHorizontalData >> addedInBuilder: aBuilder [
	self builder: aBuilder.
	builder shouldUseNiceLabelsForY: false.
]

{ #category : #initialization }
RTHorizontalData >> initialize [
	super initialize.
	self stack.
	self x: #yourself.
]

{ #category : #testing }
RTHorizontalData >> isStacked [
	"Return true if the data is stacked"
	^ self getValuesY = (1 to: self numberOfPoints)
]

{ #category : #rendering }
RTHorizontalData >> renderBarChartIn: aView [
	| centralDot positiveElements negativeElements |
	centralDot := self centralDot.
	elements := barBuilder elementsOn: self points.
	aView addAll: elements.
	interaction setUpElements: elements.
	RTMetricNormalizer new 
		elements: elements;
		normalizeElementY: [ :anElement | y rtValue: anElement ]
			min: 0
			max: builder extent y negated 
			minValue: (yScale rtValue: minY)
			maxValue: (yScale rtValue: maxY)
			using: xScale.
	positiveElements := OrderedCollection new.
	negativeElements := OrderedCollection new.
	elements do: [ :el | 
		((x rtValue: el) >= 0 
			ifTrue: [ positiveElements ]
			ifFalse: [ negativeElements ]) add: el ].
	"positive elements"
	positiveElements ifNotEmpty: [ 
		RTMetricNormalizer new
			elements: positiveElements; 
			normalizeElementWidth: [ :el | x rtValue: el ]
				min: 0
				max: builder extent x - centralDot position x
				minValue: 0
				maxValue: (xScale rtValue: maxX)
				using: xScale.
		RTAlignment new elements: positiveElements; fixedElement: centralDot; left].
	
	"negative elements"
	negativeElements ifNotEmpty: [ 
		RTMetricNormalizer new
			elements: negativeElements;
			normalizeElementWidth: [ :el | x rtValue: el ]
				min: centralDot position x
				max: 0
				minValue: (xScale rtValue: minX)
				maxValue: 0
				using: xScale.
		RTAlignment new elements: negativeElements; fixedElement: centralDot; right ].
	
	self executeUserDeclaredActions.
	
]

{ #category : #rendering }
RTHorizontalData >> renderDotAndLinesIn: aView [
	
	aView addAll: elements.
	interaction setUpElements: elements.
	RTMetricNormalizer new 
		elements: elements;
		normalizeElementY: [ :el | y rtValue: el ]
			min: 0
			max: builder extent y negated
			minValue: (yScale rtValue: minY)
			maxValue: (yScale rtValue: maxY)
			using: yScale.
	RTMetricNormalizer new
		elements: elements;
		normalizeElementX: [ :el | x rtValue: el ]
			min: 0
			max: builder extent x
			minValue: (xScale rtValue: minX)
			maxValue: (xScale rtValue: maxX)
			using: yScale.
	self renderLinesFor: elements in: aView.
	self executeUserDeclaredActions.
]

{ #category : #hooks }
RTHorizontalData >> resetShapeBuilderForBar [
	barBuilder := RTShapeBuilder new.
	barBuilder rectangle.
	
	"Default height that compute an appropriate height"
	barBuilder height: [ :object | 
		(builder extent y / (self numberOfPoints * 2)) asFloat ]
]

{ #category : #'public - configuration' }
RTHorizontalData >> stack [
	"Make all the elements from bottom to top"
	self yElement: [ :anElement | elements indexOf: anElement ]
]
