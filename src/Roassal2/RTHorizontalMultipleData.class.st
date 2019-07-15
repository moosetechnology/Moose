"
RTHorizontalMultipleData handles multiple metrics per data points. It is rendered using bar chart.

[[[ 
| b d |			
b := RTGrapher new.

d := RTHorizontalMultipleData new.
d barShape color: Color blue.
d points: #( #('hello' 1 2 1) #('world' 2 4 2) #('bonjour' 3 5 4) #('Gutten Morgen' -1 4 -5)).
d addMetric: #second.
d addMetric: #third.
d addMetric: #fourth.

""d barChartWithBarCenteredTitle: #first.""
d barChartWithBarTitle: #first rotation: -30.

b add: d.

b
 ]]]
"
Class {
	#name : #RTHorizontalMultipleData,
	#superclass : #RTAbstractMultipleData,
	#category : #'Roassal2-Builder-Grapher-Core'
}

{ #category : #rendering }
RTHorizontalMultipleData >> renderIn: aView [

	"We need to do the layout here"

	| centralDot positiveElements negativeElements  |
	centralDot := self centralDot.

	RTMetricNormalizer new
		elements: elements;
		normalizeElementX: [ :anElement | x rtValue: anElement ]
			min: 0
			max: builder extent x
			minValue: minX
			maxValue: maxX + 1.
	"We have 'maxX + 1' because we do not want the last bar on the extremity of the X-Axis"

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
					maxValue: maxY ].

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
					minValue: minY
					maxValue: 0.
			RTAlignment new elements: negativeElements; fixedElement: centralDot; top.
			"TRConstraint use: centralDot alignFromTop: negativeElements "].	"We set the actions, if any"
	elementActions do: [ :act | act rtValue: elements ]
]

{ #category : #hooks }
RTHorizontalMultipleData >> selectElementsForAddingBarTitle [
	"Return the collection of principal element for each element group.  
	This principal element is used to position the title label"
	^ groupedElements collect: [ :es | es at: (es size / 2) asInteger + 1 ]
]
