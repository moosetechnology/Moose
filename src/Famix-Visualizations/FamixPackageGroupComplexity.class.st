"
I show system complexity of each package in a FamixPackageGroup.
	
Types are represented as boxes for which:
		width = number of attributes
		height = number of methods
		color = number of lines of code.
Inheritance relations are show as edges.

Missing: edges to represent inheritance between packages. For now, no layout is available that would make this information readable.
"
Class {
	#name : #FamixPackageGroupComplexity,
	#superclass : #MooseAbstractVisualization,
	#instVars : [
		'famixPackageGroup'
	],
	#category : #'Famix-Visualizations'
}

{ #category : #accessing }
FamixPackageGroupComplexity class >> defaultTitle [
	^ 'Packages complexity'
]

{ #category : #accessing }
FamixPackageGroupComplexity class >> forPackageGroup: aFamixPackageGroup [
	^ self new
		famixPackageGroup: aFamixPackageGroup;
		yourself
]

{ #category : #accessing }
FamixPackageGroupComplexity class >> icon [
	^ MooseIcons mooseDependencies
]

{ #category : #shapes }
FamixPackageGroupComplexity >> alignLabelInShape: shape [
	RSVerticalLineLayout new
		alignCenter;
		on: shape nodes.
	shape padding: 10
]

{ #category : #building }
FamixPackageGroupComplexity >> build [
	self buildNodes.
	"self connectNodes."
	RSFlowLayout new
		gapSize: 20;
		on: canvas nodes.
	super build
]

{ #category : #building }
FamixPackageGroupComplexity >> buildLegend [
	| legend |
	legend := RSLegend new.
	legend container: canvas.
	legend onDemand.
	legend title: self class defaultTitle.
	legend text: 'Packages' withBoxColor: self packageBackgroudColor.
	legend title: 'Inside each package:'.
	legend
		polymetricWidth: 'Number of attributes'
		height: 'Number of methods'
		box: 'Class'.
	legend text: 'Line = Inheritance'.
	legend
		text: 'Number of lines of code'
		withFadingRamp:
			{(0 -> 'white').
			(1 -> 'black')}.
	legend build
]

{ #category : #building }
FamixPackageGroupComplexity >> buildNodes [
	canvas
		addAll:
			(famixPackageGroup
				collect: [ :package | self shapeForPackage: package ])
]

{ #category : #building }
FamixPackageGroupComplexity >> connectNodes [
	RSEdgeBuilder line
		shapes: canvas nodes;
		connectToAll:
				[ :package | package queryIncomingInheritances atScope: FamixTPackage ].
	canvas pushBackEdges
]

{ #category : #accessing }
FamixPackageGroupComplexity >> famixPackageGroup: anObject [
	famixPackageGroup := anObject
]

{ #category : #shapes }
FamixPackageGroupComplexity >> labelForPackage: aPackage [
	| label |
	label := RSLabel new.
	label text: aPackage name.
	^ label
]

{ #category : #color }
FamixPackageGroupComplexity >> packageBackgroudColor [
	^ Color veryLightGray
]

{ #category : #shapes }
FamixPackageGroupComplexity >> shapeForPackage: aPackage [
	| shape |
	shape := RSComposite new
		model: aPackage;
		color: self packageBackgroudColor;
		draggable;
		popup;
		add: (self labelForPackage: aPackage);
		add: (self systemComplexityOf: aPackage);
		yourself.
	self alignLabelInShape: shape.
	^ shape
]

{ #category : #shapes }
FamixPackageGroupComplexity >> systemComplexityOf: aPackage [
	^ (aPackage allClasses asMooseSpecializedGroup systemComplexity
		build;
		yourself) canvas asShape
]
