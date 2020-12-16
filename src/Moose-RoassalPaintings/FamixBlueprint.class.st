Class {
	#name : #FamixBlueprint,
	#superclass : #Object,
	#instVars : [
		'canvas'
	],
	#category : #'Moose-RoassalPaintings'
}

{ #category : #private }
FamixBlueprint >> buildLayerNamed: label withAttributes: target [
	| layer |
	layer := RSComposite new borderColor: Color gray.
	layer
		addAll:
			(target asMooseGroup
				collect: [ :entity | self shapeForAttribute: entity ]).
	layer popupText: label.
	canvas add: layer
]

{ #category : #private }
FamixBlueprint >> buildLayerNamed: label withMethods: target [
	| layer |
	layer := RSComposite new borderColor: Color gray.
	layer
		addAll:
			(target asMooseGroup
				collect: [ :entity | self shapeForMethod: entity ]).
	layer popupText: label.
	canvas add: layer
]

{ #category : #private }
FamixBlueprint >> buildLegend [
	| legend |
	legend := RSLegend new.
	legend container: canvas.
	legend onDemand.
	legend title: 'Class Blueprint'.
	legend text: 'Each class is composed of 5 parts, from left to right:'.
	legend
		text:
			'    Constructors, Public methods, Private methods, Accessors, Variables'.
	legend
		text: 'Variable access'
		withShape:
			(RSBox new
				extent: 15 @ 5;
				color: Color lightBlue).
	legend
		text: 'Method invocation'
		withShape:
			(RSBox new
				extent: 15 @ 5;
				color: Color lightMagenta).
	legend text: 'Setter' withBoxColor: Color red.
	legend text: 'Getter' withBoxColor: Color orange.
	legend text: 'Abstract' withBoxColor: Color cyan.
	legend text: 'Overriding' withBoxColor: Color brown.
	legend text: 'Constant' withBoxColor: Color gray.
	legend build
]

{ #category : #private }
FamixBlueprint >> createEdgesFor: aClass [
	| builder edges |
	"Accesses"
	builder := self edgeBuilder
		color: Color lightBlue;
		yourself.
	edges := aClass queryIncomingAccesses
		flatCollect: [ :access | builder connectFrom: access source to: access target ].
	edges do: #pushBack.

	"Invocations"
	builder color: Color lightMagenta.
	edges := (aClass queryOutgoing: FamixTInvocation)
		flatCollect: [ :acc | builder connectFrom: acc source toAll: acc candidates ].
	edges do: #pushBack
]

{ #category : #private }
FamixBlueprint >> createLayersFor: aClass [
	self buildLayerNamed: 'Initializers' withMethods: aClass initializers.
	self
		buildLayerNamed: 'Interface methods'
		withMethods: aClass interfaceMethods.
	self
		buildLayerNamed: 'Implementation methods'
		withMethods: aClass implementationMethods.
	self buildLayerNamed: 'Accessors' withMethods: aClass accessorMethods.
	self buildLayerNamed: 'Attributes' withAttributes: aClass attributes
]

{ #category : #private }
FamixBlueprint >> edgeBuilder [
	^ RSEdgeBuilder line
		shapes: (canvas nodes flatCollect: #children);
		withHorizontalAttachPoint;
		yourself
]

{ #category : #public }
FamixBlueprint >> forType: aClass [
	"This is a public method. This methods render in aCanvas the class blueprint of the famix class aClass"

	self createLayersFor: aClass.
	self createEdgesFor: aClass.
	self nestLayers.
	self buildLegend.
	canvas @ RSCanvasController.
	^ canvas
]

{ #category : #initialization }
FamixBlueprint >> initialize [
	super initialize.
	canvas := RSCanvas new
]

{ #category : #private }
FamixBlueprint >> nestLayers [
	| layers maxHeight |
	layers := canvas nodes.
	RSHorizontalTreeLayout new
		on: (layers flatCollect: #nodes)
		edges: canvas edges.
	layers do: [ :layer | layer padding: 10 ].
	maxHeight := layers max: [ :layer | layer height ].
	layers do: [ :layer | layer height: maxHeight ].
	RSHorizontalLineLayout new
		gapSize: 0;
		on: layers
]

{ #category : #private }
FamixBlueprint >> shapeForAttribute: anAttribute [
	| shape |
	shape := RSBox new
		model: anAttribute;
		borderColor: Color lightGray;
		color: Color lightBlue;
		popup;
		yourself.
	shape @ RSDraggable.
	^ shape
]

{ #category : #private }
FamixBlueprint >> shapeForMethod: aMethod [
	| shape |
	shape := RSBox new
		model: aMethod;
		color: aMethod classBlueprintFillColor;
		borderColor: Color lightGray;
		width: (aMethod numberOfOutgoingInvocations max: 5);
		height: (aMethod numberOfLinesOfCode max: 5);
		popup;
		yourself.
	shape @ RSDraggable.
	^ shape
]
