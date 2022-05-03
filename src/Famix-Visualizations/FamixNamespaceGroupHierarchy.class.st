"
I show namespaces names and their containment relations.
"
Class {
	#name : #FamixNamespaceGroupHierarchy,
	#superclass : #MooseAbstractVisualization,
	#instVars : [
		'famixNamespaceGroup'
	],
	#category : #'Famix-Visualizations'
}

{ #category : #accessing }
FamixNamespaceGroupHierarchy class >> defaultTitle [
	^ 'Namespaces hierarchy'
]

{ #category : #accessing }
FamixNamespaceGroupHierarchy class >> forNamespaceGroup: aFamixNamespaceGroup [
	^ self new
		famixNamespaceGroup: aFamixNamespaceGroup;
		yourself
]

{ #category : #accessing }
FamixNamespaceGroupHierarchy class >> icon [
	^ MooseIcons mooseSystemComplexity
]

{ #category : #building }
FamixNamespaceGroupHierarchy >> build [
	self buildNodes.
	self connectNodes.
	self setLayout.
	super build
]

{ #category : #building }
FamixNamespaceGroupHierarchy >> buildLegend [
	| legend |
	legend := RSLegend new.
	legend container: self canvas.
	legend onDemand.
	legend title: self class defaultTitle.
	legend text: 'Edges show containment'.
	legend build
]

{ #category : #building }
FamixNamespaceGroupHierarchy >> buildNodes [
	canvas
		addAll:
			(famixNamespaceGroup
				collect:
					[ :namespace | self shapeForNamespace: namespace ])
]

{ #category : #building }
FamixNamespaceGroupHierarchy >> connectNodes [
	RSEdgeBuilder line
		shapes: canvas nodes;
		connectToAll: [ :namespace | namespace atScope: FamixTNamespace ]
]

{ #category : #accessing }
FamixNamespaceGroupHierarchy >> famixNamespaceGroup: anObject [
	famixNamespaceGroup := anObject
]

{ #category : #building }
FamixNamespaceGroupHierarchy >> setLayout [
	RSClusterLayout new on: canvas nodes
]

{ #category : #shapes }
FamixNamespaceGroupHierarchy >> shapeForNamespace: namespace [
	^ RSLabel new
		model: namespace;
		draggable;
		text: namespace name;
		yourself
]
