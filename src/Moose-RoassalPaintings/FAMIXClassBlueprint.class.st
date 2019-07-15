"
This class encapsulates the logic of the class blueprint view. It is applicable to a set of famix types.
"
Class {
	#name : #FAMIXClassBlueprint,
	#superclass : #Object,
	#category : #'Moose-RoassalPaintings'
}

{ #category : #public }
FAMIXClassBlueprint >> createEdgesFor: aClass andLayers: layers on: view [
	| eb edges to |
	eb := RTEdgeBuilder new.
	eb view: view.
	eb shape line; color: Color lightBlue; horizontalAttachPoint.
	edges := aClass incomingAccesses flatCollect: [ :acc | eb connectFrom: acc from to:  acc to ].
	edges do: [ :each | each moveBehind: (layers flatCollect: #value) ].
	
	eb := RTEdgeBuilder new.
	eb view: view.
	eb shape line; horizontalAttachPoint.
	to := [ :each | each candidates detect: [ :c | c typeScope = aClass ] ifNone: [ nil ] ].
	edges := aClass outgoingInvocations flatCollect: [ :acc | 
				eb connectFrom: acc from to:  (to value: acc) ].
	edges do: [ :each | each moveBehind: (layers flatCollect: #value) ]

]

{ #category : #public }
FAMIXClassBlueprint >> createLayersFor: aClass on: view [
	| implementationLayer initializationLayer attributeLayer methodShape accessorLayer layers attributeShape publicLayer |
	methodShape := RTBox new
		borderColor: Color gray;
		color: [ :each | each classBlueprintFillColor ];
		width: [ :x | x numberOfOutgoingInvocations max: 5 ];
		height: [ :x | x numberOfLinesOfCode max: 5 ].
	attributeShape := RTBox new
		borderColor: Color gray;
		color: Color lightBlue.
	initializationLayer := self
		view: aClass initializers
		withShape: methodShape
		inLayerNamed: 'Initializers'
		fromClass: aClass
		inView: view.
	publicLayer := self
		view: aClass interfaceMethods
		withShape: methodShape
		inLayerNamed: 'Interface methods'
		fromClass: aClass
		inView: view.
	implementationLayer := self
		view: aClass implementationMethods
		withShape: methodShape
		inLayerNamed: 'Implementation methods'
		fromClass: aClass
		inView: view.
	accessorLayer := self
		view: aClass accessorMethods
		withShape: methodShape
		inLayerNamed: 'Accessors'
		fromClass: aClass
		inView: view.
	attributeLayer := self
		view: aClass attributes
		withShape: attributeShape
		inLayerNamed: 'Attributes'
		fromClass: aClass
		inView: view.
	layers := {initializationLayer.
	publicLayer.
	implementationLayer.
	accessorLayer.
	attributeLayer}.
	^ layers
]

{ #category : #public }
FAMIXClassBlueprint >> nestLayers: layers [
	layers
		do: [ :layer | 
			RTHorizontalTreeLayout new
				leftGap: 20;
				topGap: 20;
				horizontalGap: 20;
				layered;
				on: layer value
					edges:
						(layer value
								flatCollect: [ :each | each connectedEdges select: [ :edge | (layer value includes: edge from) and: [ layer value includes: edge to ] ] ]).
			RTNest new
				centerOn: layer key elements: layer value;
				makeElements: layer value draggableBy: layer key ]
]

{ #category : #public }
FAMIXClassBlueprint >> view: aClass on: view [
	"This is a public method. This methods render in view the class blueprint of the famix class aClass"
	"This method returns the group of the 5 layers"
	| layers |
	view @ RTZoomableView.

	layers := self createLayersFor: aClass on: view.
	self createEdgesFor: aClass andLayers: layers on: view.
	self nestLayers: layers.
	RTHorizontalLineLayout new
		gapSize: 0;
		on: (layers collect: #key).
	TRConstraint setAllToMaxHeight: (layers collect: #key).
	"TRConstraint alignFromTop: (layers collect: #key)."
	RTAlignment new elements: (layers collect: #key); top.
	^ (layers collect: #key) asGroup
]

{ #category : #private }
FAMIXClassBlueprint >> view: target withShape: shape inLayerNamed: label fromClass: class inView: view [
	| nodes node layer |
	layer := (RTElement on: target asMooseGroup) + (RTBox new
				borderColor: Color gray;
				color: Color transparent).
	layer @ (RTPopup new text: label).
	nodes := target collect: [ :each | 
			node := (RTElement on: each) + shape.
			node @ RTPopup.
			node @ RTDraggable.
			node ].
	view add: layer.
	view addAll: nodes.
	^ layer -> nodes
]
