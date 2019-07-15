"
RTHorizontalAverageDecorator is a decorator that indicates the average of a set of values.

Consider the following example:

-=-=-=-=
b := RTGrapher new.
ds := RTDataSet new. 
ds dotShape color: Color red. 
ds points: #(5 1 20 8).
b add: ds.
b addDecorator: (RTHorizontalAverageDecorator new withLabel; labelConvertion: [ :aValue | 'average = ', aValue asFloat asString ]).
b.
-=-=-=-=
"
Class {
	#name : #RTHorizontalAverageDecorator,
	#superclass : #RTAbstractAverageDecorator,
	#category : #'Roassal2-Builder-Grapher-Decorators'
}

{ #category : #'drawing-hooks' }
RTHorizontalAverageDecorator >> render [
	| values average from to |
	values := self datasetValuesX.
	average := values average.
	from := builder getPixelPositionOf: average @ builder minY.
	to := builder getPixelPositionOf: average @ builder maxY.
	self lineFrom: from to: to.
	
	shouldHaveLabel ifTrue: [ 
		self label: ((labelBlock rtValue: average) asString) above: to.
	]
]
