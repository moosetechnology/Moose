"
I show TypeBlueprints for each type in a FamixTypeGroup.

Edges between blueprints represent hierarchy
"
Class {
	#name : #FamixTypeGroupBlueprintComplexity,
	#superclass : #MooseAbstractVisualization,
	#instVars : [
		'famixTypeGroup'
	],
	#category : #'Famix-Visualizations'
}

{ #category : #accessing }
FamixTypeGroupBlueprintComplexity class >> defaultTitle [
	^ 'Blueprint complexity'
]

{ #category : #public }
FamixTypeGroupBlueprintComplexity class >> forTypeGroup: aFamixTypeGroup [
	^ self new
		famixTypeGroup: aFamixTypeGroup;
		yourself
]

{ #category : #accessing }
FamixTypeGroupBlueprintComplexity class >> icon [
	^ MooseIcons mooseBlueprint
]

{ #category : #shapes }
FamixTypeGroupBlueprintComplexity >> blueprintOfType: type [
	| singleBlueprint |
	singleBlueprint := (type blueprint
		build;
		yourself) canvas asShape
		model: type;
		@ RSDraggable;
		yourself.

	"The following is a hack: after copying shapes from singleBlueprint, shapes are unaware of their connected edges."
	singleBlueprint edges
		do: [ :edge | 
			edge from addConnectedEdge: edge.
			edge to addConnectedEdge: edge ].

	^ singleBlueprint
]

{ #category : #building }
FamixTypeGroupBlueprintComplexity >> build [
	self buildSingleTypeBlueprints.
	self connectSingleBlueprints.
	RSTreeLayout new on: canvas nodes edges: canvas edges.
	super build
]

{ #category : #building }
FamixTypeGroupBlueprintComplexity >> buildLegend [
	| legend |
	legend := RSLegend new.
	legend container: self canvas.
	legend onDemand.
	legend title: self class defaultTitle.
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
FamixTypeGroupBlueprintComplexity >> buildSingleTypeBlueprints [
	canvas
		addAll: (famixTypeGroup collect: [ :type | self blueprintOfType: type ])
]

{ #category : #building }
FamixTypeGroupBlueprintComplexity >> connectSingleBlueprints [
	RSEdgeBuilder line
		shapes: canvas nodes;
		color: Color veryLightGray;
		withVerticalAttachPoint;
		connectTo: [ :class | class superclass ].
	canvas pushBackEdges
]

{ #category : #accessing }
FamixTypeGroupBlueprintComplexity >> famixTypeGroup: aFamixTypeGroup [
	famixTypeGroup := aFamixTypeGroup
]
