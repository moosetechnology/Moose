Class {
	#name : #FamixTypeBlueprint,
	#superclass : #FamixAbstractVisualization,
	#instVars : [
		'famixType'
	],
	#category : #'Moose-RoassalPaintings-FamixVisualizations'
}

{ #category : #adding }
FamixTypeBlueprint class >> defaultTitle [
	^ 'Blueprint'
]

{ #category : #public }
FamixTypeBlueprint class >> forType: aFamixType [
	^ self new
		famixType: aFamixType;
		build;
		yourself
]

{ #category : #adding }
FamixTypeBlueprint class >> icon [
	^ MooseIcons mooseBlueprint
]

{ #category : #building }
FamixTypeBlueprint >> build [
	self buildLayers.
	self buildEdges.
	self nestLayers.
	self buildLegend
]

{ #category : #building }
FamixTypeBlueprint >> buildEdges [
	| builder edges |
	"Accesses"
	builder := self edgeBuilder
		color: Color lightBlue;
		yourself.
	edges := famixType queryIncomingAccesses
		flatCollect: [ :access | builder connectFrom: access source to: access target ].
	edges do: #pushBack.

	"Invocations"
	builder color: Color lightMagenta.
	edges := (famixType queryOutgoing: FamixTInvocation)
		flatCollect: [ :acc | builder connectFrom: acc source toAll: acc candidates ].
	edges do: #pushBack
]

{ #category : #building }
FamixTypeBlueprint >> buildLayerNamed: label withEntities: aGroup [
	| layer |
	layer := RSComposite new borderColor: Color gray.
	layer
		addAll: (aGroup collect: [ :entity | entity shapeInBlueprint: self ]).
	layer popupText: label.
	self canvas add: layer
]

{ #category : #building }
FamixTypeBlueprint >> buildLayers [
	self
		buildLayerNamed: 'Initializers'
		withEntities: famixType initializers.
	self
		buildLayerNamed: 'Interface methods'
		withEntities: famixType interfaceMethods.
	self
		buildLayerNamed: 'Implementation methods'
		withEntities: famixType implementationMethods.
	self
		buildLayerNamed: 'Accessors'
		withEntities: famixType accessorMethods.
	self buildLayerNamed: 'Attributes' withEntities: famixType attributes
]

{ #category : #building }
FamixTypeBlueprint >> buildLegend [
	| legend |
	legend := RSLegend new.
	legend container: self canvas.
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

{ #category : #building }
FamixTypeBlueprint >> edgeBuilder [
	^ RSEdgeBuilder line
		shapes: (self canvas nodes flatCollect: #children);
		withHorizontalAttachPoint;
		yourself
]

{ #category : #accessing }
FamixTypeBlueprint >> famixType: aFamixType [
	famixType := aFamixType
]

{ #category : #building }
FamixTypeBlueprint >> nestLayers [
	| layers maxHeight |
	layers := self canvas nodes.
	RSHorizontalTreeLayout new
		on: (layers flatCollect: #nodes)
		edges: self canvas edges.
	layers do: [ :layer | layer padding: 10 ].
	maxHeight := layers max: [ :layer | layer height ].
	layers do: [ :layer | layer height: maxHeight ].
	RSHorizontalLineLayout new
		gapSize: 0;
		on: layers
]

{ #category : #shapes }
FamixTypeBlueprint >> shapeForAttribute: anAttribute [
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

{ #category : #shapes }
FamixTypeBlueprint >> shapeForMethod: aMethod [
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

{ #category : #accessing }
FamixTypeBlueprint >> windowTitle [
	^ famixType name , ' blueprint'
]
