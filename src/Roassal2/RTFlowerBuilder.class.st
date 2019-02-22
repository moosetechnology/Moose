"
I am an experimental builder based on codeflower page.

http://www.redotheweb.com/CodeFlower/

you can find examples of my instances in RTExperimentalExample
"
Class {
	#name : #RTFlowerBuilder,
	#superclass : #RTAbstractTreeBuilder,
	#instVars : [
		'line',
		'stepping'
	],
	#category : #'Roassal2-Experimental'
}

{ #category : #private }
RTFlowerBuilder >> addChildren: el [
	| ch ed |
	el attributes removeKey: #click ifAbsent: [].
	ch := el attributes at: self childrenKey.
	ch do: [ :x|
		view add: x.
		stepping addNode: x.
		ed := self line edgeFrom: el to: x.
		view add: ed.
		stepping addEdge: ed.
		self addChildren: x ].
]

{ #category : #private }
RTFlowerBuilder >> addOrRemove: el [
	| key |
	
	key := #click.
	(el attributes includesKey: key)
		ifTrue: [ 
			self addChildren: el.
			view edges pushBack.
			el trachelShape strokeWidth: 1 ]
		ifFalse: [
			el attributes at: key put: 0. 
			self removeChildren: el.
			(el attributes at: self childrenKey)
				ifNotEmpty: [ el trachelShape strokeWidth: 2  ] ].

		
]

{ #category : #private }
RTFlowerBuilder >> createEdges: array [
	| children |
	array do: [ :e | 
		children := (e attributes at: self childrenKey).
		children do: [ :ch |
			view add: (self line edgeFrom: e to: ch)].
		self createEdges: children. ]
		
		
]

{ #category : #initialization }
RTFlowerBuilder >> initialize [
	super initialize.
	self shape circle.
	line := RTShapeBuilder new.
	line line.
	self interaction draggable; popup;
		when: TRMouseClick do: [:evt | self addOrRemove: evt element ].
]

{ #category : #accessing }
RTFlowerBuilder >> line [
	^ line
]

{ #category : #accessing }
RTFlowerBuilder >> normalizer [

	^ super normalizer elements: elements; yourself
]

{ #category : #private }
RTFlowerBuilder >> removeChildren: el [
	| ch |
	ch := el attributes at: self childrenKey.
	ch do: [ :c |
		c view ifNotNil: [ 
			c remove.
			stepping removeNode: c.
			self removeChildren: c. ] ]
]

{ #category : #rendering }
RTFlowerBuilder >> renderIn: aView [

	| force |
	view := aView.
	super renderIn: aView.
	self createEdges: rootNodes.
	view edges pushBack.
	self normalizer
		elements: elements;
		build.
	force := RTForceBasedLayout new.
	stepping := RTForceLayoutStepping new
		view: aView.
	stepping layout: force.
	aView addAnimation: stepping.
	
		
	
	
]
