"
I am an abstract class for dependency structural matrices
"
Class {
	#name : #RTAbstractDSM,
	#superclass : #RTBuilder,
	#instVars : [
		'elements',
		'objectsX',
		'objectsY',
		'wantsLabel',
		'text',
		'rotation',
		'transparencyWhenNonHighlighted',
		'transparencyWhenHighlighted',
		'creationBlock',
		'selectElement',
		'xinteraction',
		'yinteraction',
		'labelShapeX',
		'labelShapeY'
	],
	#category : #'Roassal2-Builder-DSM'
}

{ #category : #UI }
RTAbstractDSM >> addLabels [
	self addLabelsLeft.
	self addLabelsTop.
]

{ #category : #UI }
RTAbstractDSM >> addLabelsIfNecessary [
	self wantsLabel ifFalse: [ ^ self ].
	self addLabels
]

{ #category : #UI }
RTAbstractDSM >> addLabelsLeft [
	| es theModel lbl |
	es := self columnAt: 1.
	es
		do:
			[ :e | 
			theModel := e model key.
			lbl := self labelShapeY elementOn: theModel.
			yinteraction setUpElement: lbl.
			view add: lbl.
			RTConstraint new
				fix: e;
				movable: lbl;
				outer;
				left;
				move ]
]

{ #category : #UI }
RTAbstractDSM >> addLabelsTop [
	| es theModel lbl labels deltaY |
	es := self rowAt: 1.
	labels := OrderedCollection new.
	deltaY := Float fmax.
	es
		do:
			[ :e | 
			theModel := e model value.
			lbl := self labelShapeX elementOn: theModel.
			labels add: lbl.
			xinteraction setUpElement: lbl.
			view add: lbl.
			lbl rotateByDegrees: rotation.
			RTConstraint new
				fix: e;
				movable: lbl;
				outer;
				middle;
				top;
				move.
			deltaY := deltaY min: lbl position y ].
	labels do: [ :l | 
		l translateTo: l position x @ deltaY ].
]

{ #category : #configuration }
RTAbstractDSM >> cellSize [
	^ 10
]

{ #category : #accessing }
RTAbstractDSM >> columnAt: aNumber [

	^ (1 to: objectsY size) collect: [ :i | self elementAt: aNumber @ i ]
]

{ #category : #UI }
RTAbstractDSM >> createElements [
	"
	:: Void -> RTDSM
	var shape : RTShape
	var e : RTElement
	var anObject1 : Object
	var index1 : Number
	var anObject2 : Object
	var index2 : Number
	var evt : TREvent
	var elements : Collection
	var objects : Collection
	"
	| e |
	elements := RTGroup new.
	objectsY copy
		doWithIndex:
			[ :anObject1 :index1 | 
			objectsX copy
				doWithIndex:
					[ :anObject2 :index2 | 
					e := self elementOn: (self createObjectBlock value: anObject1 -> anObject2).
					e attributeAt: #matrixIndex put: index2 @ index1.
					elements add: e ] ].
]

{ #category : #accessing }
RTAbstractDSM >> createObjectBlock [
	^ creationBlock
]

{ #category : #accessing }
RTAbstractDSM >> createObjectBlock: aBlock [
	creationBlock := aBlock
]

{ #category : #hooks }
RTAbstractDSM >> createShapeBuilder [
	| sb |
	sb := super createShapeBuilder.
	sb shape: self defaultCellShape.
	^ sb
]

{ #category : #hooks }
RTAbstractDSM >> createView [
	^ super createView @ RTDraggableView @ RTZoomableView
]

{ #category : #configuration }
RTAbstractDSM >> defaultCellShape [
	^ RTBox new
		size: self cellSize.
]

{ #category : #UI }
RTAbstractDSM >> defaultTopLabelRotation [
	^ -55
]

{ #category : #configuration }
RTAbstractDSM >> doNotShowLabels [
	wantsLabel := false
]

{ #category : #accessing }
RTAbstractDSM >> elementAt: aPoint [
	"Return the element at position aPoint"
	^ elements at: (objectsX size) * (aPoint y - 1) + aPoint x
]

{ #category : #accessing }
RTAbstractDSM >> elements [
	^ elements copy
]

{ #category : #highlighting }
RTAbstractDSM >> highlightColumn: aNumber [
	^ self highlightElements: (self columnAt: aNumber)
]

{ #category : #highlighting }
RTAbstractDSM >> highlightElements [
	self highlightElements: elements
]

{ #category : #highlighting }
RTAbstractDSM >> highlightElements: someElements [
	(someElements select: [ :e | selectElement rtValue: e ]) do: [ :e | | shape |
		shape := e trachelShape class = TRCompositeShape 
			ifTrue: [ e trachelShape firstShape ]
			ifFalse: [ e trachelShape ].
		shape color: (shape color alpha: self transparencyWhenHighlighted) ].
]

{ #category : #highlighting }
RTAbstractDSM >> highlightRow: aNumber [
	^ self highlightElements: (self rowAt: aNumber)
]

{ #category : #initialization }
RTAbstractDSM >> initialize [
	"
	:: Void -> RTDSM
	"
	super initialize.
	self objects: #().
	self createObjectBlock: [ :assoc| assoc ].
	self selectElement: [ :e | true ].
	self interaction popup.
	self interaction 
		when: TRMouseEnter do: [ :evt | 
			self highlightElements.
			self unhighlightColumn: (evt element attributeAt: #matrixIndex) x.
			self unhighlightRow: (evt element attributeAt: #matrixIndex) y.
		];when: TRMouseLeave do: [ :evt | 
			self unhighlightElements. ].
	xinteraction := RTInteractionBuilder new.
	yinteraction := RTInteractionBuilder new.
	rotation := self defaultTopLabelRotation.
	wantsLabel := true.
	text := #yourself.
	self labelShapeX: RTShapeBuilder new.
	self labelShapeX label.
	self labelShapeY: RTShapeBuilder new.
	self labelShapeY label.
	transparencyWhenHighlighted := 0.4.
	transparencyWhenNonHighlighted := 1.
]

{ #category : #UI }
RTAbstractDSM >> labelShape [
	^ RTLabel new
		height: self cellSize;
		text: text
]

{ #category : #accessing }
RTAbstractDSM >> labelShapeX [
	^ labelShapeX
]

{ #category : #accessing }
RTAbstractDSM >> labelShapeX: aShapeBuilder [
	labelShapeX := aShapeBuilder
]

{ #category : #accessing }
RTAbstractDSM >> labelShapeY [
	^ labelShapeY
]

{ #category : #accessing }
RTAbstractDSM >> labelShapeY: aShapeBuilder [
	labelShapeY := aShapeBuilder
]

{ #category : #accessing }
RTAbstractDSM >> labelShapesDo: aBlock1arg [
	aBlock1arg value: self labelShapeX.
	aBlock1arg value: self labelShapeY.
]

{ #category : #accessing }
RTAbstractDSM >> labelsXInteraction [
	^ xinteraction
]

{ #category : #accessing }
RTAbstractDSM >> labelsYInteraction [
	^ yinteraction
]

{ #category : #UI }
RTAbstractDSM >> layoutElements: es [
	RTGridLayout new
		gapSize: 1;
		lineItemsCount: objectsX size;
		on: es
]

{ #category : #accessing }
RTAbstractDSM >> numberOfObjects [
	"Return the number of objects"
	^ self objects size
]

{ #category : #accessing }
RTAbstractDSM >> objects [
	^ (objectsX, objectsY) asSet
]

{ #category : #accessing }
RTAbstractDSM >> objects: someObjects [
	objectsX := someObjects.
	objectsY := someObjects
]

{ #category : #accessing }
RTAbstractDSM >> objectsX [
	^ objectsX
]

{ #category : #accessing }
RTAbstractDSM >> objectsX: anObject [
	objectsX := anObject
]

{ #category : #accessing }
RTAbstractDSM >> objectsY [
	^ objectsY
]

{ #category : #accessing }
RTAbstractDSM >> objectsY: anObject [
	objectsY := anObject
]

{ #category : #hooks }
RTAbstractDSM >> renderIn: aView [
	self createElements.
	aView addAll: elements.
	self layoutElements: elements.
	self addLabelsIfNecessary.
	^ aView
]

{ #category : #accessing }
RTAbstractDSM >> rotation [
	"
	Return the rotation of the top labels
	:: Void -> Integer
	"
	^ rotation
]

{ #category : #accessing }
RTAbstractDSM >> rotation: anInteger [
	"Set the rotation of the top label
	:: Integer -> RTDSM
	"
	rotation := anInteger
]

{ #category : #accessing }
RTAbstractDSM >> rowAt: aNumber [
	"Return the elements located at a given row"
	^ (1 to: objectsX size) collect: [ :i | self elementAt: i @ aNumber ]
]

{ #category : #accessing }
RTAbstractDSM >> selectElement [
	 ^ selectElement
]

{ #category : #accessing }
RTAbstractDSM >> selectElement: aBlock [
	selectElement := aBlock
]

{ #category : #accessing }
RTAbstractDSM >> text [
	"Return the text used for labelling"
	^ text
]

{ #category : #accessing }
RTAbstractDSM >> text: aOneArgBlockOrSymbol [
	"Set the text used for each label. Per default, text is #yourself"
	text := aOneArgBlockOrSymbol
]

{ #category : #accessing }
RTAbstractDSM >> transparencyWhenHighlighted [
	^ transparencyWhenHighlighted
]

{ #category : #accessing }
RTAbstractDSM >> transparencyWhenHighlighted: anObject [
	transparencyWhenHighlighted := anObject
]

{ #category : #accessing }
RTAbstractDSM >> transparencyWhenNonHighlighted [
	^ transparencyWhenNonHighlighted
]

{ #category : #accessing }
RTAbstractDSM >> transparencyWhenNonHighlighted: anObject [
	transparencyWhenNonHighlighted := anObject
]

{ #category : #highlighting }
RTAbstractDSM >> unhighlightColumn: aNumber [
	^ self unhighlightElements: (self columnAt: aNumber)
]

{ #category : #highlighting }
RTAbstractDSM >> unhighlightElements [
	self unhighlightElements: elements
]

{ #category : #highlighting }
RTAbstractDSM >> unhighlightElements: someElements [
	(someElements select: [ :e | selectElement rtValue: e ]) do: [ :e | | shape |
		shape := e trachelShape class = TRCompositeShape 
			ifTrue: [ e trachelShape firstShape ]
			ifFalse: [ e trachelShape ]. 
		shape color: (shape color alpha: self transparencyWhenNonHighlighted ) ].
]

{ #category : #highlighting }
RTAbstractDSM >> unhighlightRow: aNumber [
	^ self unhighlightElements: (self rowAt: aNumber)
]

{ #category : #testing }
RTAbstractDSM >> wantsLabel [
	^ wantsLabel
]
