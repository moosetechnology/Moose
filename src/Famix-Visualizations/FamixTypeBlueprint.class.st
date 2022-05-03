"
I show the blueprint of a FamixTType.

The visualization shows 5 layers: 
	- initialization methods
	- public methods
	- private methods
	- accessors
	- attributes

Edges represent variable accesses and method invocations.
"
Class {
	#name : #FamixTypeBlueprint,
	#superclass : #MooseAbstractVisualization,
	#instVars : [
		'famixType'
	],
	#category : #'Famix-Visualizations'
}

{ #category : #adding }
FamixTypeBlueprint class >> defaultTitle [
	^ 'Blueprint'
]

{ #category : #public }
FamixTypeBlueprint class >> forType: aFamixType [
	^ self new
		famixType: aFamixType;
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
	super build
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
	builder color: (Color r: 0 g: 0 b: 0.8 alpha: 0.6 ).
	edges := (famixType queryOutgoing: FamixTInvocation)
		flatCollect: [ :acc | builder connectFrom: acc source toAll: acc candidates ].
	edges do: #pushBack
]

{ #category : #building }
FamixTypeBlueprint >> buildLayerNamed: label withEntities: aGroup [
	| layer |
	layer := RSComposite new borderColor: Color gray translucent.
	layer
		addAll: (aGroup collect: [ :entity | entity shapeInBlueprint: self ]).
	layer popupText: label.
	self canvas add: layer
]

{ #category : #building }
FamixTypeBlueprint >> buildLayers [
	self layersEntities
		keysAndValuesDo:
			[ :title :entities | self buildLayerNamed: title withEntities: entities ]
]

{ #category : #building }
FamixTypeBlueprint >> buildLegend [
	| legend |
	legend := RSLegend new.
	legend container: self canvas.
	legend onDemand.
	legend title: self class defaultTitle.
	legend text: 'From left to right:'.
	legend
		text:
			'    Constructors, Public methods, Private methods, Accessors, Attributes'.
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
				color: (Color r: 0 g: 0 b: 0.8 alpha: 0.6 )).
	legend text: 'Setter' withBoxColor: Color red.
	legend text: 'Getter' withBoxColor: Color orange.
	legend text: 'Abstract' withBoxColor: Color cyan.
	legend text: 'Overriding' withBoxColor: Color brown.
	legend text: 'Constant' withBoxColor: Color gray.
	legend build
]

{ #category : #shapes }
FamixTypeBlueprint >> colorForMethod: aMethod [
	aMethod isPureAccessor
		ifTrue: [ ^ Color orange ].
	aMethod isSetter
		ifTrue: [ ^ Color red ].
	aMethod isGetter
		ifTrue: [ ^ Color orange ].
	(aMethod isAbstract isNotNil and: [ aMethod isAbstract ])
		ifTrue: [ ^ Color cyan ].
	aMethod isOverriding
		ifTrue: [ ^ Color brown ].
	aMethod isConstant
		ifTrue: [ ^ Color gray ].
	^ Color white
]

{ #category : #shapes }
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
FamixTypeBlueprint >> layersEntities [
	^ {('Initializers'
		-> (famixType methods select: [ :method | method isInitializer ])).
	('Interface methods'
		->
			(famixType methods
				select: [ :each | 
					each isInternalImplementation not & each isInitializer not
						& each isPureAccessor not ])).
	('Implementation methods'
		->
			(famixType methods
				select: [ :method | method isInternalImplementation ])).
	('Accessors'
		-> (famixType methods select: [ :method | method isPureAccessor ])).
	('Attributes' -> famixType attributes)} asOrderedDictionary
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
		color: Color blue;
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
		color: (self colorForMethod: aMethod);
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
