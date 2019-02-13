"
I am a class to create visualizations about rings, center is the root of the tree and arcs are the sub trees.

You can customize the angle of the arc, and play with the with radius and width of each arc.

"
Class {
	#name : #RTSunburstBuilder,
	#superclass : #RTAbstractTreeBuilder,
	#instVars : [
		'maxLevel'
	],
	#category : #'Roassal2-Builder-Sunburst'
}

{ #category : #configuration }
RTSunburstBuilder >> angularSpacing: anInteger [
	self strategy angularSpacing: anInteger
]

{ #category : #private }
RTSunburstBuilder >> createElements: atree nesting: block1 leaves: block2 depth: depth [
	| e |
	e := super createElements: atree nesting: block1 leaves: block2 depth: depth.
	maxLevel := maxLevel max: depth.
	^ e
]

{ #category : #private }
RTSunburstBuilder >> createElements: atree using: ablock depth: depth [
	| e |
	e := super createElements: atree using: ablock depth: depth.
	maxLevel := maxLevel max: depth.
	^ e
]

{ #category : #hooks }
RTSunburstBuilder >> createView [
	^ super createView @ RTDraggableView.
]

{ #category : #building }
RTSunburstBuilder >> from: objects nesting: block1 leaves: block2 [
	| r |
	r := super from: objects nesting: block1 leaves: block2.
	r do: [ :e | e attributes at: #parent put: nil].
	^ r
]

{ #category : #building }
RTSunburstBuilder >> from: objects using: ablock [
	| r |
	r := super from: objects using: ablock.
	r do: [ :e | e attributes at: #parent put: nil].
	^ r
]

{ #category : #configuration }
RTSunburstBuilder >> hasCenter: aBool [
	^ self strategy hasCenter: aBool
]

{ #category : #initialization }
RTSunburstBuilder >> initialize [
	super initialize.
	layoutBuilder := RTLayoutBuilder new.
	layoutBuilder sunburstWithArcWidth: 25.
	self leafWeight: 1.
	self shape arc color: [ Color random ].
	self interaction popup.
	maxLevel := 0.
]

{ #category : #accesing }
RTSunburstBuilder >> layout [
	^ layoutBuilder.
]

{ #category : #accesing }
RTSunburstBuilder >> maxLevel [
	^ maxLevel
]

{ #category : #configuration }
RTSunburstBuilder >> radialSpacing: anInteger [
	self strategy radialSpacing: anInteger
]

{ #category : #hooks }
RTSunburstBuilder >> renderIn: aView [
	| layout |
	super renderIn: aView.
	layout := self layout layout.
	layout builder: self.
	self layout setUpElements: self rootNodes.

]

{ #category : #accesing }
RTSunburstBuilder >> strategy [
	^ self layout layout
]
