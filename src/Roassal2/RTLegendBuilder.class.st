"
I am an handy class to build legend in a visualization

-=-=-=-=-=-=-=-=
b := RTMondrian new.
b shape rectangle
	width: [ :c | c numberOfVariables * 5 ];
	height: #numberOfMethods.
b nodes: RTShape withAllSubclasses.
b edges connectFrom: #superclass.
b layout tree.
b build.

lb := RTLegendBuilder new.
lb view: b view.
lb addRectanglePolymetricWidth: 'number of methods' height: 'Line of code'.
lb build.

b
-=-=-=-=-=-=-=-=

"
Class {
	#name : #RTLegendBuilder,
	#superclass : #RTBuilder,
	#instVars : [
		'items',
		'group',
		'legendElement',
		'offset',
		'position',
		'isOnDemand',
		'textSize',
		'gapSize',
		'isFixed',
		'onDemandText',
		'boxShape',
		'nestBlock'
	],
	#category : #'Roassal2-Builder-Legend'
}

{ #category : #'instance creation' }
RTLegendBuilder class >> on: aView [
	| i |
	i := self new.
	i view: aView.
	^ i.
]

{ #category : #'public - convenient' }
RTLegendBuilder >> addColor: aColor object: anObject text: aBlockOrSelector [
	"Associate a color with a text"
	items add: (RTColorLegendItem new color: aColor; model: anObject; text: aBlockOrSelector;
	textSize: self textSize)
]

{ #category : #'public - convenient' }
RTLegendBuilder >> addColor: aColor text: aText [
	"Associate a color with a text"
	^ self addColor: aColor object: aText text: #yourself
]

{ #category : #'public - convenient' }
RTLegendBuilder >> addColorFadingFrom: startColor to: endColor text: textualDescription [
	"Add a fading between startColor and endColor. A textualDescription is provided"
	self addColorFadingUsing: (Array with: startColor with: endColor) text: textualDescription
]

{ #category : #'public - convenient' }
RTLegendBuilder >> addColorFadingUsing: colors text: textualDescription [
	"Specify a description of a fading using a provided set of colors"
	items
		add:
			(RTColorFadingLegendItem new
				colors: colors;
				description: textualDescription)
]

{ #category : #'public - convenient' }
RTLegendBuilder >> addColoredObject: anObject text: aTextOrSymbolOrBlock color: aColor [
	items add: (RTLabelLegendItem new model: anObject; text: aTextOrSymbolOrBlock; color: aColor; textSize: self textSize)
]

{ #category : #'public - convenient' }
RTLegendBuilder >> addColoredText: aText color: aColor [
	^ self addColoredObject: nil text: aText color: aColor

]

{ #category : #'public - convenient' }
RTLegendBuilder >> addLineColor: aColor text: aText [
	"Associate a color with a text"
	items add: (RTLineLegendItem new color: aColor; text: aText; textSize: self textSize)
]

{ #category : #'public - convenient' }
RTLegendBuilder >> addObject: anObject text: aTextOrASymbolOrBlock [
	^ self addColoredObject: anObject text: aTextOrASymbolOrBlock color: Color lightGray
]

{ #category : #'public - convenient' }
RTLegendBuilder >> addRectanglePolymetricWidth: widthDescription height: heightDescription box: boxDescription [
	"Associate a color with a text"

	items add: (RTPolymorphicBoxLegendItem new 
						widthDescription: widthDescription;
						heightDescription: heightDescription;
						boxDescription: boxDescription;
						textSize: self textSize)
]

{ #category : #'public - convenient' }
RTLegendBuilder >> addText: aText [
	"Add a text to the legend, simply"
	self addColoredText: aText color: self textColor
]

{ #category : #hooks }
RTLegendBuilder >> backgroundBoxElement [
	| e |
	e := self backgroundShape elementOn: nil.
	self interaction setUpElement: e.
	^ e
]

{ #category : #accessing }
RTLegendBuilder >> backgroundShape [
	^ boxShape
]

{ #category : #configuration }
RTLegendBuilder >> backgroundTransparencyOnDemand [
	^ 0.9
]

{ #category : #'public - positioning' }
RTLegendBuilder >> below [
	self positionDo: [ :p | 
		p 
			outer;
			verticalPadding: offset;
			bottom;
			center;
			move.
		 ].
]

{ #category : #initialization }
RTLegendBuilder >> defaultOffset [
	^ 20
]

{ #category : #accessing }
RTLegendBuilder >> gapSize [
	^ gapSize
]

{ #category : #accessing }
RTLegendBuilder >> gapSize: aNumber [
	gapSize := aNumber
]

{ #category : #accessing }
RTLegendBuilder >> group [
	"Return all the elements"
	| myGroup |
	myGroup := RTGroup new.
	items do: [ :item | myGroup add: item execute ].
	RTVerticalLineLayout new
		gapSize: gapSize;
		on: myGroup.
	^ myGroup
]

{ #category : #initialization }
RTLegendBuilder >> initialize [
	super initialize.
	"Thisi group variable should be removed"
	group := RTGroup new.
	
	offset := self defaultOffset.
	self below.
	self nestDo: [ :n :e :g | n on: e nest: g ].
	self interaction draggable.
	isOnDemand := false.
	textSize := 12.
	gapSize := 10.
	items := OrderedCollection new.
	boxShape := RTShapeBuilder new.
	boxShape box; 
		borderColor: Color lightGray;
		fillColor: Color transparent.
	isFixed := false
]

{ #category : #'public - positioning' }
RTLegendBuilder >> left [
	self positionDo: [ :p |
		p
			outer;
			left;
			horizontalPadding: offset;
			middle;
			move.
		 ].
]

{ #category : #accessing }
RTLegendBuilder >> legendElement [
	^ legendElement
]

{ #category : #'public - positioning' }
RTLegendBuilder >> nestDo: aBlockThreeArg [
	"read documentation of RTNest to position elements in the legend"
	nestBlock := aBlockThreeArg 
]

{ #category : #'private - utility' }
RTLegendBuilder >> newLabelShape: widthDescription [
	"Return a new label with the argument as the content of the label"
	^ RTLabel new color: self textColor; text: widthDescription; yourself
]

{ #category : #initialization }
RTLegendBuilder >> offset [
	^ offset
]

{ #category : #initialization }
RTLegendBuilder >> offset: aDistanceInPixel [
	offset := aDistanceInPixel 
]

{ #category : #accessing }
RTLegendBuilder >> onDemand [
	"Make the legend appear if the user move the mouse on a particular icon in the visualization"
	isOnDemand := true.
	onDemandText := '?'.
]

{ #category : #accessing }
RTLegendBuilder >> onDemand: text [
	self onDemand.
	onDemandText := text
]

{ #category : #'public - positioning' }
RTLegendBuilder >> positionDo: aBlockOneArg [
	position := aBlockOneArg 
]

{ #category : #hooks }
RTLegendBuilder >> renderIn: aView [
	| myGroup elementsInTheViewWithoutTheLegend |
	super renderIn: aView.
	isOnDemand
		ifTrue: [ ^ self renderOnDemandIn: aView ].
	elementsInTheViewWithoutTheLegend := aView elements.
	myGroup := self group.
	legendElement := self backgroundBoxElement.
	aView add: legendElement.
	myGroup do: [ :g | aView addAll: g ].
	nestBlock value: RTNest new value: legendElement value: myGroup.
	
	position value: (RTConstraint
		movable: legendElement
		fix: (RTGroup withAll: elementsInTheViewWithoutTheLegend)).
	
	isFixed
		ifTrue: [ | els |
			els := aView elements
				copyWithoutAll: elementsInTheViewWithoutTheLegend.
				
			"We need to consider the edges as well"
			els := els, (els flatCollect: #outgoingEdges).
			els do: [ :e | e trachelShape setAsFixed ].
			TRConstraint
				stickAtTheBottomOfTheWindow: legendElement trachelShape ]
]

{ #category : #hooks }
RTLegendBuilder >> renderOnDemandIn: aView [
	| label myGroup |
	super renderIn: aView.
	RTVerticalLineLayout on: group.
	label := (RTLabel new color: Color red) elementOn: onDemandText.
	label setAsFixed.
	label @ RTHighlightable.
	aView add: label.
	label translateTo: label extent / 2.
	label
		@
			(RTPopup new
				alphaPopupBackground: self backgroundTransparencyOnDemand;
				background: Color white
					group: [ :gg :el | 
					myGroup := self group.
					gg addAll: (myGroup flatCollect: #yourself) ])
]

{ #category : #'public - positioning' }
RTLegendBuilder >> right [
	self positionDo: [ :p |
		p 
			outer;
			right;
			middle;
			horizontalPadding: offset;
			move.
		 ].
]

{ #category : #configuration }
RTLegendBuilder >> setAsFixed [

	"The legend is fixed, therefore not subject to the camera movement.
	This is handy if the visualization is very large (ie. if not fixed, then the legend may appear very small"
	isFixed := true
]

{ #category : #configuration }
RTLegendBuilder >> textColor [
	^ Color lightGray
]

{ #category : #accessing }
RTLegendBuilder >> textSize [
	^ textSize
]

{ #category : #accessing }
RTLegendBuilder >> textSize: aSizeAsInteger [
	textSize := aSizeAsInteger
]

{ #category : #'public - positioning' }
RTLegendBuilder >> top [
	self positionDo: [ :p | 
		p 
			outer;
			verticalPadding: offset;
			top;
			center;
			move.
		 ].
]
