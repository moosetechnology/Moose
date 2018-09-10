"
A ROAbstractVerticalTreeLayout is xxxxxxxxx.

"
Class {
	#name : #RTAbstractVerticalTreeLayout,
	#superclass : #RTAbstractRegularTreeLayout,
	#category : #'Roassal2-Layouts'
}

{ #category : #testing }
RTAbstractVerticalTreeLayout class >> isAbstract [
	^ self = RTAbstractVerticalTreeLayout
]

{ #category : #'hook-private' }
RTAbstractVerticalTreeLayout >> computeChildrenFor: aNode [
	self subclassResponsibility
]

{ #category : #'default attach points' }
RTAbstractVerticalTreeLayout >> defaultAttachPoint [
	^ RTVerticalAttachPoint new
]

{ #category : #'initialize-release' }
RTAbstractVerticalTreeLayout >> initialize [
	super initialize.
	verticalGap := 20.
	horizontalGap := 3
]

{ #category : #reversing }
RTAbstractVerticalTreeLayout >> inverseAttachPoint [
	"Invert the attach point of all the considered edges. It is likely that all the attachpoint are the same, but we do not have a garanty"

	| a |
	a := RTShorterVerticalDistanceAttachPoint new.
	edges
		do: [ :edge | 
			edge shape attachPoint: a.
			edge updateFromTo ]

]

{ #category : #reversing }
RTAbstractVerticalTreeLayout >> inverseAttachPointIfNecessary [
	"Inverse the attach point if the user has not used #doNotAttachPoint"
	self shouldSetDefaultAttachPoint
		ifTrue: [ self inverseAttachPoint ]
]

{ #category : #'hook-private' }
RTAbstractVerticalTreeLayout >> layout: aNodeCollection atPoint: aPoint atLayer: aNumber [
	| treeSize childrenPosition x y middleOfTree |
	aNodeCollection isEmpty ifTrue: [ ^ 0 ].
	x := aPoint x.
	y := aPoint y.
	alreadyLayoutedNodes addAll: aNodeCollection.
	self atLayer: aNumber add: aNodeCollection.
	aNodeCollection do: [ :each | 
		childrenPosition := y + each height + self verticalGap.
		treeSize := each width
			max: (self layout: (self computeChildrenFor: each) atPoint: x @ childrenPosition atLayer: aNumber + 1).
		middleOfTree := x + (treeSize / 2.0) - (each width / 2.0).
		translator translateTopLeftOf: each to: middleOfTree @ y.
		x := x + treeSize + self horizontalGap.
		self step ].
	^ x - aPoint x - self horizontalGap
]

{ #category : #private }
RTAbstractVerticalTreeLayout >> rearrangeByLayers: aGraph [
	| cursor layerDepthSize |
	cursor := self topGap.
	nodesByLayer do: [:eachSetOfNodes |
		layerDepthSize := eachSetOfNodes inject: 0 into: [:max :eachNode | 
			eachNode translateTo: (eachNode position x @ cursor ).
			max max: eachNode height ].
		cursor := cursor + layerDepthSize + self verticalGap ]
]

{ #category : #reversing }
RTAbstractVerticalTreeLayout >> verticallyReverse: elements [
	"Vertically reverse the elements, as well as the attachpoints"

	super verticallyReverse: elements.
	self inverseAttachPointIfNecessary
]
