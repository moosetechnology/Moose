"
This is a new builder to create a visualization of nodes with text
"
Class {
	#name : #RTInteractiveTreeBuilder,
	#superclass : #RTAbstractTreeBuilder,
	#instVars : [
		'labelShape',
		'lineShape',
		'layout',
		'gap',
		'padding',
		'afterClose',
		'afterOpen'
	],
	#category : #'Roassal2-Experimental'
}

{ #category : #accessing }
RTInteractiveTreeBuilder >> afterClose: aBlock [
	afterClose := aBlock
]

{ #category : #accessing }
RTInteractiveTreeBuilder >> afterOpen: aBlock [
	afterOpen := aBlock
]

{ #category : #interactions }
RTInteractiveTreeBuilder >> clickOnElement: e [
	| translator |
	translator := RTSmoothLayoutTranslator new.
	translator nbCycles: 1.
	
	(self isElementOpened: e)
		ifTrue: [ self closeElement: e ]
		ifFalse: [ self openElement: e ].
		
	layoutBuilder layout
		translator: translator;
		on: (e view elements select: [ :el | el shape class = self shape shape class ]).
	layoutBuilder layout
		translator: translator;
		on: (e view elements select: [ :el | el shape class = self shape shape class ]).
]

{ #category : #interactions }
RTInteractiveTreeBuilder >> closeElement: e [
	| children |
	
	children := e attributes at: self childrenKey.
	self closeNodes: children.
	e attributes at: #open put: false.
	afterClose ifNotNil: [ afterClose rtValue: e ].
]

{ #category : #interactions }
RTInteractiveTreeBuilder >> closeNodes: arr [
	arr do: [ :e |
		self removeIfPossible: e .
		self removeIfPossible: (e attributes at: #label).
		e connectedEdges do: #remove.
		self closeNodes: (e attributes at: self childrenKey)
		 ].
]

{ #category : #private }
RTInteractiveTreeBuilder >> controlPointsFor: anEdge [
	| x1 y1 x2 y2 |
	(layout = #leftward or: [ layout = #rightward ])
		ifTrue: [ 
			x1 := x2 := (anEdge from position x + anEdge to position x) / 2.
			y1 := anEdge from position y.
			y2 := anEdge to position y ]
		ifFalse: [ 
			y1 := y2 := (anEdge from position y + anEdge to position y) / 2.
			x1 := anEdge from position x.
			x2 := anEdge to position x] .
	
	^ Array with: x1@y1 with: x2@y2.
]

{ #category : #private }
RTInteractiveTreeBuilder >> createEdges: arr [
	| edges |
	edges := RTGroup new.
	arr do: [ :e | | children |
		children := e attributes at: self childrenKey.
		children do: [ :child |
			edges add: (self lineShape edgeFrom: e to: child) ].
		edges addAll: (self createEdges: children) ].
	^ edges.
]

{ #category : #private }
RTInteractiveTreeBuilder >> createLabels [
	^ elements collect: [ :e | | lbl const isLeaf |
		lbl := self labelShape elementOn: e model.
		e attributes at: #label put: lbl.
		const := RTConstraint movable: lbl fix: e.
		const
				horizontalPadding: padding x;
				verticalPadding: padding y;
				outer.
		isLeaf := (e attributes at: self childrenKey) isEmpty.
		layout = #rightward ifTrue: [ const left.
			isLeaf ifTrue: [ const right ] ].
		layout = #leftward ifTrue: [ const right.
			isLeaf ifTrue: [ const left ] ].
		layout = #upward 
			ifTrue: [ const right; top ].
		layout = #downward 
			ifTrue: [ const right; top  ].
		const stick.
		lbl
	 ].
]

{ #category : #hooks }
RTInteractiveTreeBuilder >> createView [
	^ RTView new @ RTDraggableView @ RTZoomableView
]

{ #category : #layout }
RTInteractiveTreeBuilder >> downward [
	layout := #downward.
	layoutBuilder tree.
]

{ #category : #'accessing - gaps' }
RTInteractiveTreeBuilder >> gap [
	^ gap
]

{ #category : #'accessing - gaps' }
RTInteractiveTreeBuilder >> gap: aPoint [
	gap := aPoint
]

{ #category : #'accessing - gaps' }
RTInteractiveTreeBuilder >> horizontalGap: aNumber [
	gap := aNumber @ gap y.
]

{ #category : #'accessing - gaps' }
RTInteractiveTreeBuilder >> horizontalPadding: aNumber [
	padding := aNumber @ padding y
]

{ #category : #initialization }
RTInteractiveTreeBuilder >> initialize [
	super initialize.
	self shape circle size: 15; color: Color white; 
		borderColor: (Color colorFrom: '#4682B4'); borderWidth: 2.
	
	labelShape := RTShapeBuilder new.
	labelShape shape: (RTRotatedLabel new).
	labelShape color: Color black; text: #yourself.
	self afterClose: [ :e | e trachelShape color: Color blue ].
	self afterOpen: [ :e | e trachelShape color: Color white ].
	self interaction draggable; popup; 
		when: TRMouseClick do: [:evt | self clickOnElement: evt element ].
	
	layoutBuilder := RTLayoutBuilder new.
	lineShape := RTShapeBuilder new.
	lineShape shape: (RTBezier4Line new
		controllingElements: [:e | self controlPointsFor: e ] ) .
	self paddingText: 10@0.
	self gap: 100@100.
	self rightward.
	
]

{ #category : #interactions }
RTInteractiveTreeBuilder >> isElementOpened: e [
	^ e attributes at: #open ifAbsentPut: [ true ].
]

{ #category : #accessing }
RTInteractiveTreeBuilder >> labelShape [
	^ labelShape
]

{ #category : #layout }
RTInteractiveTreeBuilder >> leftward [
	layout := #leftward.
	layoutBuilder horizontalTree horizontallyReverse.
	
]

{ #category : #accessing }
RTInteractiveTreeBuilder >> lineShape [
	^ lineShape
]

{ #category : #interactions }
RTInteractiveTreeBuilder >> openChildren: arr parent: p [
	| temp |
	temp := OrderedCollection new.
	arr do: [ :e |
		(self isElementOpened: e)
			ifFalse: [ 
				e attributes at: #open put: true.
				afterOpen ifNotNil: [ afterOpen rtValue: e ] ].
		temp add: e.
		e translateTo: p position.
		temp add: (e attributes at: #label).
		temp add: (self lineShape edgeFrom: p to: e).
		temp addAll: (self openChildren: (e attributes at: self childrenKey) parent: e)
		 ].
	^ temp
	
]

{ #category : #interactions }
RTInteractiveTreeBuilder >> openElement: e [
	| children |
	
	children := e attributes at: self childrenKey.
	e view addAll: (self openChildren: children parent: e).
	e attributes at: #open put: true.
	afterOpen ifNotNil: [ afterOpen rtValue: e ].
]

{ #category : #'accessing - gaps' }
RTInteractiveTreeBuilder >> paddingText [
	^ padding
]

{ #category : #'accessing - gaps' }
RTInteractiveTreeBuilder >> paddingText: aPoint [
	padding := aPoint
]

{ #category : #interactions }
RTInteractiveTreeBuilder >> removeIfPossible: e [
	e view ifNotNil: [ e remove ].
]

{ #category : #hooks }
RTInteractiveTreeBuilder >> renderIn: aView [
	| edges labels |
	aView addAll: elements.
	edges := self createEdges: self rootNodes.
	aView addAll: edges.
	edges pushBack.
	
	layoutBuilder layout 
		horizontalGap: gap x;
		verticalGap: gap y;
		on: elements.
		
	labels := self createLabels.
	aView addAll: labels.
	
]

{ #category : #layout }
RTInteractiveTreeBuilder >> rightward [
	layout := #rightward.
	layoutBuilder horizontalTree
]

{ #category : #layout }
RTInteractiveTreeBuilder >> upward [
	layout := #upward.
	layoutBuilder tree verticallyReverse.
]

{ #category : #'accessing - gaps' }
RTInteractiveTreeBuilder >> verticalGap: aNumber [
	gap := gap x @ aNumber.
]

{ #category : #'accessing - gaps' }
RTInteractiveTreeBuilder >> verticalPadding: aNumber [
	padding := padding x @ aNumber
]
