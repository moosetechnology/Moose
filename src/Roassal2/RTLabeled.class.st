"
A RTLabeled  adds a label above an element. The label may be particularized using #text: in the default string representation is not sufficient. Consider:

E.g., 
v := RTView new.
e := (RTEllipse new size: 30) elementOn: 42.
v add: e.
e @ (RTLabeled new text: [ :value | 'My value is ', value asString ]).
v

Instance Variables
	canvas:		<Object>
	color:		<Object>
	highlightable:		<Object>
	lowColor:		<Object>
	offsetOnEdge:		<Object>
	position:		<Object>
	text:		<Object>

canvas
	- xxxxx

color
	- xxxxx

highlightable
	- xxxxx

lowColor
	- xxxxx

offsetOnEdge
	- xxxxx

position
	- xxxxx

text
	- xxxxx

"
Class {
	#name : #RTLabeled,
	#superclass : #RTAbstractLabeled,
	#category : #'Roassal2-Interactions'
}

{ #category : #public }
RTLabeled class >> above [
	"Default behavior"
	^ self new
]

{ #category : #public }
RTLabeled class >> below [
	^ self new below
]

{ #category : #public }
RTLabeled class >> center [
	^ self new center
]

{ #category : #initialization }
RTLabeled >> initialize [
	super initialize.
	text := #model.
	self top.
	color := Color gray.
	lowColor := Color veryVeryLightGray.
	
	highlightable := false. 
	offsetOnEdge := 0.5.

	fontSize := TRLabelShape defaultFontSize.

	canvas := [ :el | 
		el view ifNil: [ self error: 'You are trying to use RTLabelled on an element before adding the element to the view. Two solutions: (i) specify the view to the RTLabelled (using #view:) or (ii) use RTLabelled after having added the element' ].
		el view canvas ]
]

{ #category : #hooks }
RTLabeled >> initializeElement: element [
	| s t |
	"We first get a reference to the canvas, and then we add the shape in it"
	"We are using the variable canvas to let the user specificy the canvas (or the view) before 
	adding the element into it"
	"Make sure that if we remove the element, the trachel shape is also removed"
	"Not really nice. Maybe a different solution could be to have a double dispatch"
	t := text rtValue: element.
	t isNil
		ifTrue: [ ^ self ].
	s := element trachelShape.
	labelTrachel := TRLabelShape new text: t asString.
	labelTrachel color: (color rtValue: element).
	labelTrachel fontSize: (fontSize rtValue: element model).
	canvas := canvas rtValue: element.
	canvas addShape: labelTrachel.
	self pushBackLabelIfNecessary.
	self makeLabelHighlightableIfNecessaryBy: element.
	self registerRemoveCallbackForElement: element.
	(element isKindOf: RTEdge)
		ifTrue: [ TRConstraint
				stick: labelTrachel
				between: element from trachelShape
				and: element to trachelShape
				offset: offsetOnEdge.
			^ labelTrachel ].
	self positionLabelAgainst: s.
	^ labelTrachel
]

{ #category : #hooks }
RTLabeled >> positionLabelAgainst: s [
	"Argument is a trachel shape"
	self isTop
		ifTrue: [ TRConstraint stick: labelTrachel above: s ].
	self isBelow
		ifTrue: [ TRConstraint stick: labelTrachel below: s ].
	self isLeft
		ifTrue: [ TRConstraint stick: labelTrachel onTheLeftOf: s ].
	self isRight
		ifTrue: [ TRConstraint stick: labelTrachel onTheRightOf: s ].
	self isCenter
		ifTrue: [ TRConstraint stick: labelTrachel onTheCenterOf: s ].
	self isBottomLeft
		ifTrue: [ TRConstraint stick: labelTrachel onTheBottomLeftOf: s ]
]

{ #category : #hooks }
RTLabeled >> registerRemoveCallbackForElement: element [
	| callback |
	callback := TRRemoveCallback new
		block: [ :shape | labelTrachel remove ].	"Make sure that if we remove the element, the trachel shape is also removed"
	element trachelShape addCallback: callback.
	element
		attributeAt: #RTLabelledCallback put: callback;
		attributeAt: #RTLabelledLabel put: labelTrachel
]
