"
Display the standard deviation of the data

-=-=-=-=
b := RTGrapher new.
ds := RTDataSet new. 
ds dotShape color: Color red. 
ds points: #(5 1 20 8).
b add: ds.
b addDecorator: (RTAverageDecorator new withLabel; labelConvertion: [ :aValue | 'average = ', aValue asFloat asString ]).
b addDecorator: (RTStandardDeviationDecorator new lineColor: Color blue) .
b
-=-=-=-=
"
Class {
	#name : #RTStandardDeviationDecorator,
	#superclass : #RTAbstractAverageDecorator,
	#category : #'Roassal2-Builder-Grapher-Decorators'
}

{ #category : #'drawing-hooks' }
RTStandardDeviationDecorator >> render [
	| values average stdev from to |
	values := self datasetValues.
	"Standard Deviation requires at least two values."
	values size < 2
		ifTrue: [ ^ self ].
	average := values average.
	stdev := values stdev.
	from := builder getPixelPositionOf: builder minX @ (average + stdev).
	to := builder getPixelPositionOf: builder maxX @ (average + stdev).
	self lineFrom: from to: to.
	from := builder getPixelPositionOf: builder minX @ (average - stdev).
	to := builder getPixelPositionOf: builder maxX @ (average - stdev).
	self lineFrom: from to: to.
	shouldHaveLabel
		ifTrue: [ self label: (labelBlock rtValue: average) asString above: to ]
]
