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
	#superclass : #FamixAbstractVisualization,
	#category : #'Moose-RoassalPaintings-FamixVisualizations'
}

{ #category : #accessing }
FamixTypeGroupSystemComplexity class >> defaultTitle [
	^ 'System complexity'
]

{ #category : #accessing }
FamixTypeGroupSystemComplexity class >> forTypeGroup: aFamixTypeGroup [
	^ self new
		forTypeGroup: aFamixTypeGroup;
		build;
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
	super build.
	self normalizeNodes.
	self buildEgdes.
	self setLayout
]

{ #category : #building }
FamixTypeGroupSystemComplexity >> buildEgdes [
	RSEdgeBuilder line
		shapes: canvas shapes;
		withVerticalAttachPoint;
		connectToAll: #directSuperclasses.
	canvas pushBackEdges
]

{ #category : #building }
FamixTypeGroupSystemComplexity >> buildLegend [
	| legend |
	legend := RSLegend new.
	legend container: canvas.
	legend onDemand.
	legend title: 'System complexity view'.
	legend text: 'Box = Class'.
	legend text: 'Line = Inheritance'.
	legend
		polymetricWidth: 'number of attributes'
		height: 'number of methods'
		box: 'a class'.
	legend
		text: 'Number of lines of code'
		withFadingRamp:
			{(0 -> 'white').
			(1 -> 'black')}.
	legend build
]

{ #category : #accessing }
FamixTypeGroupSystemComplexity >> forTypeGroup: aTypeGroup [
	canvas
		addAll:
			(aTypeGroup
				collect: [ :type | 
					self basicShape
						model: type;
						yourself ])
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
		shapes: canvas shapes;
		normalize: #numberOfLinesOfCode
]

{ #category : #normalizing }
FamixTypeGroupSystemComplexity >> normalizeNodesHeight [
	RSNormalizer height
		shapes: canvas shapes;
		normalize: [ :type | type numberOfMethods max: 5 ]
]

{ #category : #normalizing }
FamixTypeGroupSystemComplexity >> normalizeNodesWidth [
	RSNormalizer width
		shapes: canvas shapes;
		normalize: [ :type | type numberOfAttributes max: 5 ]
]

{ #category : #building }
FamixTypeGroupSystemComplexity >> setLayout [
	RSTreeLayout new on: canvas shapes edges: canvas edges
]
