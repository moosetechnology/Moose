Class {
	#name : #RTDoubleGrapher,
	#superclass : #RTAbstractGrapher,
	#instVars : [
		'rightDataSets',
		'datasets',
		'axisConfigurationYRight'
	],
	#category : #'Roassal2-Builder-Grapher-Core'
}

{ #category : #adding }
RTDoubleGrapher >> add: aDataSet [
	"Essential method. Add a dataset into the grapher. Only non-empty set are considered"
	aDataSet numberOfPoints = 0 ifTrue: [ ^ self ].
	
	datasets add: aDataSet.
	aDataSet addedInBuilder: self
]

{ #category : #adding }
RTDoubleGrapher >> addRight: aDataSet [
	"Essential method. Add a dataset into the grapher. Only non-empty set are considered"
	aDataSet numberOfPoints = 0 ifTrue: [ ^ self ].
	
	rightDataSets add: aDataSet.
	aDataSet builder: self
]

{ #category : #'as yet unclassified' }
RTDoubleGrapher >> axisX [
	self checkIfDataSetHaveBeenAdded.
	^ super axisX
]

{ #category : #'as yet unclassified' }
RTDoubleGrapher >> axisY [
	self checkIfDataSetHaveBeenAdded.
	^ super axisY
]

{ #category : #'as yet unclassified' }
RTDoubleGrapher >> axisYRight [
	axisConfigurationYRight ifNil: [
		axisConfigurationYRight := self createAxisConfiguration ].
	axisConfigurationYRight
		tickLabelOffset: 30 @ 0.

	^ axisConfigurationYRight
]

{ #category : #utility }
RTDoubleGrapher >> checkIfDataSetHaveBeenAdded [
	datasets ifEmpty: [ self error: 'No dataset has been added?' ]
]

{ #category : #'min and max' }
RTDoubleGrapher >> computeMinAndMaxForX [
	super computeMinAndMaxForX.
	rightDataSets do: #computeMinAndMaxForX
]

{ #category : #'min and max' }
RTDoubleGrapher >> computeMinAndMaxForY [
	datasets do: #computeMinAndMaxForY.
	rightDataSets do: #computeMinAndMaxForY
]

{ #category : #accessing }
RTDoubleGrapher >> getMaxNumberOfPoints [
	"Return the maximum number of points any of the dataset has."
	^ datasets inject: 0 into: [ :max :ds | max max: ds numberOfPoints ]
]

{ #category : #'data sets' }
RTDoubleGrapher >> hasDataSet [
	^ self numberOfDataSets > 0
]

{ #category : #'min and max' }
RTDoubleGrapher >> homogenizeMinAndMax [
	
	minX := self minX.
	maxX := self maxX.
	minY := self minY.
	maxY := self maxY.
	datasets do: [ :ds |
		ds minX: minX.
		ds minY: minY.
		ds maxX: maxX.
		ds maxY: maxY. ]
]

{ #category : #initialization }
RTDoubleGrapher >> initialize [
	super initialize.
	
	"Collection of data sets"
	rightDataSets := OrderedCollection new.
	
	"Collection of data sets"
	datasets := OrderedCollection new.
	
]

{ #category : #accessing }
RTDoubleGrapher >> maxX [
	^ self hasDataSet 
		ifTrue: [ maxX max: self maxXFromDataSets ]
		ifFalse: [ maxX ]
]

{ #category : #'data sets' }
RTDoubleGrapher >> maxXFromDataSets [
	^ (datasets collect: #maxX) max
]

{ #category : #accessing }
RTDoubleGrapher >> maxY [
	^ self hasDataSet 
		ifTrue: [ maxY max: self maxYFromDataSets ]
		ifFalse: [ maxY ] 
]

{ #category : #'data sets' }
RTDoubleGrapher >> maxYFromDataSets [
	^ (datasets collect: #maxY) max
]

{ #category : #'as yet unclassified' }
RTDoubleGrapher >> maxYRight [
	^ (rightDataSets collect: #maxY) max
]

{ #category : #accessing }
RTDoubleGrapher >> minX [
	^ self hasDataSet 
		ifTrue: [ minX min: self minXFromDataSets ]
		ifFalse: [ minX ]
]

{ #category : #'data sets' }
RTDoubleGrapher >> minXFromDataSets [
	^ (datasets collect: #minX) min
]

{ #category : #accessing }
RTDoubleGrapher >> minY [
	^ self hasDataSet 
		ifTrue: [ minY min: self minYFromDataSets ]
		ifFalse: [ minY ] 
]

{ #category : #'data sets' }
RTDoubleGrapher >> minYFromDataSets [
	^ (datasets collect: #minY) min
]

{ #category : #'as yet unclassified' }
RTDoubleGrapher >> minYRight [
	self assert: [ rightDataSets notEmpty ] description: 'You need to specify at least one data set for the right axis'.
	^ (rightDataSets collect: #minY) min
]

{ #category : #accessing }
RTDoubleGrapher >> numberOfDataSets [
	^ datasets size
]

{ #category : #utility }
RTDoubleGrapher >> renderAxis [
	| centralPoint aPoint anotherPoint |
	super renderAxis.
	
	centralPoint := self extent x @ self centralPoint y.
	axisConfigurationYRight positionLabel: [ :aLabel :aTick | aLabel translateTo: aTick position + (40 @ 0) ];
		minValue:
				(self minYRight > 0
						ifTrue: [ 0 ]
						ifFalse: [ self minYRight ]);
		maxValue: self maxYRight.
	
	aPoint := centralPoint x @ 0.
	anotherPoint := centralPoint x @ extent y negated.
	axisConfigurationYRight fromPoint: aPoint.
	axisConfigurationYRight toPoint: anotherPoint.
	axisConfigurationYRight axisFrom: aPoint to: anotherPoint
]

{ #category : #hooks }
RTDoubleGrapher >> renderIn: aView [
	datasets do: #computeMinAndMax.
	rightDataSets do:#computeMinAndMax.
	self homogenizeMinAndMax.
	self defineAxesIfNecessary.
	self renderAxis.
	datasets do: [ :aDataset | aDataset renderIn: aView ].
	rightDataSets do: [ :aDataset | aDataset renderIn: aView ]
]

{ #category : #'as yet unclassified' }
RTDoubleGrapher >> shouldUseNiceLabelsForX: aBool [
	"Not much to do for now... This class has to be rewritten completely"
]
