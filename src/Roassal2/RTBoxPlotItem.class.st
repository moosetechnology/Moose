"
I am an utility class to build a Box Plot visualization with RTBoxPlotBuilder
"
Class {
	#name : #RTBoxPlotItem,
	#superclass : #RTObject,
	#instVars : [
		'model',
		'values',
		'mean',
		'median',
		'q1',
		'q3',
		'interQuartileRange',
		'minRegularValue',
		'maxRegularValue',
		'outliers',
		'minOutlier',
		'maxOutlier'
	],
	#category : #'Roassal2-Builder-BoxPlot'
}

{ #category : #computing }
RTBoxPlotItem >> calculateMean [
	^ values sum / values size.
]

{ #category : #computing }
RTBoxPlotItem >> calculateMedian [
	| result size |
	result := Float nan.
	size := values size.
	size > 0 ifTrue: [ 
		(size % 2) = 1 ifTrue: [ 
			result := values at: (size/2 + 1) asInteger ] 
		ifFalse: [ |v1 v2|
			v1 := values at: size/2.
			v2 := values at: size/2+1.
			result := (v1 + v2)/2.0. ]
		 ].
	^ result.
]

{ #category : #computing }
RTBoxPlotItem >> calculateMedianStart: start end: end [
	|result size |
	result := Float nan.
	size := (end asInteger - start asInteger + 1).
	size > 0 ifTrue: [ 
		size = 1 ifTrue: [ ^ values at: start asInteger ].
		(size % 2) = 1 ifTrue: [ 
			result := values at: (start + (size /2)) asInteger
			 ] ifFalse: [ | v1 v2 |
			v1 := values at: (start + (size / 2)-1) asInteger.
			v2 := values at: (start + (size / 2)) asInteger.
			result := (v1 + v2) / 2.0 ] ].
	^ result
]

{ #category : #computing }
RTBoxPlotItem >> calculateQ1 [
	| result size |
	result := Float nan.
	size := values size.
	size > 0 ifTrue: [ 
		result := self calculateMedianStart: 1 end: (size /2). ].
	^ result
	
]

{ #category : #computing }
RTBoxPlotItem >> calculateQ3 [
	| result size |
	result := Float nan.
	size := values size.
	size > 0 ifTrue: [ 
		size % 2 = 1 ifTrue: [ result := self calculateMedianStart: (size / 2)+2 end: size ]
		ifFalse: [ result := self calculateMedianStart: (size/2)+1 end: size. ]
		 ].
	^ result
	
]

{ #category : #computing }
RTBoxPlotItem >> emptyValues [
	mean := median := q1 := q3 := maxOutlier := minOutlier := interQuartileRange := minRegularValue := maxRegularValue := 0 .
	outliers := #().
]

{ #category : #testing }
RTBoxPlotItem >> hasOutlier [
	^ outliers notEmpty 
]

{ #category : #accessing }
RTBoxPlotItem >> iqr [
	^ interQuartileRange
]

{ #category : #accessing }
RTBoxPlotItem >> maxOutlier [
	^ maxOutlier
]

{ #category : #accessing }
RTBoxPlotItem >> maxRegularValue [
	^ maxRegularValue
]

{ #category : #accessing }
RTBoxPlotItem >> mean [
	^ mean
]

{ #category : #accessing }
RTBoxPlotItem >> median [
	^ median
]

{ #category : #accessing }
RTBoxPlotItem >> minOutlier [
	^ minOutlier
]

{ #category : #accessing }
RTBoxPlotItem >> minRegularValue [
	^ minRegularValue
]

{ #category : #accessing }
RTBoxPlotItem >> model [
	^ model
]

{ #category : #accessing }
RTBoxPlotItem >> model: m [
	model := m
]

{ #category : #accessing }
RTBoxPlotItem >> outliers [
	^ outliers
]

{ #category : #accessing }
RTBoxPlotItem >> q1 [
	^ q1
]

{ #category : #accessing }
RTBoxPlotItem >> q3 [
	^ q3
]

{ #category : #accessing }
RTBoxPlotItem >> values [
	^ values 
]

{ #category : #accessing }
RTBoxPlotItem >> values: anArray [

	| upperOutlierThreshold lowerOutlierThreshold upperFaroutThreshold lowerFaroutThreshold |
	values := anArray sort.
	values size < 3 ifTrue: [ 
		self emptyValues.
		^ self ].
	mean := self calculateMean.
	median := self calculateMedian.
	q1 := self calculateQ1.
	q3 := self calculateQ3.
	interQuartileRange := q3 - q1.
	
	upperOutlierThreshold := q3 + (interQuartileRange * 1.5).
	lowerOutlierThreshold := q1 - (interQuartileRange * 1.5).
	
	upperFaroutThreshold := q3 + (interQuartileRange * 2.0).
	lowerFaroutThreshold := q1 -(interQuartileRange * 2.0).
	
	minRegularValue := Float infinity.
	maxRegularValue := Float infinity negated.
	minOutlier := Float infinity.
	maxOutlier := Float infinity negated.
	outliers := OrderedCollection new.
	
	values do: [ :value |
		value > upperOutlierThreshold ifTrue: [
			outliers add: value.
			((value > maxOutlier) and: [value <= upperFaroutThreshold ]) ifTrue: [ 
				maxOutlier := value ] ] ifFalse: [ 
		value < lowerOutlierThreshold ifTrue: [ 
			outliers add: value.
			((value < minOutlier ) and: [ value >= lowerFaroutThreshold ] ) ifTrue: [ 
				minOutlier := value ]
			 ] ifFalse: [ 
			minRegularValue := minRegularValue min: value.
			maxRegularValue := maxRegularValue max: value. ] ].
		
		minOutlier := minOutlier min: minRegularValue.
		maxOutlier := maxOutlier max: maxRegularValue.
	 ] 
	

]
