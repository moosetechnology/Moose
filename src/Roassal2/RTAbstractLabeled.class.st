"
Abstract class for labeled interaction. Maybe this abstract class is not necessary, since it has only one subclass
"
Class {
	#name : #RTAbstractLabeled,
	#superclass : #RTInteraction,
	#instVars : [
		'canvas',
		'color',
		'highlightable',
		'lowColor',
		'offsetOnEdge',
		'position',
		'text',
		'fontSize',
		'labelTrachel',
		'shouldBeInTheBack'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #public }
RTAbstractLabeled class >> hasLabel: anElement [
	"Return whether the element has a label"
	^ anElement attributes keys includes: #RTLabelledLabel
]

{ #category : #public }
RTAbstractLabeled class >> removeLabelFrom: aRTElement [ 
	| callback label |
	callback := aRTElement attributeAt: #RTLabelledCallback ifAbsent: [ ^ self ].
	aRTElement trachelShape removeCallback: callback ifAbsent: [ ].
	label := aRTElement attributeAt: #RTLabelledLabel ifAbsent: [ ^ self ].
	label remove.
	aRTElement
		removeAttributeAt: #RTLabelledCallback;
		removeAttributeAt: #RTLabelledLabel.
]

{ #category : #removing }
RTAbstractLabeled class >> removeLabelFromElements: elements [
	"Remove label for each element of the collection"
	elements do: [ :e | self removeLabelFrom: e ]
]

{ #category : #visitor }
RTAbstractLabeled >> accept: aVisitor with: args [
	aVisitor visitLabelledInteraction: self with: args
]

{ #category : #'public - layout' }
RTAbstractLabeled >> below [
	position := #below
]

{ #category : #'public - layout' }
RTAbstractLabeled >> bottomLeft [
	position := #bottomLeft
]

{ #category : #'public - layout' }
RTAbstractLabeled >> center [
	position := #center		
]

{ #category : #accessing }
RTAbstractLabeled >> color [
	^ color
]

{ #category : #accessing }
RTAbstractLabeled >> color: aBlockOrColor [
	color := aBlockOrColor
]

{ #category : #accessing }
RTAbstractLabeled >> fontSize [
	^ fontSize
]

{ #category : #accessing }
RTAbstractLabeled >> fontSize: aPixelSizeAsInteger [
	fontSize := aPixelSizeAsInteger
]

{ #category : #initialization }
RTAbstractLabeled >> initialize [
	super initialize.
	
	"Labels should be in the back per default"
	shouldBeInTheBack := true.
]

{ #category : #testing }
RTAbstractLabeled >> isBelow [
	^ position = #below
]

{ #category : #testing }
RTAbstractLabeled >> isBottomLeft [
	^ position = #bottomLeft
]

{ #category : #testing }
RTAbstractLabeled >> isCenter [
	^ position = #center		
]

{ #category : #testing }
RTAbstractLabeled >> isLeft [
	^ position = #left
]

{ #category : #testing }
RTAbstractLabeled >> isRight [
	^ position = #right
]

{ #category : #testing }
RTAbstractLabeled >> isTop [
	^ position = #top
]

{ #category : #accessing }
RTAbstractLabeled >> lbl [
	^ labelTrachel
]

{ #category : #accessing }
RTAbstractLabeled >> left [
	position := #left
]

{ #category : #accessing }
RTAbstractLabeled >> lowColor [
	^ lowColor
]

{ #category : #accessing }
RTAbstractLabeled >> lowColor: aBlockOrColor [
	"Set the color used when the label is not highlighted"
	lowColor := aBlockOrColor
]

{ #category : #utility }
RTAbstractLabeled >> makeLabelHighlightableIfNecessaryBy: element [
	"Do nothing if there is no need to"
	highlightable ifFalse: [ ^ self ].
	
	labelTrachel color: lowColor.
	element when: TRMouseEnter do: [ :evt | labelTrachel color: color. labelTrachel pushFront. evt signalUpdate ].
	element when: TRMouseLeave do: [ :evt | 
		labelTrachel canvas ifNotNil: [ labelTrachel color: lowColor. self pushBackLabelIfNecessary. evt signalUpdate ] ].
]

{ #category : #accessing }
RTAbstractLabeled >> offsetOnEdge [
	^ offsetOnEdge
]

{ #category : #accessing }
RTAbstractLabeled >> offsetOnEdge: aFloat [
	"aFloat is between 0.0 and 1.0. With a value of 1.0, the label is close to the starting extremity, if RTLabelled is used on an edge"
	offsetOnEdge := aFloat
]

{ #category : #utility }
RTAbstractLabeled >> pushBackLabelIfNecessary [
	"move the label in the back, if configured properly"
	shouldBeInTheBack ifTrue: [
		labelTrachel pushBack ]
]

{ #category : #public }
RTAbstractLabeled >> removeLabelFrom: anElement [
	"Remove the label from anElement"
	self class removeLabelFrom: anElement
]

{ #category : #'public - layout' }
RTAbstractLabeled >> right [
	position := #right
]

{ #category : #'public configuration' }
RTAbstractLabeled >> setAsHighlightable [
	"Make the label highlightable by moving the mouse over the element
	
	Consider the example:
	=-=-=-=-=-
	| v es |
	v := RTView new.

	es := RTBox new size: 20; color: Color blue; elementsOn: #('Hello' 'World').
	v addAll: es.
	RTHorizontalLineLayout on: es.

	es do: [ :e |
		e @ (RTLabeled new color: Color red; setAsHighlightable) ]. 
	es @ RTDraggable.
	v
	=-=-=-=-=-
	"
	highlightable := true
]

{ #category : #'public configuration' }
RTAbstractLabeled >> setAsShouldBeInTheFront [
	"This method let the label trachel shape to be always in the front. 
	
	Consider the example:
	=-=-=-=-=-
	v := RTView new.

	es := RTBox new size: 20; color: Color blue; elementsOn: #('Hello' 'World').
	v addAll: es.
	RTHorizontalLineLayout on: es.

	es do: [ :e |
		e @ (RTLabeled new color: Color red; setAsHighlightable; setAsShouldBeInTheFront) ]. 
	es @ RTDraggable.
	v
	=-=-=-=-=-
	Try to remove the call to #setAsShouldBeInTheFront to see the effect by drag and dropping elements
	"
	shouldBeInTheBack := false
]

{ #category : #accessing }
RTAbstractLabeled >> text: aValueOrAOneArgBlock [
	"aValueOrAOneArgBlock is applied on the object model"
	self textElement: [ :anElement | aValueOrAOneArgBlock rtValue: anElement model ]
]

{ #category : #accessing }
RTAbstractLabeled >> textElement [
	"Return the string value, symbol, or block that is evaluated, using rtValue: against an element"
	^ text
]

{ #category : #accessing }
RTAbstractLabeled >> textElement: aTextOrBlock [
	text := aTextOrBlock
]

{ #category : #'public - layout' }
RTAbstractLabeled >> top [
	position := #top
]

{ #category : #accessing }
RTAbstractLabeled >> view: aBlockOrValue [
	"aBlock is evaluated against the element to get the canvas"
	canvas := [ :el | (aBlockOrValue rtValue: el) canvas ]
]
