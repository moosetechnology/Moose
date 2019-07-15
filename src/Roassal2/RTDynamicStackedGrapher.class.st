"
RTDynamicStackedGrapher is a dynamic grapher on which bar may be added.

Consider the following example:

	| b |
	b := RTDynamicStackedGrapher new.
	b numberOfBars: 10.
	b minY: -200; maxY: 200.

	b y: #yourself.
	 
	b barShape color: (Color red alpha: 0.3).
	b view addMenu: '+ 1' callback: [ b add: 400 atRandom - 200 ].
	b open
"
Class {
	#name : #RTDynamicStackedGrapher,
	#superclass : #RTAbstractGrapher,
	#instVars : [
		'numberOfBars',
		'y',
		'allAddedElements',
		'centerElement',
		'layoutTranslator',
		'textBelow'
	],
	#category : #'Roassal2-Builder-Grapher-Core'
}

{ #category : #adding }
RTDynamicStackedGrapher >> add: anObject [
	| positionInView el center barHeight yValue graphCenter |
	self defineCenterElement.
	self removeExceedingBar.
	yValue := self yValueFor: anObject.
	positionInView := self getPixelPositionOf: 0 @ yValue.
	graphCenter := centerElement position.
	center := self getPixelPositionOf: 0 @ 0.
	barHeight := (positionInView y - center y) abs.
	el := self createElementFor: anObject height: barHeight.
	yValue > 0
		ifTrue: [ el translateTo: self barXPosition @ (positionInView y + (barHeight / 2)) + graphCenter ]
		ifFalse: [ el translateTo: self barXPosition @ (positionInView y - (barHeight / 2)) + graphCenter ].
	view add: el.
	
	textBelow ifNotNil: [ 
		| l |
		l := RTLabeled new text: textBelow.
		yValue > 0 ifTrue: [ l below ].
		el @ l ].
	
	view signalUpdate.
	allAddedElements add: el.
	^ el
]

{ #category : #adding }
RTDynamicStackedGrapher >> addAll: someObjects [
	^ someObjects collect: [ :o | self add: o ]
	
]

{ #category : #public }
RTDynamicStackedGrapher >> barShape [
	^ self shape rectangle

]

{ #category : #'private - bar management' }
RTDynamicStackedGrapher >> barWidth [
	^ (extent x / (numberOfBars + 1)) asFloat - self gapBetweenBar
]

{ #category : #'private - bar management' }
RTDynamicStackedGrapher >> barWidthWithGap [
	^ self barWidth + self gapBetweenBar
]

{ #category : #'private - bar management' }
RTDynamicStackedGrapher >> barXPosition [
	^ (allAddedElements size + 1) * self barWidthWithGap
]

{ #category : #accessing }
RTDynamicStackedGrapher >> centerElement [
	"Return the center of the element, the position 0 @ 0"
	^ centerElement 
]

{ #category : #'private - bar management' }
RTDynamicStackedGrapher >> createElementFor: anObject height: barHeight [
	| el |
	shapeBuilder width: self barWidth.
	shapeBuilder height: barHeight.
	el := shapeBuilder elementOn: anObject.
	el @ RTPopup.
	^ el
]

{ #category : #hooks }
RTDynamicStackedGrapher >> createShapeBuilder [
	| s |
	s := super createShapeBuilder.
	s rectangle color: (Color blue alpha: 0.3).
	^ s
]

{ #category : #initialization }
RTDynamicStackedGrapher >> defaultNumberOfBars [
	^ 3
]

{ #category : #hooks }
RTDynamicStackedGrapher >> defineCenterElement [
	"We keep an element to 0 @ 0 because this is useful when the dynamic stacked grapher has to be composed with other"
	centerElement ifNotNil: [ ^ self ].
	centerElement := (RTBox new size: 1) elementOn: 'center'.
	centerElement translateTo: 0 @ 0.
	view add: centerElement
]

{ #category : #'public - configuring - animation' }
RTDynamicStackedGrapher >> doNotUseAnimation [
	"When bar have to be removed, there is no animation to translate the bars"
	layoutTranslator := RTDirectLayoutTranslator new
]

{ #category : #examples }
RTDynamicStackedGrapher >> example01 [

	| b |
	b := RTDynamicStackedGrapher new.
	b numberOfBars: 10.
	b minY: -200; maxY: 200.

	b y: #yourself.
	 
	b barShape color: (Color red alpha: 0.3).
	b view addMenu: '+ 1' callback: [ b add: 400 atRandom - 200 ].
	^ b  
]

{ #category : #'private - bar management' }
RTDynamicStackedGrapher >> gapBetweenBar [
	^ 2
]

{ #category : #initialization }
RTDynamicStackedGrapher >> initialize [
	super initialize.
	y := #yourself.
	self resetAddedElements.
	self axisX
		noTick;
		noLabel.
	numberOfBars := self defaultNumberOfBars.
	self useAnimation.
]

{ #category : #accessing }
RTDynamicStackedGrapher >> numberOfBars [
	^ numberOfBars
]

{ #category : #accessing }
RTDynamicStackedGrapher >> numberOfBars: anInteger [
	"Set the number of bars defining the grapher"
	numberOfBars := anInteger
]

{ #category : #'private - bar management' }
RTDynamicStackedGrapher >> removeExceedingBar [	
	allAddedElements size = numberOfBars
		ifTrue: [ 
			allAddedElements first remove.
			allAddedElements do: [ :e | 
				
				"e translateBy: self barWidthWithGap negated @ 0"
				layoutTranslator translate: e by: (self barWidthWithGap negated @ 0).
				"view addAnimation: (RTLinearMove new by: (self barWidthWithGap negated @ 0) during: 0.1 on: e)."
				 ].
			allAddedElements removeFirst ]
]

{ #category : #hooks }
RTDynamicStackedGrapher >> renderIn: aView [
	self defineAxesIfNecessary.
	self renderAxis.
	
]

{ #category : #'public - cleaning' }
RTDynamicStackedGrapher >> resetAddedElements [
	allAddedElements := OrderedCollection new
]

{ #category : #accessing }
RTDynamicStackedGrapher >> textBelow: valueOrBlockOrSymbol [
	"Make each bar chart to have a label below"
	textBelow := valueOrBlockOrSymbol
]

{ #category : #userinterface }
RTDynamicStackedGrapher >> updateView [
	self view signalUpdate
]

{ #category : #'public - configuring - animation' }
RTDynamicStackedGrapher >> useAnimation [
	"When bar have to be removed, there is an animation to translate the bars"
	layoutTranslator := RTSmoothLayoutTranslator new.
	layoutTranslator nbCycles: 0.2.
	layoutTranslator view: self view
]

{ #category : #accessing }
RTDynamicStackedGrapher >> view: aView [
	super view: aView.
	self defineCenterElement.
]

{ #category : #accessing }
RTDynamicStackedGrapher >> y [
	^ y
]

{ #category : #accessing }
RTDynamicStackedGrapher >> y: anObject [
	y := anObject
]

{ #category : #'private - bar management' }
RTDynamicStackedGrapher >> yValueFor: anObject [
	^ y rtValue: anObject
]
