"
A RTRelativeAxisBuilder add  X,Y axis to the view, given a collection of RTElements.

Instance Variables
	margin:		<Object>
	maxX:		<Object>
	maxY:		<Object>
	minX:		<Object>
	minY:		<Object>
	objects:		<Object>
	xAxisConfiguration:		<Object>
	yAxisConfiguration:		<Object>

margin
	- xxxxx

maxX
	- xxxxx

maxY
	- xxxxx

minX
	- xxxxx

minY
	- xxxxx

objects
	- xxxxx

xAxisConfiguration
	- xxxxx

yAxisConfiguration
	- xxxxx

"
Class {
	#name : #RTAxisAdaptedBuilder,
	#superclass : #RTBuilder,
	#instVars : [
		'objects',
		'minX',
		'maxX',
		'minY',
		'maxY',
		'margin',
		'xAxisConfiguration',
		'yAxisConfiguration'
	],
	#category : #'Roassal2-Builder-AxisAdapted'
}

{ #category : #'as yet unclassified' }
RTAxisAdaptedBuilder >> axisOrigin [
	
	^ (minX - self margin)@(minY - self margin)
	
	
]

{ #category : #'private-axis' }
RTAxisAdaptedBuilder >> axisXFrom: anOriginPoint to: aPoint [
	| config |
	(self xAxisConfiguration fromPoint) ifNil: [ self xAxisDefaultConfigurationOrigin: anOriginPoint toPoint: aPoint].
	
	config := self xAxisConfiguration.
	RTAxisRenderer new builder: self; config: config; axisFrom: anOriginPoint to: aPoint.
]

{ #category : #'private-axis' }
RTAxisAdaptedBuilder >> axisYFrom: anOriginPoint to: aPoint [
	| config |
	(self yAxisConfiguration fromPoint) ifNil: [ self yAxisDefaultConfigurationOrigin: anOriginPoint toPoint: aPoint].
	
	config := self yAxisConfiguration.
	RTAxisRenderer new builder: self; config: config; axisFrom: anOriginPoint to: aPoint.
]

{ #category : #view }
RTAxisAdaptedBuilder >> configureView: aView [
	aView @ RTDraggableView.
]

{ #category : #'as yet unclassified' }
RTAxisAdaptedBuilder >> createAxis [
	| origin xAxisPoint yAxisPoint |
		
	origin := self axisOrigin.
	xAxisPoint := self xAxisPoint: (origin y).
	yAxisPoint := self yAxisPoint: (origin x).

	self axisXFrom: origin to: xAxisPoint.
	self axisYFrom: origin to: yAxisPoint.
]

{ #category : #utility }
RTAxisAdaptedBuilder >> createAxisConfiguration [
	| newAxis |
	newAxis := RTAxisConfiguration new.
	newAxis builder: self.
	^ newAxis
]

{ #category : #hooks }
RTAxisAdaptedBuilder >> createView [
	^ super createView @ RTDraggableView
]

{ #category : #'as yet unclassified' }
RTAxisAdaptedBuilder >> defaultMargin [
	self margin: 50.
]

{ #category : #initialization }
RTAxisAdaptedBuilder >> initialize [
	super initialize.
	self configureView: view.
	self defaultMargin.
	xAxisConfiguration := self createAxisConfiguration.
	xAxisConfiguration numberOfTicks: 4.
	xAxisConfiguration tickLabelOffset: 0 @ -20.
	yAxisConfiguration := self createAxisConfiguration.
	yAxisConfiguration numberOfTicks: 4.
	yAxisConfiguration tickLabelOffset: -30 @ 0.
	objects := OrderedCollection new.
]

{ #category : #accessing }
RTAxisAdaptedBuilder >> margin [
	^ margin
]

{ #category : #accessing }
RTAxisAdaptedBuilder >> margin: aSize [
	margin := aSize
]

{ #category : #accessing }
RTAxisAdaptedBuilder >> objects [
	^ objects
]

{ #category : #accessing }
RTAxisAdaptedBuilder >> objects: anRTElementsCollection [
	objects := anRTElementsCollection.
	self setObjectsLimits.

]

{ #category : #hooks }
RTAxisAdaptedBuilder >> renderIn: aView [

	self assert: (objects isNotNil).
	
	self createAxis.
]

{ #category : #'as yet unclassified' }
RTAxisAdaptedBuilder >> setObjectsLimits [
	
	minX := (objects collect: [:o | (o position x) - (o width /2 )]) min.
	maxX := (objects collect: [:o | (o position x) + (o width /2 )]) max.
	
	minY := (objects collect: [:o | (o position y) - (o height /2 )]) min.
	maxY := (objects collect: [:o | (o position y) + (o height /2 )]) max.
]

{ #category : #accessing }
RTAxisAdaptedBuilder >> xAxisConfiguration [
	^ xAxisConfiguration
	
]

{ #category : #accessing }
RTAxisAdaptedBuilder >> xAxisConfiguration: anAxisConfiguration [
	xAxisConfiguration := anAxisConfiguration
	
]

{ #category : #'as yet unclassified' }
RTAxisAdaptedBuilder >> xAxisDefaultConfigurationOrigin: aPoint toPoint: anotherPoint [
	xAxisConfiguration fromPoint: aPoint.
	xAxisConfiguration toPoint: anotherPoint.
	xAxisConfiguration maxValue: anotherPoint x.
	xAxisConfiguration minValue: aPoint x.
	
]

{ #category : #'as yet unclassified' }
RTAxisAdaptedBuilder >> xAxisPoint: aFixedY [
	^ (maxX + self margin)@aFixedY
]

{ #category : #accessing }
RTAxisAdaptedBuilder >> yAxisConfiguration [
	^ yAxisConfiguration
	
]

{ #category : #accessing }
RTAxisAdaptedBuilder >> yAxisConfiguration: anAxisConfiguration [
	yAxisConfiguration := anAxisConfiguration
	
]

{ #category : #'as yet unclassified' }
RTAxisAdaptedBuilder >> yAxisDefaultConfigurationOrigin: aPoint toPoint: anotherPoint [
	yAxisConfiguration fromPoint: aPoint.
	yAxisConfiguration toPoint: anotherPoint.
	yAxisConfiguration maxValue: anotherPoint y.
	yAxisConfiguration minValue: aPoint y.
	
]

{ #category : #'as yet unclassified' }
RTAxisAdaptedBuilder >> yAxisPoint: aFixedX [
	^ aFixedX@(maxY + self margin)
]
