"
A RTPopup is an interaction that dynamically add a text or a group of elements above the element pointed by the mouse.

Example of use: 
-=-=-=
	v := RTView new.
	es := (RTEllipse new color: Color blue) elementsOn: Collection withAllSubclasses.
	v addAll: es.

	aPopup := RTPopup new 
		text: [ :aClass | 
				'Classname = ', aClass name, String cr,	
				'NbMethod=', aClass numberOfMethods asString, String cr,
				'NbVariables=', aClass numberOfVariables asString ].
	aPopup borderColor: Color black.
	aPopup textColor: Color white.
	aPopup backgroundColor: Color black.
	es @ aPopup.

	RTMetricNormalizer new
		elements: es;
		normalizeSize: #numberOfMethods min: 20 max: 50;
		normalizeColor: #numberOfVariables.

	RTGridLayout new on: es.

	v
-=-=-= 

Another example of use:
-=-=-=-=-=-=-=-=-=-=-=-=
v := RTView new.

es := RTLabel elementsOn: (1 to: 10).

v addAll: es.

es @ (RTPopup new 
	background: Color blue
	group: [ :group :el |  
 
		group addAll: (RTEllipse elementsOn: (1 to: el model)).
		RTWeightedCircleLayout new
			initialRadius: 50;
			on: group.
		]).

