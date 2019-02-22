"
I am iteratively buildable constraint for moving and positioning an element on top of another one.

!! Usage

The order of configuration message sends is irrelevant, only the last of a group will be used.

Note: ==move== and ==stick== will execute the movement on the configured object (so if you ==stick== shapes and then change configuration, it will honor the new configuration.

[ [ [
(RTConstraint on: aChildShape background:  parentShape)
	top | middle | bottom; ""vertical position""
	left | center | right; ""horizontal position""
	inner | border | outer; ""inside the parent, on border, outside""
	move; ""execute movement""
	padding: aNumber; ""shortcut for vertical + horizontal padding""
	verticalPadding: aNumber;
	horizontalPadding: aNumber;
	stick ""add callbacks that will continuously execute the movement""
]]]

See ==self default== for default configuration.

[ [ [
v := RTView new.
es := (RTBox new size: 50) element.
es @ RTDraggable.
v add: es.

l := RTLabel elementOn: 'This is a label!'.
v add: l.

RTConstraint new
	moveable: l;
	fix: es;
	inner;
	bottom;
	move.
v 
 ] ] ]
"
Class {
	#name : #RTConstraint,
	#superclass : #RTObject,
	#instVars : [
		'verticalPadding',
		'horizontalPadding',
		'directionY',
		'directionX',
		'orientation',
		'fixedElement',
		'fixedElementX',
		'fixedElementY',
		'movableElementY',
		'movableElement',
		'movableElementX'
	],
	#category : #'Roassal2-Core'
}

{ #category : #'instance creation' }
RTConstraint class >> movable: moveableElement fix: fixedElement [
	^ self new
		movable: moveableElement fix: fixedElement;
		yourself
]

{ #category : #convenient }
RTConstraint class >> move: es1 onTheLeftOf: es2 [
	"Both es1 and es2 could be one element, a group of elements, or a group of Trachel shapesl "
	(RTConstraint on: es1 background: es2) leftOf; move
]

{ #category : #convenient }
RTConstraint class >> move: es1 onTheRightOf: es2 [
	"Both es1 and es2 could be one element, a group of elements, or a group of Trachel shapesl "
	(RTConstraint on: es1 background: es2) rightOf; move
]

{ #category : #obsolete }
RTConstraint class >> on: aChildShape background: aParentShape [
	^ self new
		setChild: aChildShape parent: aParentShape;
		yourself
]

{ #category : #convenient }
RTConstraint class >> stick: es1 onTheLeftOf: es2 [
	"Both es1 and es2 could be one element, a group of elements, or a group of Trachel shapesl "
	(RTConstraint on: es1 background: es2) leftOf; stick
]

{ #category : #convenient }
RTConstraint class >> stick: es1 onTheRightOf: es2 [
	"Both es1 and es2 could be one element, a group of elements, or a group of Trachel shapesl "
	(RTConstraint on: es1 background: es2) rightOf; stick
]

{ #category : #'public - positioning shortcuts' }
RTConstraint >> above [
	self top.
	self outer
]

{ #category : #'public - positioning shortcuts' }
RTConstraint >> below [
	self bottom.
	self outer
]

{ #category : #'public - modifiers' }
RTConstraint >> border [
	orientation := 0
]

{ #category : #'public - positioning' }
RTConstraint >> bottom [
	fixedElementY := [ :shape | shape encompassingRectangle bottom ].
	directionY := -1
]

{ #category : #'public - positioning shortcuts' }
RTConstraint >> bottomLeft [
	self
		bottom;
		left
]

{ #category : #'public - positioning shortcuts' }
RTConstraint >> bottomRight [
	self
		bottom;
		right
]

{ #category : #'public - positioning' }
RTConstraint >> center [
	fixedElementX := [ :shape | shape position x ].
	directionX := 0
]

{ #category : #private }
RTConstraint >> computeX [
	^ movableElement width / 2 + horizontalPadding * orientation * directionX + self parentX
]

{ #category : #private }
RTConstraint >> computeY [
	^ movableElement height / 2 + verticalPadding * orientation * directionY + self parentY
]

{ #category : #initialization }
RTConstraint >> default [
	self padding: 0.
	self inner.
	self middle.
	self center
]

{ #category : #initialization }
RTConstraint >> fix: aFixedElement [
	fixedElement := aFixedElement
]

{ #category : #'public - modifiers' }
RTConstraint >> horizontalPadding: aNumber [
	horizontalPadding := aNumber
]

{ #category : #initialization }
RTConstraint >> initialize [
	super initialize.
	self default.
	movableElementX := [ :shape | shape width / 2 ].
	movableElementY := [ :shape | shape height / 2 ]
]

{ #category : #'public - modifiers' }
RTConstraint >> inner [
	orientation := 1
]

{ #category : #'public - positioning' }
RTConstraint >> left [
	fixedElementX := [ :shape | shape encompassingRectangle left ].
	directionX := 1
]

{ #category : #'public - positioning shortcuts' }
RTConstraint >> leftOf [
	self left.
	self outer
]

{ #category : #'public - positioning' }
RTConstraint >> middle [
	fixedElementY := [ :shape | shape position y ].
	directionY := 0
]

{ #category : #initialization }
RTConstraint >> movable: aMovableElement [
	movableElement := aMovableElement
]

{ #category : #initialization }
RTConstraint >> movable: aMovableElement fix: aFixedElement [
	movableElement := aMovableElement.
	fixedElement := aFixedElement
]

{ #category : #'public - executing' }
RTConstraint >> move [
	movableElement translateTo: self computeX @ self computeY
]

{ #category : #'public - modifiers' }
RTConstraint >> outer [
	orientation := -1
]

{ #category : #'public - modifiers' }
RTConstraint >> padding: aNumber [
	self verticalPadding: aNumber.
	self horizontalPadding: aNumber
]

{ #category : #private }
RTConstraint >> parentX [
	^ fixedElementX value: fixedElement
]

{ #category : #private }
RTConstraint >> parentY [
	^ fixedElementY value: fixedElement
]

{ #category : #'public - positioning' }
RTConstraint >> right [
	fixedElementX := [ :shape | shape encompassingRectangle right ].
	directionX := -1
]

{ #category : #'public - positioning shortcuts' }
RTConstraint >> rightOf [
	self right.
	self outer
]

{ #category : #obsolete }
RTConstraint >> setChild: aChildShape parent: aParentShape [
	fixedElement := aParentShape.
	movableElement := aChildShape
]

{ #category : #'public - executing' }
RTConstraint >> stick [
	| block |
	self move.
	block := [ :shape :step | self move ].
	fixedElement addCallback: (TRTranslationCallback block: block).
	fixedElement addCallback: (TRExtentCallback block: block)
]

{ #category : #'public - positioning' }
RTConstraint >> top [
	fixedElementY := [ :shape | shape encompassingRectangle top ].
	directionY := 1
]

{ #category : #'public - positioning shortcuts' }
RTConstraint >> topLeft [
	self
		top;
		left
]

{ #category : #'public - positioning shortcuts' }
RTConstraint >> topRight [
	self
		top;
		right
]

{ #category : #'public - modifiers' }
RTConstraint >> verticalPadding: aNumber [
	verticalPadding := aNumber
]
