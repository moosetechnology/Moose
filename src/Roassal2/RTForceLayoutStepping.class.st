Class {
	#name : #RTForceLayoutStepping,
	#superclass : #RTAnimation,
	#instVars : [
		'view',
		'layout',
		'afterBlock'
	],
	#category : #'Roassal2-Animation'
}

{ #category : #updating }
RTForceLayoutStepping >> addEdge: anEdge [
	layout addEdge: anEdge
]

{ #category : #updating }
RTForceLayoutStepping >> addEdges: someEdges [
	layout addEdges: someEdges

]

{ #category : #updating }
RTForceLayoutStepping >> addNode: anElement [
	"Designate the collection of elements that have to be layouted"
	layout 
		addNodes: (Array with: anElement)
]

{ #category : #updating }
RTForceLayoutStepping >> addNodes: someElements [
	"Designate the collection of elements that have to be layouted"
	layout 
		addNodes: someElements
]

{ #category : #'public-configuration' }
RTForceLayoutStepping >> addStartStopButton [

	view canvas addMenu: 'Toggle Animation' callback: [
		(view canvas hasAnimation: self)
			ifTrue: [ view canvas removeAnimation: self ]
			ifFalse: [ view canvas addAnimation: self ] ]
]

{ #category : #accessing }
RTForceLayoutStepping >> afterBlock: aBlock [
	"Set a block to be evaluated at each refresh"
	"Block could be [ view canvas camera focusOnCenter ]"
	afterBlock := aBlock
]

{ #category : #testing }
RTForceLayoutStepping >> hasCompleted [
	^ false
]

{ #category : #accessing }
RTForceLayoutStepping >> inView: aView [
	self view: aView.
	super inView: aView
]

{ #category : #initialization }
RTForceLayoutStepping >> initialize [
	super initialize.
	layout := RTForceBasedLayout new.
	afterBlock := [ ]
]

{ #category : #accessing }
RTForceLayoutStepping >> layout [
	^ layout
]

{ #category : #accessing }
RTForceLayoutStepping >> layout: aForceBasedLayout [
	"Set an instance of the class RTForceBasedLayout. 
	This is useful in case the layout is initialized from outside"
	self layoutWithoutPreparing: aForceBasedLayout.
	view ifNotNil: 
		[ self prepareLayoutFor: view ]
]

{ #category : #accessing }
RTForceLayoutStepping >> layoutWithoutPreparing: aForceBasedLayout [
	"Set an instance of the class RTForceBasedLayout. 
	This is useful in case the layout is initialized from outside"
	layout := aForceBasedLayout.

]

{ #category : #accessing }
RTForceLayoutStepping >> nodes [
	^ layout nodes
]

{ #category : #accessing }
RTForceLayoutStepping >> nodes: elements [
	"Designate the collection of elements that have to be layouted"
	layout 
		prepareNodes: elements;
		nodes: elements
]

{ #category : #accessing }
RTForceLayoutStepping >> prepareLayoutFor: aView [
	layout
		nodes: aView elements;
		edges: aView edges;
		start: aView elements
]

{ #category : #refreshing }
RTForceLayoutStepping >> refresh [
	layout step.
	view ifNotNil: [ view canvas signalUpdate ].
	afterBlock value
]

{ #category : #updating }
RTForceLayoutStepping >> removeAllEdges [
	layout removeAllEdges
]

{ #category : #updating }
RTForceLayoutStepping >> removeNode: anElement [
	"Designate the collection of elements that have to be layouted"
	layout 
		removeNode: anElement
]

{ #category : #actions }
RTForceLayoutStepping >> start [
	view canvas signalUpdate
]

{ #category : #actions }
RTForceLayoutStepping >> stopAndRemove [
	view removeAnimation: self
]

{ #category : #accessing }
RTForceLayoutStepping >> view: aView [
	view := aView.
	self prepareLayoutFor: aView
]
