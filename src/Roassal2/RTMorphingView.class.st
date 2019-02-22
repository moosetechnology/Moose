"
I am the advanced brother of RTMorphingView. In addition to its functionalities I also...

- Add new nodes from one view to the next
- Remove nodes no longer present
- Adapt the #extent of nodes
"
Class {
	#name : #RTMorphingView,
	#superclass : #RTAbstractMorphingView,
	#category : #'Roassal2-Interactions-MorphingView'
}

{ #category : #examples }
RTMorphingView class >> exampleForceBasedLayout [
	<noTest>
	| randomView view lay |
	
	lay := RTForceBasedLayout new.

	randomView := [ | rndView |
		rndView := RTView new.
		rndView addAll: ((RTEllipse new size: 15 + 15 atRandom; color: Color red) elementsOn: (1 to: (10 + 30 atRandom))).
		RTEdgeBuilder new
			view: rndView;
			connectFrom: [ :vv | vv // 2 ].
		lay charge: (-1 * 1000 atRandom).
		lay on: rndView elements.
		rndView
	].

	view := randomView value.
	view elements do: [ :el | el color: Color gray. el @ RTLabeled ].

	view addMenu: 'Animate!' callback: [ 
		view @ (RTMorphingView new 
						referenceView: randomView value; 
						smoothTransition: 0.3).
		view elements do: [ :el | 
			el pushFront.
			(el hasAttribute: #RTLabelledLabel) ifFalse: [ el @ RTLabeled ]
		]
	].

	^ view inspect
]

{ #category : #examples }
RTMorphingView class >> exampleSimple [
	<noTest>
	| v1 v2 |
	v1 := RTView new.
	v1 addAll: ((RTEllipse new color: Color green trans; size: 10) elementsOn: #(1 2)).
	RTEdgeBuilder new
		view: v1;
		useAssociation: 1 -> 2.
	RTHorizontalLineLayout on: v1 elements.

	"---"

	v2 := RTView new.
	v2 addAll: ((RTEllipse new color: Color green trans) elementsOn: #(1)).
	v2 addMenu: 'animate' callback:  [ 
		v2 @ (RTMorphingView new referenceView: v1; smoothTransition: 0.3).
	].

	v2 addMenu: 'camerea' callback:  [ 
		v2 canvas camera scale: 10.
		v2 signalUpdate.
	].

	^ v2 inspect
]

{ #category : #examples }
RTMorphingView class >> exampleWithVaryingEdgeSize [
	<noTest>
	| v1 v2 eb |
	v1 := RTView new.
	v1 addAll: ((RTEllipse new color: Color green trans; size: 10) elementsOn: #(1 2 3)).
	eb := RTEdgeBuilder new
		view: v1.
	eb shape line width: [ :ee | 10 atRandom ] ; color: [ :ee | Color random ].
	eb
		useAssociations: (Array with: 1 -> 2 with: 2 -> 3 ).
	RTHorizontalLineLayout on: v1 elements.

	"---"

	v2 := RTView new.
	v2 addAll: ((RTEllipse new color: Color green trans; size: 10) elementsOn: #(1 2 3)).
	eb := RTEdgeBuilder new
		view: v2.
	eb shape line width: [ :ee | 10 atRandom ] ; color: [ :ee | Color random ].
	eb
		useAssociations: (Array with: 1 -> 2 with: 2 -> 3).
	RTHorizontalLineLayout on: v2 elements.
	"---"
	v2 addMenu: 'animate' callback:  [ 
		v2 @ (RTMorphingView new referenceView: v1; smoothTransition: 0.3).
	].
	v2 canvas camera scale: 10.

	^ v2 inspect
]

{ #category : #initialization }
RTMorphingView >> getAllModelOfView: aView [
	^ (aView elements collect: #model) asArray
]

{ #category : #testing }
RTMorphingView >> hasCompleted [
	^ translator hasCompleted
]

{ #category : #initialization }
RTMorphingView >> initialize [

	super initialize.
	
	self pushElementsToFrontAndEdgesToBack.
]

{ #category : #initialization }
RTMorphingView >> initializeElement: aView [

	| allModels referenceElements edges |

	allModels := (aView elements collect: #model) asArray.
	referenceElements := referenceView elementsFromModels: allModels.
	referenceModels := referenceElements collect: #model.
	
	"Removing old elements and edges that are not in the new view"
	aView removeElements: (aView elementsFromModels: (allModels difference: referenceModels)).	
	aView removeAllEdges.
	
	"Adding elements that are not in the old view"
	aView addAll: (referenceView elements difference: referenceElements).	

	"Adding edges"	
	edges := RTEdgeBuilder new
						view: aView;
						useAssociations: (referenceView edges collect: #model).
		
	"Updating color and width of edges"
	aView edges do: [ :edge | | referenceEdge |
		referenceEdge := referenceView edgeFromModel: edge model. 
		edge @ RTMakeEdgeNotUpdatable.
		edge trachelShape color: referenceEdge trachelShape strokePaint.
		edge trachelShape width: referenceEdge trachelShape width.
	].

	(aView elementsFromModels: referenceModels) with: referenceElements do: [ :e1 :e2 | 
		self translate: e1 toPositionOf: e2. 
		self resize: e1 toExtentOf: e2. 
		e1 color: e2 color.
	].

	self afterTranslationDoActionOn: aView
]

{ #category : #initialization }
RTMorphingView >> initializeElementOLD: aView [
	| allModels referenceElements |
	allModels := self getAllModelOfView: aView.
	referenceElements := referenceView elementsFromModels: allModels.
	referenceModels := referenceElements collect: #model.

	"Removing old elements and edges that are not in the new view"
	aView
		removeElements: (aView elementsFromModels: (allModels difference: referenceModels)).
	aView removeEdges: (aView edges difference: referenceView edges).

	"Adding elements that are not in the old view"
	aView addAll: (referenceView elements difference: referenceElements).

	"Adding edges that are not in the old view"
	RTEdgeBuilder new
		view: aView;
		useAssociations:
			((referenceView edges collect: #model)
				difference: (aView edges collect: #model)).
	(aView elementsFromModels: referenceModels)
		with: referenceElements
		do: [ :e1 :e2 | 
			self translate: e1 toPositionOf: e2.
			self resize: e1 toExtentOf: e2 ].
	self afterTranslationDoActionOn: aView
]

{ #category : #configuration }
RTMorphingView >> morphIntoView: aRTView [

	afterAllTranslationsBlocks 
		add: [ :view | view @ (RTMorphingView new 
													referenceView: aRTView; 
													smoothTransition)]
]

{ #category : #configuration }
RTMorphingView >> pushElementsToFrontAndEdgesToBack [

	afterAllTranslationsBlocks 
		add: [ :view | view edges do: #pushBack ];
		add: [ :view | view elements do: #pushFront ]
		
]

{ #category : #configuration }
RTMorphingView >> resize: e1 toExtentOf: e2 [

	translator resize: e1 to: e2 extent
]

{ #category : #configuration }
RTMorphingView >> smoothTransition [

	self smoothTransition: 2
]

{ #category : #configuration }
RTMorphingView >> smoothTransition: aDuration [
	translator := RTSmoothResizeLayoutTranslator new nbCycles: aDuration
]
