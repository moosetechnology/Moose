"
Version of Grapher that allow for dynamic data points addition. 

Here is a small example:

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	| b |
	b := RTDynamicGrapher new.
	b maxX: 100.
	b maxY: 100.

	b x: #x; y: #y.
	 
	b shape circle color: (Color red alpha: 0.3).
	b view addMenu: '+ 10' callback: [ 
			b addAll: ((1 to: 10) collect: [ :i | (100 atRandom @ 100 atRandom) ]) ].
	b open
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
"
Class {
	#name : #RTDynamicGrapher,
	#superclass : #RTAbstractGrapher,
	#instVars : [
		'x',
		'y',
		'allAddedElements'
	],
	#category : #'Roassal2-Builder-Grapher-Core'
}

{ #category : #'public - adding' }
RTDynamicGrapher >> add: anObject [
	| positionInView el |
	positionInView := self getPixelPositionOf: (x rtValue: anObject) @ (y rtValue: anObject).
	el := shapeBuilder elementOn: anObject.
	el translateTo: positionInView.
	view add: el.
	view signalUpdate.
	allAddedElements add: el.
	^ el
]

{ #category : #'public - adding' }
RTDynamicGrapher >> addAll: someObjects [
	^ someObjects collect: [ :o | self add: o ]
	
]

{ #category : #'public - cleaning' }
RTDynamicGrapher >> clean [
	allAddedElements do: #remove.
	self resetAddedElements.
	self updateView
]

{ #category : #hooks }
RTDynamicGrapher >> createView [
	^ RTView new
]

{ #category : #examples }
RTDynamicGrapher >> example01 [

	"
	self new example01
	"

	| b |
	b := RTDynamicGrapher new.
	b minX: -200; maxX: 200.
	b minY: 0; maxY: 200.

	b x: #x; y: #y.
	 
	b shape circle color: (Color red alpha: 0.3).
	b view addMenu: '+ 1' callback: [ b add: 400 atRandom - 200 @ 200 atRandom ].
	^ b  
]

{ #category : #examples }
RTDynamicGrapher >> example02 [

	"
	self new example02
	"

	| b |
	b := RTDynamicGrapher new.
	b maxX: 100.
	b maxY: 100.

	b x: #x; y: #y.
	 
	b shape circle color: (Color red alpha: 0.3).
	b view addMenu: '+ 10' callback: [ 
			b addAll: ((1 to: 10) collect: [ :i | (100 atRandom @ 100 atRandom) ]) ].
	b view addMenu: 'Clean' callback: [ 
			b clean ].
	^ b  
]

{ #category : #initialization }
RTDynamicGrapher >> initialize [
	super initialize.
	x := #yourself.
	y := #yourself.
	self resetAddedElements
]

{ #category : #hooks }
RTDynamicGrapher >> renderIn: aView [

	self defineAxesIfNecessary.
	self renderAxis.

]

{ #category : #'public - cleaning' }
RTDynamicGrapher >> resetAddedElements [
	allAddedElements := OrderedCollection new
]

{ #category : #'public - cleaning' }
RTDynamicGrapher >> updateView [
	self view signalUpdate
]

{ #category : #accessing }
RTDynamicGrapher >> x [
	^ x
]

{ #category : #accessing }
RTDynamicGrapher >> x: anObject [
	x := anObject
]

{ #category : #accessing }
RTDynamicGrapher >> y [
	^ y
]

{ #category : #accessing }
RTDynamicGrapher >> y: anObject [
	y := anObject
]
