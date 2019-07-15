"
I am a shape to create a composite node, with:
* A shape of background (box, circle, triangle, etc)
* A shape with text


"
Class {
	#name : #RTSelectiveShape,
	#superclass : #RTAbstractElementShape,
	#instVars : [
		'shape',
		'labelShape',
		'backgroundColor'
	],
	#category : #'Roassal2-Experimental'
}

{ #category : #accessing }
RTSelectiveShape >> backgroundColor: aValueOrAOneArgBlock [
	self backgroundColorElement: [ :e | aValueOrAOneArgBlock rtValue: e model ].
]

{ #category : #accessing }
RTSelectiveShape >> backgroundColorElement: aValueOrAOneArgBlock [
	backgroundColor := aValueOrAOneArgBlock
]

{ #category : #accessing }
RTSelectiveShape >> backgroundColorFor: element [
	color := backgroundColor rtValue: element.
	color isColor ifFalse: [ 
		color := Color colorFrom: color ].
	^ color
]

{ #category : #accessing }
RTSelectiveShape >> color: aValue [
	labelShape color: aValue
]

{ #category : #configuration }
RTSelectiveShape >> defaultHeight [
	^ 30
]

{ #category : #configuration }
RTSelectiveShape >> defaultWidth [
	^ 30
]

{ #category : #private }
RTSelectiveShape >> getShapeBySymbol: symbol [
	symbol = #ellipse ifTrue: [ ^ RTEllipse new].
	^ RTPolygon perform: symbol.
]

{ #category : #accessing }
RTSelectiveShape >> if: block shapeElement: block2 [
	| oldShape |
	oldShape := self shapeElement.
	^ self shapeElement: [ :e | (block rtValue: e) 
		ifTrue: [ block2 rtValue: e ]
		ifFalse: [ oldShape rtValue: e ] ]
]

{ #category : #initialization }
RTSelectiveShape >> initialize [
	super initialize.
	self labelShape: RTTextPath new.
]

{ #category : #accessing }
RTSelectiveShape >> labelShape [
	^ labelShape
]

{ #category : #accessing }
RTSelectiveShape >> labelShape: aLabelShape [
	labelShape := aLabelShape
]

{ #category : #accessing }
RTSelectiveShape >> labelShapeDo: aBlock [
	aBlock value: labelShape
]

{ #category : #accessing }
RTSelectiveShape >> shape: aShapeOrSymbol [
	self shapeElement: [ :e| aShapeOrSymbol rtValue: e model ]
]

{ #category : #accessing }
RTSelectiveShape >> shapeElement [
	^ shape
]

{ #category : #accessing }
RTSelectiveShape >> shapeElement: aShapeOrSymbol [
	shape := aShapeOrSymbol.
]

{ #category : #accessing }
RTSelectiveShape >> shapeFor: anElement [
	| res |
	res := shape rtValue: anElement.
	res isSymbol ifTrue: [ 
		res := self getShapeBySymbol: res ].
	^ res 
	
]

{ #category : #accessing }
RTSelectiveShape >> text: aBlockOrSymbol [
	self labelShape text: aBlockOrSymbol
]

{ #category : #public }
RTSelectiveShape >> trachelShapeFor: anElement [
	| label bshape |
	bshape := (self shapeFor: anElement) trachelShapeFor: anElement.
	bshape
		extent: (self widthFor: anElement) @ (self heightFor: anElement);
		color: (self backgroundColorFor: anElement).
	label := self labelShape trachelShapeFor: anElement.
	^ TRCompositeShape new
		addShape: bshape;
		addShape: label;
		yourself
]

{ #category : #hooks }
RTSelectiveShape >> updateFor: anElement trachelShape: trachelShape [
	(self shapeFor: anElement) updateFor: anElement trachelShape: trachelShape shapes first.
	trachelShape shapes first
		extent: (self widthFor: anElement) @ (self heightFor: anElement);
		color: (self backgroundColorFor: anElement).
	labelShape updateFor: anElement trachelShape: trachelShape shapes second
]
