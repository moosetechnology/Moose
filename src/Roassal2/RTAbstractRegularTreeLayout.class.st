"
A ROAbstractRegularTreeLayout is xxxxxxxxx.

Instance Variables
	alreadyLayoutedNodes:		<Object>
	isLayered:		<Object>
	leftGap:		<Object>
	nodesByLayer:		<Object>
	topGap:		<Object>

alreadyLayoutedNodes
	- xxxxx

isLayered
	- xxxxx

leftGap
	- xxxxx

nodesByLayer
	- xxxxx

topGap
	- xxxxx

"
Class {
	#name : #RTAbstractRegularTreeLayout,
	#superclass : #RTAbstractGraphLayout,
	#instVars : [
		'alreadyLayoutedNodes',
		'topGap',
		'leftGap',
		'nodesByLayer',
		'isLayered',
		'shouldBeHorizontallyReversed',
		'shouldBeVerticallyReversed'
	],
	#category : #'Roassal2-Layouts'
}

{ #category : #testing }
RTAbstractRegularTreeLayout class >> isAbstract [
	^ self = RTAbstractRegularTreeLayout
]

{ #category : #private }
RTAbstractRegularTreeLayout >> atLayer: aNumber add: aNodeCollection [
	| collection |
	collection := nodesByLayer at: aNumber ifAbsentPut: [OrderedCollection new].
	collection addAll: aNodeCollection
]

{ #category : #hook }
RTAbstractRegularTreeLayout >> doExecute: elements [
	| rootNodes |
	alreadyLayoutedNodes := OrderedCollection new.
	rootNodes := self rootNodesFor: elements.
	nodesByLayer := OrderedCollection new.
	self
		layout: rootNodes
		atPoint: self leftGap @ self topGap
		atLayer: 1.
	self isLayered ifTrue: [
		self rearrangeByLayers: elements ]
]

{ #category : #hook }
RTAbstractRegularTreeLayout >> doPost: elements [
	shouldBeHorizontallyReversed ifTrue: [ self horizontallyReverse: elements ].
	shouldBeVerticallyReversed ifTrue: [ self verticallyReverse: elements ].
]

{ #category : #accessing }
RTAbstractRegularTreeLayout >> horizontallyReverse [
	shouldBeHorizontallyReversed := true
]

{ #category : #reversing }
RTAbstractRegularTreeLayout >> horizontallyReverse: elements [
	"Horizontally reverse the elements, as well as the attachpoints"

	| g largeur |
	g := elements asGroup.
	largeur := g extent x.
	elements
		do: [ :el | el translateTo: (largeur - el position x) @ el position y ]
]

{ #category : #'initialize-release' }
RTAbstractRegularTreeLayout >> initialize [
	super initialize.
	topGap := 5.
	leftGap := 5.
	isLayered := false.
	shouldBeHorizontallyReversed := false.
	shouldBeVerticallyReversed := false.
	self doAttachPoint.
]

{ #category : #reversing }
RTAbstractRegularTreeLayout >> inverseAttachPoint [
	"Invert the attach point of all the considered edges. It is likely that all the attachpoint are the same, but we do not have a garanty"
	self shouldSetDefaultAttachPoint ifFalse: [ ^ self ].
	edges
		do: [ :edge | 
			edge shape attachPoint inverted: true.
			edge updateFromTo ]
]

{ #category : #accessing }
RTAbstractRegularTreeLayout >> isLayered [
	"Is the layout layered"
	
	^ isLayered
]

{ #category : #accessing }
RTAbstractRegularTreeLayout >> isLayered: boolean [
	"Is the layout layered"
	
	isLayered := boolean
]

{ #category : #accessing }
RTAbstractRegularTreeLayout >> layered [
	self isLayered: true
]

{ #category : #'hook-private' }
RTAbstractRegularTreeLayout >> layout: aNodeCollection atPoint: aPoint atLayer: anObject [
	self subclassResponsibility
]

{ #category : #accessing }
RTAbstractRegularTreeLayout >> leftGap [
	^ leftGap
]

{ #category : #accessing }
RTAbstractRegularTreeLayout >> leftGap: anInteger [
	leftGap := anInteger
]

{ #category : #private }
RTAbstractRegularTreeLayout >> rearrangeByLayers: aGraph [
	self subclassResponsibility
]

{ #category : #accessing }
RTAbstractRegularTreeLayout >> shouldBeHorizontallyReversed [
	"Return if the layout is horizontally reversed"
	^ shouldBeHorizontallyReversed 
]

{ #category : #accessing }
RTAbstractRegularTreeLayout >> shouldBeVerticallyReversed [
	"Return if the layout is vertically reversed"
	^ shouldBeVerticallyReversed
]

{ #category : #accessing }
RTAbstractRegularTreeLayout >> topGap [
	^ topGap
]

{ #category : #accessing }
RTAbstractRegularTreeLayout >> topGap: anInteger [
	topGap := anInteger
]

{ #category : #accessing }
RTAbstractRegularTreeLayout >> verticallyReverse [
	"Reverse the edge extremities"
	"Here is an example:

| b |	
b := RTMondrian new.
b nodes: (1 to: 100).
b edges connectFrom: [ :v | v // 2 ].
b layout tree verticallyReverse.
b
"
	shouldBeVerticallyReversed := true
	

]

{ #category : #reversing }
RTAbstractRegularTreeLayout >> verticallyReverse: elements [
	"Vertically reverse the elements, as well as the attachpoints"

	| g hauteur |
	g := elements asGroup.
	hauteur := g extent y.
	elements
		do: [ :el | el translateTo: el position x @ (hauteur - el position y) ]
]
