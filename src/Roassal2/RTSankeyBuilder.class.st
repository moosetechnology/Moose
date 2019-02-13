"
I am a experimental class to have a sankey visualization
more info in this link
http://en.wikipedia.org/wiki/Sankey_diagram
"
Class {
	#name : #RTSankeyBuilder,
	#superclass : #RTBuilder,
	#instVars : [
		'extent',
		'nodePadding',
		'elements',
		'links',
		'linkFrom',
		'linkTo',
		'lineShape',
		'linkValue',
		'edges',
		'interactionEdge',
		'iterations',
		'labelShape',
		'labelInteraction',
		'lelements'
	],
	#category : #'Roassal2-Experimental'
}

{ #category : #private }
RTSankeyBuilder >> centerOf: el [
	^ (el attributes at: #y) + ((el attributes at: #dy) /2 )
]

{ #category : #private }
RTSankeyBuilder >> computeEdges [
	links ifNil: [ ^  self ].
	elements do: [ :e |
		e attributes 
			at: #sourceLinks put: OrderedCollection new;
			at: #targetLinks put: OrderedCollection new ].
	
	edges := links collect: [ :l | | e1 e2 edge|
		e1 := elements elementFromModel: (linkFrom value: l).
		e2 := elements elementFromModel: (linkTo value: l).
		edge := lineShape edgeFrom: e1 to: e2.
		interactionEdge setUpElement: edge.
		edge attributes at: #value put: (linkValue rtValue: l).
		(e1 attributes at: #sourceLinks) add: edge.
		(e2 attributes at: #targetLinks) add: edge.
		view add: edge.
		edge ].
	edges do: #pushBack.
	
]

{ #category : #private }
RTSankeyBuilder >> computeEdgesDepths [
	elements do: [ :el |
		"(el model at: #name) = 'Thermal generation' ifTrue: [ self halt. ]."
		(el attributes at: #sourceLinks) sort: [:a :b | 
			(a to attributes at: #y) < (b from attributes at: #y) ].
		(el attributes at: #targetLinks) sort:  [ :a :b | 
			(a from attributes at: #y) < (b to attributes at: #y) ].
		 ].
	elements do: [ :el | | sy ty|
		sy := ty := 0.
		(el attributes at: #sourceLinks) do: [ :ed |
			ed attributes at: #sy put: sy.
			sy := sy + (ed attributes at: #dy) ].
		(el attributes at: #targetLinks) do: [ :ed |
			ed attributes at: #ty put: ty.
			ty := ty + (ed attributes at: #dy) ].
		 ].
]

{ #category : #private }
RTSankeyBuilder >> computeElementBreadths [
	"Iterative assig the breadth (x-position) for each node"
	| remainingElements nextElements x kx |
	x := 0.
	remainingElements := elements.
	[remainingElements size isZero not] whileTrue: [ 
		nextElements := OrderedCollection new.
		remainingElements do: [ :el| 
			el attributes at: #x put: x.
			(el attributes at: #sourceLinks) do: [:ed |
				nextElements add: ed to. ] ].
		remainingElements := nextElements.
		x := x+1.
	 ].
	"move sinks right and scale"
	kx := extent x/ (x -1).
	elements do:[ :el| | temp |
		(el attributes at: #sourceLinks) size isZero ifTrue: [ 
			el attributes at: #x put: x -1 ].
		temp := el attributes at: #x.
		el attributes at: #x put: (temp * kx) asFloat.
		 ].
	
]

{ #category : #private }
RTSankeyBuilder >> computeElementDepths [
	| elementsByBreadth alpha |
	elementsByBreadth := elements groupedBy: [ :e | e attributes at: #x ].
	elementsByBreadth := elementsByBreadth keysSortedSafely 
		collect: [:k | elementsByBreadth at: k ].
	elementsByBreadth ifEmpty: [ ^ self ].
	elementsByBreadth last do: [ :e |
		e attributes at: #last put: true ].
	self initializeElementsDepth: elementsByBreadth.
	self resolveCollisions: elementsByBreadth.
	alpha := 1.
	1 to: iterations do: [ :i |
		self relaxRightToLeft: (alpha := alpha *0.99) elements: elementsByBreadth.
		self resolveCollisions: elementsByBreadth.
		self relaxLeftToRight: alpha elements: elementsByBreadth.
		self resolveCollisions: elementsByBreadth.]
	
	
]

{ #category : #private }
RTSankeyBuilder >> computeElementsValues [
	elements do: [ :el | | slinks tlinks sum |
		slinks := el attributes at: #sourceLinks.
		tlinks := el attributes at: #targetLinks.
		sum  := [ :arr | arr inject: 0 into: [ :s :e | (e attributes at: #value) + s] ].
		el attributes
			at: #value put: ((sum value: slinks) max: (sum value: tlinks)).
		 ].
]

{ #category : #private }
RTSankeyBuilder >> computeSankey [
	
	self computeEdges;
		computeElementsValues;
		computeElementBreadths;
		computeElementDepths;
		computeEdgesDepths.
]

{ #category : #hooks }
RTSankeyBuilder >> createView [
	^ super createView @ RTDraggableView @ RTZoomableView.
]

{ #category : #initialization }
RTSankeyBuilder >> defaultLine [
	| bezier points |
	"TODO, we need to create a RTBezier4Line"
	bezier := RTBezier4Line new.
	bezier attachPoint: RTSankeyAttachPoint new.
	lineShape shape: bezier.
	points := [ :e | | x y1 y2 |
		x := (e from position x + e to position x) / 2.
		y1 := e from position y + (e attributes at: #sy) + ((e attributes at: #dy)/2) - ((e from attributes at: #dy)/2).
		y2 := e to position y + (e attributes at: #ty) + ((e attributes at: #dy)/2) - ((e to attributes at: #dy)/2).
		Array with: x@y1 with: x @ y2 ].
	bezier widthElement: [ :e |
		(e attributes at: #dy ifAbsent: [1]) max: 1 ];
		controllingElements: [ :e | 
			(e attributes includesKey: #dy)
				ifTrue: [ points value: e ]
				ifFalse: [ Array with: 0@0 with: 0@0 ] ].
	
]

{ #category : #accessing }
RTSankeyBuilder >> extent [
	^ extent
]

{ #category : #accessing }
RTSankeyBuilder >> extent: aPoint [
	extent := aPoint
]

{ #category : #initialization }
RTSankeyBuilder >> initialize [
	super initialize.
	self interaction
		when: TRMouseDragging do: [:e| | d |
			d := e element view canvas camera distanceFromPixelToSpace: e step.
			e element translateBy: 0@d y.
			e signalUpdate.
			 ].
	interactionEdge := RTInteractionBuilder new.
	lineShape := RTShapeBuilder new.
	self defaultLine.
	
	labelShape := RTShapeBuilder new.
	labelShape withText: ''.
	labelInteraction := RTInteractionBuilder new.
	
	self shape rectangle width: 10.
	self extent: 400@300.
	self nodePadding: 0.
	self linkValue: 1.
]

{ #category : #private }
RTSankeyBuilder >> initializeElementsDepth: elementsByBreadth [
	| value ky |
	value := [ :e | e attributes at: #value ].
	ky := elementsByBreadth inject: Float fmax into: [ :min :arr|
		min min: ((extent y - ((arr size - 1) * nodePadding ))/ 
		(arr inject: 0 into: [ :sum :e| (value value: e)+ sum])) ].
	elementsByBreadth do: [ :arr| 
		arr doWithIndex: [ :e :i| 
			e attributes 
				at: #y put: i - 1;
				at: #dy put: (value value: e)*ky ].
		].
	edges do: [ :e | e attributes at: #dy put: (value value: e)*ky ].
]

{ #category : #accessing }
RTSankeyBuilder >> interactionEdge [
	^ interactionEdge.
]

{ #category : #accessing }
RTSankeyBuilder >> iterations: aNumber [
	iterations := aNumber
]

{ #category : #accessing }
RTSankeyBuilder >> labelInteraction [
	^ labelInteraction 
]

{ #category : #accessing }
RTSankeyBuilder >> labelShape [
	^ labelShape
]

{ #category : #accessing }
RTSankeyBuilder >> lineShape [
	^ lineShape
]

{ #category : #accessing }
RTSankeyBuilder >> linkFrom: aBlock [
	linkFrom := aBlock
]

{ #category : #accessing }
RTSankeyBuilder >> linkTo: aBlock [
	linkTo := aBlock
]

{ #category : #accessing }
RTSankeyBuilder >> linkValue: aBlock [
	linkValue := aBlock
]

{ #category : #accessing }
RTSankeyBuilder >> links: anArray [
	links := anArray
]

{ #category : #accessing }
RTSankeyBuilder >> nodePadding [
	^ nodePadding
]

{ #category : #accessing }
RTSankeyBuilder >> nodePadding: aNumber [
	nodePadding := aNumber
]

{ #category : #accessing }
RTSankeyBuilder >> nodes: aCollection [
	elements := self shape elementsOn: aCollection.
	lelements := self labelShape elementsOn: aCollection.
]

{ #category : #private }
RTSankeyBuilder >> relaxLeftToRight: alpha elements: elementsByBreadth [
	| tl weightedSource value y|
	value := [ :e | e attributes at: #value ].
	weightedSource := [ :ed | (self centerOf: ed from) * (value value: ed) ].
	elementsByBreadth do: [ :nodes|
		nodes do: [ :node |
			tl := node attributes at: #targetLinks.
			tl ifNotEmpty: [ 
				y := (tl sum: weightedSource)/ (tl sum: value).
				node attributes at: #y put: (node attributes at: #y)+ ((y - (self centerOf: node))*alpha) ] ] ]
]

{ #category : #private }
RTSankeyBuilder >> relaxRightToLeft: alpha elements: elementsByBreadth [
	| sl y weightedTarget value |
	value := [ :e | e attributes at: #value ].
	weightedTarget := [ :ed | (self centerOf: ed to) * (value value: ed) ].
	
	elementsByBreadth reversed do: [ :nodes | 
		nodes do: [ :node | 
			sl := node attributes at: #sourceLinks.
			sl ifNotEmpty: [ 
				y := (sl sum: weightedTarget)/ (sl sum: value).
				node attributes at: #y put: (node attributes at: #y) + ((y - (self centerOf: node)) * alpha) ] ].
	 ].
]

{ #category : #hooks }
RTSankeyBuilder >> renderIn: aView [
	elements ifNil: [ elements := RTGroup new ].
	self interaction setUpElements: elements.
	aView addAll: elements.
	self computeSankey.
	lelements ifNil: [ lelements := RTGroup new ].
	aView addAll: lelements.
	self updateNodes.
]

{ #category : #private }
RTSankeyBuilder >> resolveCollisions: elementsByBreadth [
	| nodes node dy y0 y i |
	y := [ :e | e attributes at: #y ].
	
	elementsByBreadth do: [ :els |
		y0 := 0.
		nodes := els sorted: [ :a :b | (y value: a) < (y value: b) ].
		
		nodes do: [ :n |
			node := n.
			dy :=  y0 - (y value: node).
			dy > 0 ifTrue: [ node attributes at: #y put: (y value: node) + dy ].
			y0 := (y value: node) + nodePadding + (node attributes at: #dy).  ].
		"If bottommost node goes outside the bounds push it back up"
		dy := y0 - nodePadding - extent y.
		dy > 0 ifTrue: [ 
			y0 := node attributes at: #y put: (y value: node) - dy.
			i := nodes size - 1.
			[ i >= 1  ] whileTrue: [
				node := nodes at: i.
				dy := (y value: node) + (node attributes at: #dy) +  nodePadding - y0.
				dy > 0 ifTrue: [ node attributes at: #y put: (y value: node) - dy ].
				y0 := y value: node.
				i := i -1 ] ] ].
	
]

{ #category : #public }
RTSankeyBuilder >> updateNodes [
	| att dy x y side |
	elements doWithIndex: [ :e :i | | le |
		le := lelements at: i. 
		att := e attributes.
		dy := att at: #dy.
		x := att at: #x.
		y := att at: #y.
		
		e translateTo: x @ (y+(dy/2)).
		e trachelShape height: dy.
		side := (att includesKey: #last) 
			ifTrue: [ #left ] 
			ifFalse: [ #right ].
		RTConstraint new 
			fix: e;
			movable: le;
			outer;
			perform: side;
			middle;
			horizontalPadding: 5;
			stick.
		 ].
	edges ifNil: [ ^ self ].
	edges do: #updateShape
]
