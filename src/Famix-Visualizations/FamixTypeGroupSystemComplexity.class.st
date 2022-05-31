"
I show types in a FamixTypeGroup.
	
Types are represented as boxes for which:
		width = number of attributes
		height = number of methods
		color = number of lines of code.

Inheritance relations are show as edges.
"
Class {
	#name : #FamixTypeGroupSystemComplexity,
	#superclass : #MooseAbstractVisualization,
	#instVars : [
		'famixTypeGroup',
		'widthBlock',
		'colorBlock',
		'heightBlock'
	],
	#category : #'Famix-Visualizations'
}

{ #category : #accessing }
FamixTypeGroupSystemComplexity class >> defaultTitle [
	^ 'System complexity'
]

{ #category : #public }
FamixTypeGroupSystemComplexity class >> forTypeGroup: aFamixTypeGroup [
	^ self new
		famixTypeGroup: aFamixTypeGroup;
		yourself
]

{ #category : #accessing }
FamixTypeGroupSystemComplexity class >> icon [
	^ MooseIcons mooseSystemComplexity
]

{ #category : #shapes }
FamixTypeGroupSystemComplexity >> basicShape [
	^ RSBox new
		borderColor: Color lightGray;
		popup;
		yourself
]

{ #category : #building }
FamixTypeGroupSystemComplexity >> build [
	self buildNodes.
	self buildEgdes.
	self setLayout.
	super build
]

{ #category : #building }
FamixTypeGroupSystemComplexity >> buildEgdes [
	RSEdgeBuilder line
		shapes: canvas nodes;
		withVerticalAttachPoint;
		connectFromAll: #directSuperclasses.
	canvas pushBackEdges
]

{ #category : #building }
FamixTypeGroupSystemComplexity >> buildLegend [
	| legend |
	legend := RSLegend new.
	legend container: canvas.
	legend onDemand.
	legend title: self class defaultTitle.
	legend text: ''.
	legend
		polymetricWidth: 'Number of attributes'
		height: 'Number of methods'
		box: 'Class'.
	legend
		text: 'Number of lines of code'
		withFadingRamp:
			{(0 -> 'white').
			(1 -> 'black')}.
	legend text: 'Line = Inheritance'.
	legend build
]

{ #category : #building }
FamixTypeGroupSystemComplexity >> buildNodes [
	canvas
		addAll:
			(famixTypeGroup
				collect: [ :type | 
					self basicShape
						model: type;
						yourself ]).
	self normalizeNodes
]

{ #category : #accessing }
FamixTypeGroupSystemComplexity >> colorBlock [
	^ colorBlock
		ifNil: [ colorBlock := [ :type | type numberOfLinesOfCode ] ]
]

{ #category : #accessing }
FamixTypeGroupSystemComplexity >> colorBlock: anObject [
	colorBlock := anObject
]

{ #category : #accessing }
FamixTypeGroupSystemComplexity >> famixTypeGroup: aTypeGroup [
	famixTypeGroup := aTypeGroup
]

{ #category : #accessing }
FamixTypeGroupSystemComplexity >> heightBlock [
	^ heightBlock
		ifNil: [ heightBlock := [ :type | type numberOfMethods ] ]
]

{ #category : #accessing }
FamixTypeGroupSystemComplexity >> heightBlock: anObject [
	heightBlock := anObject
]

{ #category : #normalizing }
FamixTypeGroupSystemComplexity >> normalizeNodes [
	self normalizeNodesHeight.
	self normalizeNodesWidth.
	self normalizeNodesColor
]

{ #category : #normalizing }
FamixTypeGroupSystemComplexity >> normalizeNodesColor [
	RSNormalizer color
		from: Color white;
		to: Color black;
		shapes: canvas nodes;
		normalize: self colorBlock
]

{ #category : #normalizing }
FamixTypeGroupSystemComplexity >> normalizeNodesHeight [
	RSNormalizer height
		shapes: canvas nodes;
		scale: self shapesSizeScale;
		normalize: self heightBlock
]

{ #category : #normalizing }
FamixTypeGroupSystemComplexity >> normalizeNodesWidth [

	RSNormalizer width
		shapes: canvas nodes;
		scale: self shapesSizeScale;
		normalize: self widthBlock
]

{ #category : #building }
FamixTypeGroupSystemComplexity >> setLayout [
	RSDominanceTreeLayout new on: canvas shapes edges: canvas edges
]

{ #category : #normalizing }
FamixTypeGroupSystemComplexity >> shapesSizeScale [
	^ NSScale linear range: {5 . 100}
]

{ #category : #accessing }
FamixTypeGroupSystemComplexity >> widthBlock [
	^ widthBlock
		ifNil: [ widthBlock := [ :type | type numberOfAttributes ] ]
]

{ #category : #accessing }
FamixTypeGroupSystemComplexity >> widthBlock: anObject [
	widthBlock := anObject
]
