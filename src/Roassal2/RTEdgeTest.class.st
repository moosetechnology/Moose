Class {
	#name : #RTEdgeTest,
	#superclass : #RTTest,
	#instVars : [
		'el1',
		'el2',
		'edge'
	],
	#category : #'Roassal2-Core-Tests'
}

{ #category : #running }
RTEdgeTest >> setUp [
	super setUp.
	el1 := RTBox element.
	el2 := RTBox element.
	el1 translateTo: 20 @ 20.
	el2 translateTo: 60 @ 80.
	edge := RTLine edgeFrom: el1 to: el2
]

{ #category : #tests }
RTEdgeTest >> testAddingEdgeAndGroup [

	| v g |
	v := RTView new.
	g := RTGroup new.
	
	g
		add: el1;
		add: el2;
		add: edge.
	v addAll: g.
	v setUpCanvas.
	self assert: edge trachelShape notNil.
	self assert: edge trachelShape color notNil.
	self assert: el1 view equals: v.
	self assert: el2 view equals: v.
	self assert: edge view equals: v.
]

{ #category : #tests }
RTEdgeTest >> testBasic [

	| v |
	v := RTView new.
	v
		add: el1;
		add: el2;
		add: edge;
		setUpCanvas.
	self assert: edge trachelShape notNil.
	self assert: edge trachelShape color notNil.
	self assert: el1 view equals: v.
	self assert: el2 view equals: v.
	self assert: edge view equals: v.
]

{ #category : #tests }
RTEdgeTest >> testBezierColorAndWidth [
	| v shape l els |
	
	v := RTView new.
	shape := RTEllipse new size: 10; color: (Color red alpha: 0.3).
	els := (shape elementsOn: (1 to: 4)).
	v addAll: els .
	RTHorizontalLineLayout on: v elements.
	(els at: 1) translateBy: 0 @ 100.
	(els at: 2) translateBy: 100 @ 0.
	(els at: 3) translateBy: 200 @ 100.
	(els at: 4) translateBy: 300 @ 0.

	l := (RTBezierLine new controllingElements: v elements) edgeFrom: els first to: els last.
	v add: l.
	l shape width: 5.
	l shape color: Color green.
	
	self assert: l trachelShape width = 1.
	l updateShape.
	self assert: l trachelShape width = 5.
	self assert: l trachelShape strokePaint = Color green.
]

{ #category : #'tests - building' }
RTEdgeTest >> testBuildingFromAssociations [

	| view elements |
	view := RTView new.
	elements := RTBox elementsOn: #(1 2).
	view addAll: elements.

	RTEdgeBuilder new
		view: view;
		useAssociations: (Array with: 1 -> 2).
	
	self assert: view numberOfElements = 2.
	self assert: view numberOfEdges = 1.
	edge := view edges last.
	self assert: edge from == view elements first.
	self assert: edge to == view elements second.
	
	self assert: edge trachelShape class == TRLineShape.
	
	
]

{ #category : #'tests - building' }
RTEdgeTest >> testBuildingFromObjects [
	| view objects elements |
	view := RTView new.
	objects := Array with: RTLine with: RTLine superclass.
	elements := (RTBox new size: 20) elementsOn: objects.
	view addAll: elements.
	RTEdgeBuilder new
		view: view;
		objects: objects;
		connectFrom: #yourself to: #superclass.
	self assert: view numberOfElements = 2.
	self assert: view numberOfEdges = 1.
	edge := view edges last.
	self assert: edge from == elements first.
	self assert: edge to == elements second.
	self assert: edge model notNil.
	self assert: edge model equals: elements first model -> elements second model
]

{ #category : #tests }
RTEdgeTest >> testEdgesFromToAll [

	| shape e someElements lines |
	shape := RTLine new.
	e := RTElement new.
	someElements := RTElement forCollection: (1 to: 5).
	lines := shape edgesFrom: e toAll: someElements.
	self assert: lines size equals: 5.
	self assert: lines first shape == lines second shape
]

{ #category : #tests }
RTEdgeTest >> testIncomingAndOutgoingEdges [

	self assert: (el1 outgoingEdges includes: edge).
	self assert: (el2 incomingEdges includes: edge).
]

{ #category : #tests }
RTEdgeTest >> testLineColorAndWidth [
	| v e1 e2 l |
	v := RTView new.
	e1 := RTElement new.
	e2 := RTElement new.
	e1 + (RTBox new size: 10).
	e2 + (RTBox new size: 10).
	l := RTLine edgeFrom: e1 to: e2.
	e2 translateBy: 50 @ 40.
	l shape width: 10.
	l shape color: Color red.
	v addAll: (Array with: e1 with: e2 with: l).
	self assert: l trachelShape width = 1.
	l updateShape.
	self assert: l trachelShape width = 10.
	self assert: l trachelShape color = Color red.
]

{ #category : #'pushing back' }
RTEdgeTest >> testMoveBehindItsExtremities [

	| view |
	view := RTView new.
	view add: el1; add: el2; add: edge.
	edge moveBehindItsExtremities.
	self assert: view canvas shapes = 
		(Array with: edge trachelShape with: el1 trachelShape with: el2 trachelShape)
]

{ #category : #'pushing back' }
RTEdgeTest >> testMoveBehindItsExtremities2 [

	| v e1 e2 |
	v := RTView new.

	e1 := RTBox element.
	e2 := RTBox element.
	v add: e1; add: e2.

	edge := RTArrowedLine edgeFrom: e1 to: e2.

	v add: edge.
	self assert: (edge trachelShape shapes allSatisfy: [ :t | t canvas notNil ]).

	e1 translateTo: 50 @ 50. 
	edge moveBehindItsExtremities.

	self assert: (edge trachelShape shapes allSatisfy: [ :t | t canvas notNil ]).
	self assert: edge trachelShape canvas notNil.
	self assert: edge trachelShape canvas == v canvas.
	
	
]

{ #category : #tests }
RTEdgeTest >> testOnFromTo [

	el1 := RTBox element.
	el2 := RTBox element.
	edge := RTEdge on: 10 from: el1 to: el2.
	self assert: edge model = 10.
	self assert: edge from == el1.
	self assert: edge to == el2
]

{ #category : #tests }
RTEdgeTest >> testReconnectingEdge [

	| e1 e2 e3 e4 l |
	e1 := RTBox element.
	e2 := RTBox element.
	e3 := RTBox element.
	e4 := RTBox element.
	l := RTLine edgeFrom: e1 to: e2.
	
	self assert: e2 incomingEdges size = 1.
	self assert: e1 outgoingEdges size = 1.
	self assert: e3 connectedEdges size = 0.
	self assert: e4 connectedEdges size = 0.
	
	l to: e3.
	self assert: e2 incomingEdges size = 0.
	self assert: e3 incomingEdges size = 1.

	l from: e4.
	self assert: e1 outgoingEdges size = 0.
	self assert: e4 outgoingEdges size = 1.

]

{ #category : #tests }
RTEdgeTest >> testRemoveEdgeWithSameExtremities [

	| v e l |
	v := RTView new.
	e := RTBox element.

	l := RTLine edgeFrom: e to: e.
	v add: e.
	v add: l.
	
	e remove.


]

{ #category : #tests }
RTEdgeTest >> testRemoveEdgeWithSameExtremities02 [

	| v e l |
	v := RTView new.
	e := RTBox element.

	l := RTLine edgeFrom: e to: e.
	v add: e.
	v add: l.
	self assert: (e connectedEdges includes: l).
	self assert: e connectedEdges size equals: 1.

]

{ #category : #tests }
RTEdgeTest >> testRemovingEdge [

	| v e1 e2 l |
	v := RTView new.
	e1 := RTBox element.
	e2 := RTBox element.
	l := RTLine edgeFrom: e1 to: e2.
	v add: e1; add: e2; add: l.
	
	self assert: v numberOfEdges = 1.
	self assert: e2 incomingEdges size = 1.
	self assert: e1 outgoingEdges size = 1.
	
	l remove.
	
	self assert: v numberOfEdges = 0.
	self assert: e2 incomingEdges size = 0.
	self assert: e1 outgoingEdges size = 0.
	
]

{ #category : #tests }
RTEdgeTest >> testShouldBeUsedInLayout [

	self assert: RTEdge new isUsedInLayout
]

{ #category : #tests }
RTEdgeTest >> testShouldBeUsedInLayout02 [
 
	self deny: (RTEdge new notUseInLayout; isUsedInLayout)
]

{ #category : #tests }
RTEdgeTest >> testTrachelShape [
	edge := RTLine edgeFrom: RTBox element to: RTBox element.
	self assert: edge trachelShape notNil.
	self assert: edge trachelShape class == TRLineShape
]

{ #category : #tests }
RTEdgeTest >> testTranslatingNode [
	| old |
	RTView new
		add: el1;
		add: el2;
		add: edge;
		setUpCanvas.

	old := edge trachelShape from.
	self assert: edge trachelShape from = el1 position.
	self assert: edge trachelShape to = el2 position.
	
	el1 translateBy: 10 @ 5.
	self assert: edge trachelShape from = (old + (10 @ 5)).
	self assert: edge trachelShape from = el1 position.
	self assert: edge trachelShape to = el2 position.
]

{ #category : #tests }
RTEdgeTest >> testromTo [

	el1 := RTBox elementOn: 4.
	el2 := RTBox elementOn: 2.
	edge := RTEdge from: el1 to: el2.
	self assert: edge model equals: 4->2.
	self assert: edge from == el1.
	self assert: edge to == el2
]
