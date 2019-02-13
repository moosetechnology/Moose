"
RTAverageDecorator is a decorator that indicates the average of a set of values.

Consider the following example:

-=-=-=-=
b := RTGrapher new.
ds := RTDataSet new. 
ds dotShape color: Color red. 
ds points: #(5 1 20 8).
b add: ds.
b addDecorator: (RTAverageDecorator new withLabel; labelConvertion: [ :aValue | 'average = ', aValue asFloat asString ]).
b.
-=-=-=-=
"
Class {
	#name : #RTAverageDecorator,
	#superclass : #RTAbstractAverageDecorator,
	#category : #'Roassal2-Builder-Grapher-Decorators'
}

{ #category : #'drawing-hooks' }
RTAverageDecorator >> render [
	| values average from to |
	values := self datasetValues.
	average := values average.
	from := builder getPixelPositionOf: builder minX @ average.
	to := builder getPixelPositionOf: builder maxX @ average.
	self lineFrom: from to: to.
	
	shouldHaveLabel ifTrue: [ 
		self label: ((labelBlock rtValue: average) asString) above: to.
	]
]
