"
I show classes, their methods and attributes.

My edges show hierarchy, containment, invocations and accesses.
See #buildLegend.
"
Class {
	#name : #FamixTypeGroupSystemAttraction,
	#superclass : #MooseAbstractVisualization,
	#instVars : [
		'famixTypeGroup'
	],
	#category : #'Famix-Visualizations'
}

{ #category : #accessing }
FamixTypeGroupSystemAttraction class >> defaultTitle [
	^ 'System attraction'
]

{ #category : #public }
FamixTypeGroupSystemAttraction class >> forTypeGroup: aFamixTypeGroup [
	^ self new
		famixTypeGroup: aFamixTypeGroup;
		yourself
]

{ #category : #accessing }
FamixTypeGroupSystemAttraction class >> icon [
	^ MooseIcons mooseCluster
]

{ #category : #colors }
FamixTypeGroupSystemAttraction >> attributeColor [
	^ Color r: 0.3 g: 0.3 b: 1.0
]

{ #category : #building }
FamixTypeGroupSystemAttraction >> build [
	| classesNodes methodsNodes attributesNodes |
	classesNodes := self buildClassesNodes.
	methodsNodes := self buildMethodsNodes.
	attributesNodes := self buildAttributesNodes.
	self connectClasses: classesNodes.
	self connectClasses: classesNodes toMethods: methodsNodes.
	self connectClasses: classesNodes toAttributes: attributesNodes.
	self connectAccessesFrom: methodsNodes to: attributesNodes.
	RSForceBasedLayout new on: canvas nodes.

	"Connecting after setting the layout so these edges are not taken into account when setting the layout. Much more clarity"
	self connectInvocations: methodsNodes.
	
	canvas pushBackEdges.
	super build
]

{ #category : #building }
FamixTypeGroupSystemAttraction >> buildAttributesNodes [
	| attributesNodes |
	attributesNodes := famixTypeGroup
		flatCollect: [ :class | 
			class attributes
				collect: [ :attribute | self shapeForAttribute: attribute ] ].
	canvas addAll: attributesNodes.
	RSNormalizer size
		shapes: attributesNodes;
		scale: self smallSizeScale;
		normalize: #numberOfAccesses.
	^ attributesNodes
]

{ #category : #building }
FamixTypeGroupSystemAttraction >> buildClassesNodes [
	| classesNodes |
	classesNodes := famixTypeGroup
		collect: [ :class | self shapeForClass: class ].
	canvas addAll: classesNodes.
	RSNormalizer size
		shapes: classesNodes;
		scale: self largeSizeScale;
		normalize: #numberOfMethods.
	^ classesNodes
]

{ #category : #building }
FamixTypeGroupSystemAttraction >> buildLegend [
	| legend |
	legend := RSLegend new.
	legend container: self canvas.
	legend onDemand.
	legend title: self class defaultTitle.
	legend text: 'Classes' withCircleColor: self classColor.
	legend text: 'Methods' withCircleColor: self methodColor.
	legend text: 'Attributes' withCircleColor: self attributeColor.
	legend text: 'Inheritance' withBoxColor: self classColor.
	legend text: 'Containment' withBoxColor: self classColor lighter.
	legend text: 'Invocations' withBoxColor: self methodColor muchLighter.
	legend text: 'Accesses' withBoxColor: self attributeColor muchLighter.
	legend build
]

{ #category : #building }
FamixTypeGroupSystemAttraction >> buildMethodsNodes [
	| methodsNodes |
	methodsNodes := famixTypeGroup
		flatCollect:
			[ :class | class methods collect: [ :method | self shapeForMethod: method ] ].
	canvas addAll: methodsNodes.
	RSNormalizer size
		shapes: methodsNodes;
		scale: self smallSizeScale;
		normalize: [ :m | m invokedMethods size ].
	^ methodsNodes
]

{ #category : #colors }
FamixTypeGroupSystemAttraction >> classColor [
	^ Color black
]

{ #category : #edges }
FamixTypeGroupSystemAttraction >> connectAccessesFrom: methodsNodes to: attributesNodes [
	RSEdgeBuilder line
		color: self attributeColor muchLighter;
		fromShapes: attributesNodes;
		toShapes: methodsNodes;
		connectToAll: #accessingMethods
]

{ #category : #edges }
FamixTypeGroupSystemAttraction >> connectClasses: classesNodes [
	RSEdgeBuilder line
		color: self classColor;
		shapes: classesNodes;
		connectTo: #superclass
]

{ #category : #edges }
FamixTypeGroupSystemAttraction >> connectClasses: classesNodes toAttributes: attributesNodes [
	RSEdgeBuilder line
		color: self classColor lighter;
		fromShapes: classesNodes;
		toShapes: attributesNodes;
		connectToAll: #attributes
]

{ #category : #edges }
FamixTypeGroupSystemAttraction >> connectClasses: classesNodes toMethods: methodsNodes [
	RSEdgeBuilder line
		color: self classColor lighter;
		fromShapes: classesNodes;
		toShapes: methodsNodes;
		connectToAll: #methods
]

{ #category : #edges }
FamixTypeGroupSystemAttraction >> connectInvocations: methodsNodes [
	RSLineBuilder line
		borderColor: self methodColor muchLighter;
		shapes: methodsNodes;
		connectToAll: #invokedMethods
]

{ #category : #initialization }
FamixTypeGroupSystemAttraction >> famixTypeGroup: aTypeGroup [
	famixTypeGroup := aTypeGroup
]

{ #category : #shapes }
FamixTypeGroupSystemAttraction >> largeSizeScale [
	^ NSScale linear range: {10 . 50}
]

{ #category : #colors }
FamixTypeGroupSystemAttraction >> methodColor [
	^ Color r: 1.0 g: 0.3 b: 0.3
]

{ #category : #shapes }
FamixTypeGroupSystemAttraction >> shapeForAttribute: anAttribute [
	^ RSEllipse new
		model: anAttribute;
		popup;
		draggable;
		color: self attributeColor;
		@
			(RSHighlightable
				showEdges: [ :attribute | attribute accessors ]
				using: (RSLine new color: self attributeColor darker));
		yourself
]

{ #category : #shapes }
FamixTypeGroupSystemAttraction >> shapeForClass: aClass [
	^ RSEllipse new
		model: aClass;
		popup;
		draggable;
		color: self classColor;
		yourself
]

{ #category : #shapes }
FamixTypeGroupSystemAttraction >> shapeForMethod: aMethod [
	^ RSEllipse new
		model: aMethod;
		popup;
		draggable;
		color: self methodColor;
		@
			(RSHighlightable
				showEdges: [ :method | 
					method queryAllOutgoingInvocations opposites
						, method queryAllIncomingInvocations opposites ]
				using: (RSLine new color: self methodColor darker));
		yourself
]

{ #category : #shapes }
FamixTypeGroupSystemAttraction >> smallSizeScale [
	^ NSScale linear range: {5 . 10}
]
