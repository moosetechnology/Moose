"
A RTDoubleBarBuilder render a double bar chart
"
Class {
	#name : #RTDoubleBarBuilder,
	#superclass : #RTBuilder,
	#instVars : [
		'elements',
		'topExtremity',
		'bottomExtremity',
		'verticalGap',
		'width'
	],
	#category : #'Roassal2-Builder-Grapher-Core'
}

{ #category : #configuration }
RTDoubleBarBuilder >> bottomValue: aBlock [
	"The gray bar"
	self bottomValue: aBlock titled: aBlock asString
]

{ #category : #configuration }
RTDoubleBarBuilder >> bottomValue: aBlock titled: aTitle [
	"The gray bar"
	 | configuration |
	self metric: aBlock color: Color lightGray height: 20.
	
	configuration := RTAxisConfiguration new.
	configuration builder: self.
	configuration title: aTitle.
	configuration titlePosition: (0 @ -30).
	configuration color: Color lightGray.
	configuration minValue: 0.
	configuration positionLabel: [ :aLabel :aTick | aLabel translateTo: aTick position + (0 @ 15) ].
	configuration maxValue: (self points collect: aBlock) max.
	configuration numberOfTicks: 4.
	configuration lineThickness: 3.
	configuration axisFrom: bottomExtremity position to: bottomExtremity position + (width @ 0).
	
]

{ #category : #util }
RTDoubleBarBuilder >> createPointNameFrom: someObjects [
	"Create the labels for the objects"
	| es |
	shapeBuilder ensure: RTLabel.
	es := shapeBuilder elementsOn: someObjects.
	"es @ RTHighlightable."
	self setUpInteractionFor: es.
	^ es
]

{ #category : #hooks }
RTDoubleBarBuilder >> createView [
	^ super createView @ RTDraggableView
]

{ #category : #configuration }
RTDoubleBarBuilder >> defaultVerticalGap [
	^ 5
]

{ #category : #configuration }
RTDoubleBarBuilder >> defaultWidth [
	^ 250
]

{ #category : #examples }
RTDoubleBarBuilder >> example01 [
	"
	self new example01
	"
	| b |
	b := RTDoubleBarBuilder new.
	b points: RTShape withAllSubclasses.
	b bottomValue: #numberOfMethods.
	b topValue: #numberOfVariables.
	^ b
]

{ #category : #initialization }
RTDoubleBarBuilder >> initialize [
	super initialize.
	verticalGap := self defaultVerticalGap.
	width := self defaultWidth.
]

{ #category : #configuration }
RTDoubleBarBuilder >> metric: aBlock color: aColor height: anHeight [
	| boxes |
	boxes := elements collect: [ :el | 
		| b |
		b := (RTBox new height: anHeight; color: aColor) elementOn: el model.
		b @ (RTPopup text: [ :model | aBlock rtValue: model ]).
		b ].
	RTMetricNormalizer new 
		elements: boxes;
		normalizeWidth: aBlock min: 2 max: width minValue: 0.
 		
	elements with: boxes do: [ :e :b | 		 
		RTConstraint move: b onTheRightOf: e.
		b translateBy: 2 @ 0. ].
	view addAll: boxes.
]

{ #category : #configuration }
RTDoubleBarBuilder >> pointName: aOneArgBlock [
	"Utility method"
	self shape label text: aOneArgBlock
]

{ #category : #'public-accessing' }
RTDoubleBarBuilder >> points [
	^ elements collect: #model
]

{ #category : #'public-accessing' }
RTDoubleBarBuilder >> points: someObjects [
	elements := self createPointNameFrom: someObjects.
	view addAll: elements.
	RTVerticalLineLayout new
		verticalGap: verticalGap;
		alignRight;
		on: elements.
	topExtremity := (RTBox new size: 0) element.
	bottomExtremity := (RTBox new size: 0) element.
	RTConstraint move: topExtremity onTheRightOf: elements first.
	RTConstraint move: bottomExtremity onTheRightOf: elements last.
	topExtremity translateBy: 0 @ -15.
	bottomExtremity translateBy: 0 @ 15.
	view add: topExtremity.
	view add: bottomExtremity.
	view add: ((RTLine new color: Color red) edgeFrom: topExtremity to: bottomExtremity)
]

{ #category : #configuration }
RTDoubleBarBuilder >> topValue: aBlock [
	"The red bar"
	self topValue: aBlock titled: aBlock asString
]

{ #category : #configuration }
RTDoubleBarBuilder >> topValue: aBlock titled: aTitle [
	"The red bar"
	 | configuration |
	self metric: aBlock color: Color red height: 10.
	
	configuration := RTAxisConfiguration new.
	configuration builder: self.
	configuration title: aTitle.
	configuration titlePosition: (0 @ 30).
	configuration color: Color red.
	configuration minValue: 0.
	configuration positionLabel: [ :aLabel :aTick | aLabel translateTo: aTick position - (0 @ 15) ].
	configuration maxValue: (self points collect: aBlock) max.
	configuration numberOfTicks: 4.
	configuration lineThickness: 3.
	configuration axisFrom: topExtremity position to: topExtremity position + (width @ 0).
]
