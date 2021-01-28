"
I show dependencies between namespaces/packages using MalTarjan.
"
Class {
	#name : #FamixContainerGroupDependencies,
	#superclass : #FamixAbstractVisualization,
	#instVars : [
		'tarjan',
		'famixContainerGroup'
	],
	#category : #'Moose-RoassalPaintings-FamixVisualizations'
}

{ #category : #accessing }
FamixContainerGroupDependencies class >> defaultTitle [
	^ 'Dependencies'
]

{ #category : #accessing }
FamixContainerGroupDependencies class >> forContainerGroup: aFamixContainerGroup [
	^ self new
		famixNamespaceGroup: aFamixContainerGroup;
		yourself
]

{ #category : #accessing }
FamixContainerGroupDependencies class >> icon [
	^ MooseIcons mooseCycles
]

{ #category : #building }
FamixContainerGroupDependencies >> build [
	self initialize.
	self runAlgorithm.
	self buildNodes.
	self normalizeNodes.
	self connectNodes.
	self setLayout.
	super build
]

{ #category : #building }
FamixContainerGroupDependencies >> buildLegend [
	| legend |
	legend := RSLegend new.
	legend container: canvas.
	legend onDemand.
	legend title: self class defaultTitle.
	legend text: ''.
	legend
		polymetricWidth: 'number of classes'
		height: 'number of methods'
		box: 'Container'.
	legend
		text: 'Strongly connected namespace'
		withBoxColor: self colorForStronglyConnected.
	legend build
]

{ #category : #building }
FamixContainerGroupDependencies >> buildNodes [
	canvas
		addAll:
			(famixContainerGroup
				collect: [ :container | self shapeForNamespace: container ])
]

{ #category : #colors }
FamixContainerGroupDependencies >> colorForStronglyConnected [
	^ Color red
]

{ #category : #building }
FamixContainerGroupDependencies >> connectNodes [
	RSEdgeBuilder line
		shapes: canvas nodes;
		connectToAll: [ :e | e allProvidersAtScope: self containerScope ].
	canvas pushBackEdges
]

{ #category : #accessing }
FamixContainerGroupDependencies >> containerScope [
	^ famixContainerGroup anyOne class
]

{ #category : #colors }
FamixContainerGroupDependencies >> defaultNodeColor [
	^ Color veryLightGray
]

{ #category : #accessing }
FamixContainerGroupDependencies >> famixNamespaceGroup: anObject [
	famixContainerGroup := anObject
]

{ #category : #initialization }
FamixContainerGroupDependencies >> initialize [
	super initialize.
	tarjan := MalTarjan new
]

{ #category : #normalizing }
FamixContainerGroupDependencies >> normalizeNodes [
	RSNormalizer width
		shapes: canvas nodes;
		normalize: #numberOfClasses.
	RSNormalizer height
		shapes: canvas nodes;
		normalize: [ :container | (container toScope: FamixTMethod) size ]
]

{ #category : #building }
FamixContainerGroupDependencies >> runAlgorithm [
	UIManager default
		displayProgress: 'Computing cycle dependencies'
		from: 0
		to: 3
		during: [ :bar | 
			tarjan nodes: famixContainerGroup.
			bar current: bar current + 1.
			tarjan
				edges: famixContainerGroup
				from: #yourself
				toAll: [ :e | e allProvidersAtScope: self containerScope ].
			bar current: bar current + 1.
			tarjan run.
			bar current: bar current + 1 ]
]

{ #category : #building }
FamixContainerGroupDependencies >> setLayout [
	RSTreeLayout new on: canvas nodes
]

{ #category : #shapes }
FamixContainerGroupDependencies >> shapeForNamespace: namespace [
	^ RSBox new
		model: namespace;
		popup;
		draggable;
		color:
			((tarjan findNode: namespace) isInCycle
				ifTrue: [ self colorForStronglyConnected ]
				ifFalse: [ self defaultNodeColor ])
]
