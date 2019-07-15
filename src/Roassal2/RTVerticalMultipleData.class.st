"
RTVerticalMultipleData represents a group of data points that are vertically located. Each group has the same X value.

Negative data are not allowed.

Here is an example:
[[[
| b d |			
b := RTGrapher new.

d := RTVerticalMultipleData new.
d points: #( #('hello' 1 2 1) #('world' 2 4 2 ) #('bonjour' 3 5 4) #('bonjour' 3 5 4 ) #('bonjour' 3 5 4)).
d addMetric: #second.
d addMetric: #third.
d addMetric: #fourth.

d barChartWithBarTitle: #first rotation: -30.
b add: d.

b			
]]] 

Here another example:
[[[
| b d classes |
classes := (Collection withAllSubclasses reverseSortedAs: #numberOfMethods) first:	10.
			
b := RTGrapher new.

d := RTVerticalMultipleData new.
d points: classes.
d addMetric: #numberOfLinesOfCode.
d addMetric: #numberOfMethods.

d barChartWithBarTitle: #name rotation: -30.
b add: d.

b
]]]			
"
Class {
	#name : #RTVerticalMultipleData,
	#superclass : #RTAbstractMultipleData,
	#category : #'Roassal2-Builder-Grapher-Core'
}

{ #category : #'min and max' }
RTVerticalMultipleData >> computeMinAndMaxForY [
	| computed |
	computed := groupedElements collect: [ :g | (g collect: y) sum ].
	self assert: [ computed allSatisfy: [ :obj | obj isKindOf: Number ] ] description: 'You have provided objects that are not number. Please adjust what you provide to #points: #x: and #y:'.
	minY := computed min.
	maxY := computed max.
	
	(minY < 0 and: [ maxY < 0 ]) ifTrue: [ maxY := 0 ].
	(minY > 0 and: [ maxY > 0 ]) ifTrue: [ minY := 0 ].
	
]

{ #category : #rendering }
RTVerticalMultipleData >> renderIn: aView [

	"We need to do the layout here"

	| centralDot |
	centralDot := self centralDot.
	
	"We compute the height"
	RTMetricNormalizer new
		elements: elements;
		normalizeElementHeight: [ :anElement | y rtValue: anElement ]
			min: 0
			max: builder extent y + centralDot position y
			minValue: 0
			maxValue: maxY.

	"We stack the elements"
	groupedElements do: [ :groupOfEl | RTVerticalLineLayout new gapSize: 0; on: groupOfEl ].
	RTAlignment new elements: groupedElements; fixedElement: centralDot; bottom.

	"We horizontally position the elements"
	RTMetricNormalizer new
		elements: groupedElements;
		normalizeElementX: [ :aGroupOfElement | x rtValue: aGroupOfElement first ]
			min: 0
			max: builder extent x
			minValue: minX
			maxValue: maxX + 1.
	"We have 'maxX + 1' because we do not want the last bar on the extremity of the X-Axis"

	elementActions do: [ :act | act rtValue: (groupedElements collect: #first) ]
]

{ #category : #hooks }
RTVerticalMultipleData >> selectElementsForAddingBarTitle [
	"Return the collection of principal element for each element group.  
	This principal element is used to position the title label"
	^ groupedElements collect: #last
]