RTHorizontalLineLayout on: es.
v open
-=-=-=-=-=-=-=-=-=-=-=-=
"
Class {
	#name : #RTPopup,
	#superclass : #RTAbstractPopup,
	#instVars : [
		'groupBlock',
		'text',
		'textColor',
		'alphaPopupBackground',
		'backgroundColor',
		'borderColor',
		'hasBorder'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #lastPopup }
RTPopup class >> removeLastPopup [
	self lastPopup ifNil: [ ^ self ].
	self lastPopup do: [ :e | 
		((e notNil and: [ e isNumber not])and: [ e view notNil ]) ifTrue: [ e remove ] ].

	self resetLastPopup
]

{ #category : #public }
RTPopup class >> text: aBlockOrSymbol [
	"
	Set the text of the popup
	The argument, when evaluated with an object return an object, to which #asString is sent to

	The argument receives
		- an object, in case that the popup is defined for RTElement
		- an association (from -> to) in case the popup is added to edges
	
	Here is an example that define a popup on edges
	b := RTMondrian new.
	b shape circle size: 10; color: Color red.
	b nodes: (1 to: 20).
	edges := b edges moveBehind; connectFrom: [ :v | v // 2 ].
	edges @ RTHighlightable.
	edges @ (RTPopup text: [ :association | 'An edge from ', association key asString, ' to ', association value asString ]).
	b layout cluster.
	b
	
	"
	^ self new text: aBlockOrSymbol
]

{ #category : #accessing }
RTPopup >> alphaPopupBackground [
	"Return the alpha value for the background. The alpha value is useful to make the background transparent"
	^ alphaPopupBackground
]

{ #category : #accessing }
RTPopup >> alphaPopupBackground: aValue [
	"Set the alpha value for the background. The alpha value is useful to make the background transparent"
	alphaPopupBackground := aValue
]

{ #category : #public }
RTPopup >> background: aColor group: aTwoArgBlock [
	"aTwoArgBlock has to follow the pattern [ :group :element |  ... ]
	group is an empty group. You need to add what you want to be displayed in the popup. el is the element on which the mouse is above."
	
	self group: [ :group :el |
		| backgroundElement |
		backgroundElement := self createBackgroundElement: aColor.
		group add: backgroundElement.
		aTwoArgBlock value: group value: el.
		RTNest new centerOn: backgroundElement elements: (group copyWithout: backgroundElement).
		]
]

{ #category : #accessing }
RTPopup >> backgroundColor [
	^ backgroundColor
]

{ #category : #accessing }
RTPopup >> backgroundColor: aColor [
	backgroundColor := aColor
]

{ #category : #accessing }
RTPopup >> borderColor [
	^ borderColor
]

{ #category : #accessing }
RTPopup >> borderColor: aColor [
	"Set the border color
	Here is an example:

b := RTMondrian new.
b interaction popupView: [ :group :el |
    group add: (RTBitmap new form: TRPlatform current roassalIcon) element.
    group add: (RTLabel new color: Color orange; elementOn: el model printString).
    RTVerticalLineLayout on: group.
] backgroundColor: Color white borderColor: Color black .
b nodes: (1 to: 100).
b layout grid.
b
"
	borderColor := aColor.
	hasBorder := true.
]

{ #category : #initialization }
RTPopup >> createAndShowPopupFor: element event: event [
	| popupPosition popup idealPosition |
	self removeLastPopup.
	
	popup := self getNewPopupFor: element.
	self lastPopup: popup.
	
	"The following is useful when testing"
	event position isNil
		ifTrue: [ idealPosition := element position ]
		ifFalse: [ idealPosition := event position ].
	popupPosition := self closestPositionOf: popup from: idealPosition inView: element view.

	popup translateTopLeftTo: popupPosition.	

]

{ #category : #private }
RTPopup >> createBackgroundElement: aColor [
	| shape |
	shape := RTBox new color: (aColor alpha: self alphaPopupBackground).
	self hasBorder ifTrue: [ shape borderColor: borderColor; borderWidth: 3 ].
	^ shape element
]

{ #category : #hooks }
RTPopup >> createElementFor: element [
	| g |
	g := RTGroup new.
	groupBlock value: g value: element.
	^ g
]

{ #category : #initialization }
RTPopup >> getNewPopupFor: element [
	| popupGroup |
	popupGroup := self createPopupFor: element.
	popupGroup do: [ :e | element view add: e. e trachelShape setAsFixed ].
	element trachelShape signalUpdate.
	^ popupGroup
]

{ #category : #public }
RTPopup >> group: aTwoArgBlock [
	"aTwoArgBlock has to follow the pattern [ :group :element |  ... ]
	group is an empty group. You need to add what you want to be displayed in the popup. el is the element on which the mouse is above."
	groupBlock := aTwoArgBlock
]

{ #category : #public }
RTPopup >> hasBorder [
	"Answer true if a border has to be used. When setting a border color, the border is used"
	^ hasBorder
]

{ #category : #initialization }
RTPopup >> initialize [
	super initialize.
	self text: #yourself.
	textColor := Color black.
	alphaPopupBackground := 0.4.
	backgroundColor := Color gray alpha: 0.8.
	borderColor := Color gray alpha: 0.5.
	hasBorder := false
]

{ #category : #public }
RTPopup >> named: aOneArgBlock background: aColor group: aTwoArgBlock [
	"aTwoArgBlock has to follow the pattern [ :group :element |  ... ]
	group is an empty group. You need to add what you want to be displayed in the popup. el is the element on which the mouse is above."

	self
		group: [ :group :el | 
			| background label |
			background := self createBackgroundElement: aColor.
			label := (RTLabel new
				text: aOneArgBlock;
				color: Color black) elementOn: el model.
			aTwoArgBlock value: group value: el.
			group
				addFirst: background;
				addFirst: label.
			RTNest new centerOn: background elements: (group copyWithoutAll: (Array with: background with: label)).
			TRConstraint move: label above: background ]
]

{ #category : #public }
RTPopup >> namedBackground: aColor group: aTwoArgBlock [
	"aTwoArgBlock has to follow the pattern [ :group :element |  ... ]
	group is an empty group. You need to add what you want to be displayed in the popup. el is the element on which the mouse is above."
	^ self named: #yourself background: aColor group: aTwoArgBlock
]

{ #category : #public }
RTPopup >> simpleText: aOneArgBlock [
	self group: [ :group :element | 
		group add: 
			(RTLabel new 
				color: Color black;
				text: (aOneArgBlock rtValue: element model)) element
		] 

]

{ #category : #public }
RTPopup >> text: aOneArgBlock [
	"
	Set the text of the popup
	The argument, when evaluated with an object return an object, to which #asString is sent to

	The argument receives
		- an object, in case that the popup is defined for RTElement
		- an association (from -> to) in case the popup is added to edges
	
	Here is an example that define a popup on edges
	b := RTMondrian new.
	b shape circle size: 10; color: Color red.
	b nodes: (1 to: 20).
	edges := b edges moveBehind; connectFrom: [ :v | v // 2 ].
	edges @ RTHighlightable.
	edges @ (RTPopup text: [ :association | 'An edge from ', association key asString, ' to ', association value asString ]).
	b layout cluster.
	b
	
	"

	self textElement: [ :el | aOneArgBlock rtValue: el model ]
]

{ #category : #accessing }
RTPopup >> textColor [
	^ textColor
]

{ #category : #accessing }
RTPopup >> textColor: aValueOrABlockOrASymbol [
	textColor := aValueOrABlockOrASymbol
]

{ #category : #public }
RTPopup >> textElement: aOneArgBlock [
	"
	Set the text of the popup
	The argument, when evaluated with a RTElement return an object, to which #asString is sent to
	
	See #text: for a longer description
	"
	self group: [ :group :element | 
		| backRectangle lbl |
		backRectangle := self createBackgroundElement: backgroundColor "(RTBox new color: (backgroundColor alpha: self alphaPopupBackground); borderWidth: 5; borderColor: borderColor) element".
		
		lbl := (RTLabel new 
				color: textColor;
				height: [:x | 9];
				text: (aOneArgBlock rtValue: element) asString) element.
		RTNest new centerOn: backRectangle elements: (Array with: lbl).
		group add: backRectangle; add: lbl
		] 

]
