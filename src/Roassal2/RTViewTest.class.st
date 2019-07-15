Class {
	#name : #RTViewTest,
	#superclass : #RTTest,
	#instVars : [
		'view'
	],
	#category : #'Roassal2-Core-Tests'
}

{ #category : #running }
RTViewTest >> setUp [
	super setUp.
	view := RTView new
]

{ #category : #edges }
RTViewTest >> testAccept [
	view accept: RTVisitor new
]

{ #category : #menu }
RTViewTest >> testAddFindMenu [

	view addFindMenu.
	self assert: view canvas numberOfFixedShapes > 0.
	self assert: view canvas numberOfShapes equals: 0
]

{ #category : #menu }
RTViewTest >> testAddLayoutMenu [

	view addLayoutMenu.
	self assert: view canvas numberOfFixedShapes > 0.
	self assert: view canvas numberOfShapes equals: 0
]

{ #category : #'fixed elements' }
RTViewTest >> testAdding [

	| e1 e2 |
	e1 := RTBox element.
	e2 := RTBox element.
	
	e1 setAsFixed.
	view add: e1.
	view add: e2.
	
	self assert: view canvas numberOfFixedShapes = 1.
	self assert: view canvas numberOfShapes = 1.
]

{ #category : #tests }
RTViewTest >> testAddingAnimation [
	| c |
	c := RTView new canvas.
	c addAnimation: (RTLinearMove to: 50 @ 50 during: 2 on: RTBox element).
	self assert: c hasAnimation.
	self assert: c numberOfAnimations = 1
]

{ #category : #edges }
RTViewTest >> testAddingEdgeSetsTheElementInTrachelShape [
	| el1 el2 edge |
	el1 := RTBox element.
	el2 := RTBox element.
	edge := RTLine edgeFrom: el1 to: el2.
	view add: el1; add: el2.
	view add: edge.	
	self assert: edge trachelShape element equals: edge
]

{ #category : #edges }
RTViewTest >> testAddingEdges [
	| el1 el2 edge |
	el1 := RTBox element.
	el2 := RTBox element.
	edge := RTLine edgeFrom: el1 to: el2.
	view add: el1; add: el2.
	self assert: view numberOfElements = 2.

	self assert: view numberOfEdges = 0.
	view add: edge.
	self assert: view numberOfEdges = 1.	
]

{ #category : #edges }
RTViewTest >> testBuild [
	view build
]

{ #category : #camera }
RTViewTest >> testCameraProjection [
	| v camera |

	v := RTView new.
	camera := v canvas camera.

	self assert: ((camera fromPixelToSpace: (camera fromSpaceToPixel: (10@10))) closeTo: (10.0 @ 10.0))
]

{ #category : #tests }
RTViewTest >> testCleaningView [

	| v e |
	v := RTView new.
	e := (RTBox new size: 80) elementOn: 'Hello World'.
	v add: e.
	e @ RTLabeled.

	v cleanAll.
	self assert: v numberOfElements equals: 0.
	self assert: v canvas numberOfFixedShapes equals: 0.
	self assert: v canvas numberOfShapes equals: 0.
	
]

{ #category : #tests }
RTViewTest >> testCleaningViewHavingCallback [

	| v e |
	v := RTView new.
	e := (RTBox new size: 80) elementOn: 'Hello World'.
	v add: e.
	e @ RTLabeled.
	v when: TRMouseClick do: [ :vv | vv inspect ].

	self assert: v announcer numberOfSubscriptions equals: 1.
	v cleanAll.
	self assert: v numberOfElements equals: 0.
	self assert: v canvas numberOfFixedShapes equals: 0.
	self assert: v canvas numberOfShapes equals: 0.
	self assert: v announcer numberOfSubscriptions equals: 0.
	
]

{ #category : #tests }
RTViewTest >> testCleaningViewWithCallback [
	| v parent child |
	v := RTView new.
	parent := RTBox new element.
	child := RTBox new element.
	parent addCallback: (TRRemoveCallback block: [ child remove ]).
	v
		add: parent;
		add: child.
	self assert: v numberOfElements equals: 2.
	v clean.
	self assert: v numberOfElements equals: 0
]

{ #category : #'fixed elements' }
RTViewTest >> testDefault [

	self deny: RTElement new isFixed.
	self assert: (RTElement new setAsFixed; isFixed).
	self deny: (RTElement new setAsNotFixed; isFixed).
]

{ #category : #edges }
RTViewTest >> testEdgeFromModel [

	| e1 e2 edge |
	e1 := RTBox elementOn: 1.
	e2 := RTBox elementOn: 2.
	edge := RTLine edgeFrom: e1 to: e2.
	edge model: 'hello'.
	view add: e1; add: e2; add: edge.
	
	self assert: (view edgeFromModel: 'hello') equals: edge
]

{ #category : #tests }
RTViewTest >> testElementFromModel [

	| els |
	els := RTBox elementsOn: (1 to: 3).
	view addAll: els.

	self assert: (view elementFromModel: 1) == els first.
	self assert: (view elementFromModel: 2) == els second.
	self assert: (view elementFromModel: 3) == els third.
]

{ #category : #edges }
RTViewTest >> testElementsFromModel [

	| e1 e2 e3 edge |
	e1 := RTBox elementOn: 1.
	e2 := RTBox elementOn: 2.
	e3 := RTBox elementOn: 1.
	edge := RTLine edgeFrom: e1 to: e2.
	edge model: 'hello'.
	view add: e1; add: e2; add: e3; add: edge.
	
	self assert: (view elementsFromModel: 'hello') isEmpty.
	self assert: (view elementsFromModel: 1) size equals: 2.
	self assert: (view elementsFromModel: 2) size equals: 1.
	self assert: (view elementsFromModel: 3) size equals: 0
]

{ #category : #tests }
RTViewTest >> testEmptyCanvas [
	self assert: RTView new setUpCanvas numberOfShapes = 0

]

{ #category : #tests }
RTViewTest >> testFillingCanvas [

	| canvas |
	view := RTView new.
	view add: RTBox element.
	canvas := view setUpCanvas.
	
	self assert: canvas class == TRCanvas.
	self assert: canvas numberOfShapes = 1.
]

{ #category : #'low events' }
RTViewTest >> testLowLevelEvent [

	| v e |
	v := RTView new.
	e := (RTBox new size: 30) element.
	e @ RTDraggable.
	v add: e.

	self assert: (v canvas shapeWithAction: TRMouseDragging forPositionInPixels: 250 @ 250) == e trachelShape
]

{ #category : #'low events' }
RTViewTest >> testLowLevelEvent02 [

	| v e |
	v := RTView new.
	e := (RTBox new size: 30) element.
	e when: TRMouseClick do: [ ].
	v add: e.

	self assert: (v canvas shapeWithAction: TRMouseClick forPositionInPixels: 250 @ 250) == e trachelShape
]

{ #category : #'low events' }
RTViewTest >> testLowLevelEvent3 [

	| v e |
	v := RTView new.
	e := (RTBox new size: 30) element.
	v add: e.
	e @ RTDraggable.
	self assert: (v canvas shapeWithAction: TRMouseDragging forPositionInPixels: 250 @ 250) == e trachelShape
]

{ #category : #menu }
RTViewTest >> testMenu [

	view add: (RTEllipse new size: 50) element.
	view addMenu: 'foo' callback: [  ].
	self assert: view canvas numberOfShapes = 1.
	self assert: view canvas numberOfFixedShapes = 1.
]

{ #category : #opening }
RTViewTest >> testOpenWithMenu [

	| window |
	window := view openWithMenu.
	self assert: view numberOfElements equals: 0.
	self assert: view canvas numberOfFixedShapes > 0.
	window delete.
]

{ #category : #opening }
RTViewTest >> testOpening [

	| window |
	window := RTView new openInWindowSized: 500 @ 300.
	self assert: window extent equals: 500 @ 300.
	window delete.
]

{ #category : #opening }
RTViewTest >> testOpeningInWindowSizedTitled [

	| window |
	window := RTView new openInWindowSized: 500 @ 300 titled: 'Hello World'.
	self assert: window extent equals: 500 @ 300.
	window delete.
]

{ #category : #opening }
RTViewTest >> testOpeningRaw [

	| window |
	window := view openRaw.
	self assert: window notNil.
	window delete.
]

{ #category : #edges }
RTViewTest >> testPushBackEdges [

	| es lastEdge |
	es := RTBox new elementsOn: (1 to: 10).
	view addAll: es.
	
	RTEdgeBuilder new
		view: view;
		objects: (1 to: 10);
		connectFrom: [ :aValue | aValue // 3 ] to:  #yourself.
	view add: (RTBox element).
	RTTreeLayout on: es.
	
	
	lastEdge := view edges last.
	self assert: (view canvas shapes indexOf: lastEdge trachelShape) equals: 18.
	view pushBackEdges.
	self assert: (view canvas shapes indexOf: lastEdge trachelShape) equals: 1.
]

{ #category : #edges }
RTViewTest >> testPushFrontEdges [

	| es lastEdge |
	es := RTBox new elementsOn: (1 to: 10).
	view addAll: es.
	
	RTEdgeBuilder new
		view: view;
		objects: (1 to: 10);
		connectFrom: [ :aValue | aValue // 3 ] to:  #yourself.
	view add: (RTBox element).
	RTTreeLayout on: es.
	
	
	lastEdge := view edges last.
	self assert: (view canvas shapes indexOf: lastEdge trachelShape) equals: 18.
	view pushFrontEdges.
	self assert: (view canvas shapes indexOf: lastEdge trachelShape) equals: 19.
]

{ #category : #tests }
RTViewTest >> testRemoveEdges [

	| element1 element2 element3 edge1 edge2 |
	element1 := RTBox new element.
	element2 := RTEllipse new element.
	element3 := RTBox new element.
	edge1 := RTLine edgeFrom: element1 to: element2.
	edge2 := RTLine edgeFrom: element2 to: element3.
	self assert: view numberOfElements equals: 0.
	self assert: view numberOfEdges equals: 0.
	self assert: view canvas shapes size equals: 0.
	view add: element1; add: element2; add: element3; add: edge1; add: edge2.
	self assert: view numberOfElements equals: 3.
	self assert: view numberOfEdges equals: 2.
	self assert: view canvas shapes size equals: 5.

	view removeEdges: (RTGroup with: edge1).
	self assert: view numberOfElements equals: 3.
	self assert: view numberOfEdges equals: 1.
	self assert: view canvas shapes size equals: 4.

	view removeEdges: (RTGroup with: edge2).
	self assert: view numberOfElements equals: 3.
	self assert: view numberOfEdges equals: 0.
	self assert: view canvas shapes size equals: 3.

]

{ #category : #tests }
RTViewTest >> testRemoveElements [

	| es |
	es := RTBox elementsOn: (1 to: 5).
	self assert: view numberOfElements equals: 0.
	view addAll: es.
	self assert: view numberOfElements equals: 5.
	es remove.
	self assert: view numberOfElements equals: 0.
]

{ #category : #tests }
RTViewTest >> testRemoveElementsWithCompositeShape [

	| s1 s2 c el1 el2 |
	s1 := RTBox new.
	s2 := RTEllipse new.
	c := RTCompositeShape new.
	c add: s1; add: s2.
	el1 := c element.
	el2 := c element.
	self assert: view numberOfElements equals: 0.
	self assert: view canvas shapes size equals: 0.
	view add: el1.
	self assert: view numberOfElements equals: 1.
	self assert: view canvas shapes size equals: 2.
	view add: el2.
	self assert: view numberOfElements equals: 2.
	self assert: view canvas shapes size equals: 4.
	
	view removeElements: (RTGroup with: el1).
	self assert: view numberOfElements equals: 1.
	self assert: view canvas shapes size equals: 2.
	
	view removeElements: (RTGroup with: el2).
	self assert: view numberOfElements equals: 0.
	self assert: view canvas shapes size equals: 0.

]

{ #category : #tests }
RTViewTest >> testRemoveElementsWithEdges [

	| element1 element2 element3 edge1 edge2 |
	element1 := RTBox new element.
	element2 := RTEllipse new element.
	element3 := RTBox new element.
	edge1 := RTLine edgeFrom: element1 to: element2.
	edge2 := RTLine edgeFrom: element2 to: element3.
	self assert: view numberOfElements equals: 0.
	self assert: view numberOfEdges equals: 0.
	self assert: view canvas shapes size equals: 0.
	view add: element1; add: element2; add: element3; add: edge1; add: edge2.
	self assert: view numberOfElements equals: 3.
	self assert: view numberOfEdges equals: 2.
	self assert: view canvas shapes size equals: 5.

	view removeElements: (RTGroup with: element1).
	self assert: view numberOfElements equals: 2.
	self assert: view numberOfEdges equals: 1.
	self assert: view canvas shapes size equals: 3.

	view removeEdges: (RTGroup with: element2 with: element3).
	self assert: view numberOfElements equals: 0.
	self assert: view numberOfEdges equals: 0.
	self assert: view canvas shapes size equals: 0.

]

{ #category : #removing }
RTViewTest >> testRemoving [
	"
	self debug: #testRemoving
	"
	| v es |
	v := RTView new.
	es := RTBox elementsOn: (1 to: 10).
	v addAll: es.
	es remove.
	self assert: v numberOfElements equals: 0.
	self assert: v canvas numberOfShapes equals: 0.
]

{ #category : #edges }
RTViewTest >> testRemovingEdges [
	| es |
	es := RTBox elementsOn: #(1 2).
	view addAll: es.
	view add: (RTLine edgeFrom: es first to: es second).
	self assert: view numberOfEdges equals: 1. 
	
	view removeAllEdges.
	self assert: view numberOfEdges equals: 0.
	
	self assert: es first connectedEdges isEmpty.
	self assert: es second connectedEdges isEmpty.
]

{ #category : #camera }
RTViewTest >> testRestoreCamera [
	"
	self debug: #testRestoreCamera
	"

	view resetCamera.
	view add: (RTBox element).
	view restoreCamera.
	view canvas camera translateTo: 5 @ 5.
	view setUpCanvas.
	
	view := RTView new.
	view add: (RTBox element).
	view restoreCamera.
	self assert: view canvas camera position equals: 0 @ 0.

	view setUpCanvas.
	self assert: view canvas camera position equals: 5 @ 5.
]

{ #category : #menu }
RTViewTest >> testSignalUpdate [

	RTView new signalUpdate 
]

{ #category : #menu }
RTViewTest >> testTrachelShape [

	self assert: view trachelShape class equals: TRNoShape
	
]

{ #category : #menu }
RTViewTest >> testsetDefaultMenu [

	view setDefaultMenu.
	self assert: view canvas numberOfFixedShapes > 0.
	self assert: view canvas numberOfShapes equals: 0
]
