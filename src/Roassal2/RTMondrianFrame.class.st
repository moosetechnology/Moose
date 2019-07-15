"
A RTMondrianFrame is an elementary unit in Mondrian.

Instance Variables
	childrenFrame:		<RTMondrianFrame>
	depth:		<SmallInteger>
	elements:		<RTGroup>
	parent:		<RTMondrianFrame>
	parentFrame:		<RTMondrianFrame>

childrenFrame
	- xxxxx

depth
	- xxxxx

elements
	- xxxxx

parent
	- xxxxx

parentFrame
	- xxxxx

"
Class {
	#name : #RTMondrianFrame,
	#superclass : #RTObject,
	#instVars : [
		'parentFrame',
		'depth',
		'parent',
		'elements',
		'childrenFrame'
	],
	#category : #'Roassal2-Builder-Mondrian'
}

{ #category : #adding }
RTMondrianFrame >> addElements: someElements [
	elements addAll: someElements
]

{ #category : #frames }
RTMondrianFrame >> childrenFrames [
	^ childrenFrame copy
]

{ #category : #accessing }
RTMondrianFrame >> depth [
	"Return the depth of the frame, as integer"
	^ depth
]

{ #category : #accessing }
RTMondrianFrame >> depth: anInteger [
	"Set the depth of the frame, an integer"
	depth := anInteger
]

{ #category : #accessing }
RTMondrianFrame >> elements [
	^ elements
]

{ #category : #initialization }
RTMondrianFrame >> initialize [
	super initialize.
	depth := 1.
	childrenFrame := OrderedCollection new.
	elements := RTGroup new.
]

{ #category : #frames }
RTMondrianFrame >> numberOfAllFrames [
	^ 1 + (childrenFrame inject: 0 into: [ :sum :frame | sum + frame numberOfAllFrames ])
]

{ #category : #frames }
RTMondrianFrame >> numberOfChildrenFrames [
	^ childrenFrame size
]

{ #category : #'accessing-computed' }
RTMondrianFrame >> numberOfElements [
	^ elements size
]

{ #category : #accessing }
RTMondrianFrame >> parentFrame [
	^ parentFrame
]

{ #category : #accessing }
RTMondrianFrame >> parentFrame: anObject [
	parentFrame := anObject
]

{ #category : #frames }
RTMondrianFrame >> pushFrame: aFrame [
	childrenFrame add: aFrame.
	aFrame parentFrame: self.
	aFrame depth: self depth + 1
]
