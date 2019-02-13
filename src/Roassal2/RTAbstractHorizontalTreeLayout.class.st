"
A ROAbstractHorizontalTreeLayout is xxxxxxxxx.

"
Class {
	#name : #RTAbstractHorizontalTreeLayout,
	#superclass : #RTAbstractRegularTreeLayout,
	#category : #'Roassal2-Layouts'
}

{ #category : #testing }
RTAbstractHorizontalTreeLayout class >> isAbstract [
	^ self = RTAbstractHorizontalTreeLayout
]

{ #category : #'hook-private' }
RTAbstractHorizontalTreeLayout >> computeChildrenFor: aNode [
	self subclassResponsibility
]

{ #category : #'default attach points' }
RTAbstractHorizontalTreeLayout >> defaultAttachPoint [
	^ RTHorizontalAttachPoint new
]

{ #category : #reversing }
RTAbstractHorizontalTreeLayout >> horizontallyReverse: elements [
	"Horizontally reverse the elements, as well as the attachpoints"

	super horizontallyReverse: elements.
	self inverseAttachPointIfNecessary
]

{ #category : #'initialize-release' }
RTAbstractHorizontalTreeLayout >> initialize [
	super initialize.
	verticalGap := 3.
	horizontalGap := 20
]

{ #category : #reversing }
RTAbstractHorizontalTreeLayout >> inverseAttachPoint [
	"Invert the attach point of all the considered edges. It is likely that all the attachpoint are the same, but we do not have a garanty"

	| a |
	a := RTShorterHorizontalDistanceAttachPoint new.
	edges
		do: [ :edge | 
			edge shape attachPoint: a.
			edge updateFromTo ]

]

{ #category : #reversing }
RTAbstractHorizontalTreeLayout >> inverseAttachPointIfNecessary [
	"Inverse the attach point if the user has not used #doNotAttachPoint"
	self shouldSetDefaultAttachPoint
		ifTrue: [ self inverseAttachPoint ]
]

{ #category : #'hook-private' }
RTAbstractHorizontalTreeLayout >> layout: aNodeCollection atPoint: aPoint atLayer: aNumber [
	| treeSize childrenPosition x y middleOfTree |
	aNodeCollection isEmpty ifTrue: [ ^ 0 ].
	x := aPoint x.
	y := aPoint y.
	alreadyLayoutedNodes addAll: aNodeCollection.
	self atLayer: aNumber add: aNodeCollection.
	aNodeCollection do: [ :each | 
		childrenPosition := x + each width + self horizontalGap.
		treeSize := each height
			max: (self layout: (self computeChildrenFor: each) atPoint: childrenPosition @ y atLayer: aNumber + 1).
		middleOfTree := y + (treeSize / 2.0) - (each height / 2.0).
		translator translateTopLeftOf: each to: (x @ middleOfTree).
		y := y + treeSize + self verticalGap.
		self step ].
	^ y - aPoint y - self verticalGap
]

{ #category : #private }
RTAbstractHorizontalTreeLayout >> rearrangeByLayers: aGraph [
	| cursor layerDepthSize |
	cursor := self leftGap.
	nodesByLayer do: [ :eachSetOfNodes |
		layerDepthSize := eachSetOfNodes inject: 0 into: [ :max :eachNode | 
			translator translateTopLeftOf: eachNode to: (cursor @ eachNode encompassingRectangle top).
			max max: eachNode width ].
		cursor := cursor + layerDepthSize + self horizontalGap ]
]
