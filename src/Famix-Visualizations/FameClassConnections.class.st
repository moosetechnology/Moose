"
I show commplex properties of a F3Class.

The class is shown in blue, as well as its complex properties.
The opposites of these properties are shown in gray, as well as their type.
In light blue is shown the relation between each property and its opposite.
"
Class {
	#name : #FameClassConnections,
	#superclass : #MooseAbstractVisualization,
	#instVars : [
		'fameClass'
	],
	#category : #'Famix-Visualizations-Fame'
}

{ #category : #accessing }
FameClassConnections class >> defaultTitle [
	^ 'Connections'
]

{ #category : #'as yet unclassified' }
FameClassConnections class >> forFameClass: aFM3Class [
	^ self new
		fameClass: aFM3Class;
		yourself
]

{ #category : #accessing }
FameClassConnections class >> icon [
	^ MooseIcons mooseDependencies
]

{ #category : #building }
FameClassConnections >> build [
	| classNode complexPropertyTypes complexProperties oppositeProperties |
	classNode := self buildClassNode.
	complexPropertyTypes := self buildOppositeClassesNodes.
	complexProperties := self buildPropertiesNodes.
	oppositeProperties := self buildOppositePropertiesNodes.
	self connectClassNode: classNode toProperties: complexProperties.
	self
		connectProperties: complexProperties
		toOpposites: oppositeProperties.
	self
		connectOpposites: oppositeProperties
		toClass: classNode
		orOtherType: complexPropertyTypes.
	canvas pushBackEdges.
	RSForceBasedLayout new on: canvas nodes.
	super build
]

{ #category : #building }
FameClassConnections >> buildClassNode [
	| classNode |
	classNode := (self nodeFor: fameClass)
		color: self highlightColor;
		size: self typeNodeSize;
		yourself.
	canvas add: classNode.
	^ classNode
]

{ #category : #building }
FameClassConnections >> buildLegend [
	| legend |
	legend := RSLegend new.
	legend container: self canvas.
	legend onDemand.
	legend title: self class defaultTitle.
	legend
		text: 'FM3Class and its complex properties'
		withCircleColor: self highlightColor.
	legend
		text: 'Properties opposites and their type (can be the FM3Class)'
		withCircleColor: self oppositeColor.
	legend
		text: 'Opposites relations'
		withBoxColor: (self highlightColor alpha: 0.5).
	legend build
]

{ #category : #building }
FameClassConnections >> buildOppositeClassesNodes [
	| nodes |
	nodes := (((fameClass complexProperties collect: #type) \ {fameClass})
		asSet
		collect: [ :class | 
			(self nodeFor: class)
				color: self oppositeColor;
				size: self typeNodeSize;
				yourself ]) asArray.
	canvas addAll: nodes.
	^ nodes
]

{ #category : #building }
FameClassConnections >> buildOppositePropertiesNodes [
	| nodes |
	nodes := (fameClass complexProperties
		collect: #opposite
		thenReject: #isNil)
		collect: [ :opposite | 
			(self nodeFor: opposite)
				color: self oppositeColor;
				yourself ].
	canvas addAll: nodes.
	^ nodes
]

{ #category : #building }
FameClassConnections >> buildPropertiesNodes [
	| nodes |
	nodes := fameClass complexProperties
		collect: [ :property | 
			(self nodeFor: property)
				color: self highlightColor;
				yourself ].
	canvas addAll: nodes.
	^ nodes
]

{ #category : #building }
FameClassConnections >> connectClassNode: classNode toProperties: complexProperties [
	RSEdgeBuilder line
		color: self highlightColor;
		fromShapes: {classNode};
		toShapes: complexProperties;
		connectToAll: #complexProperties
]

{ #category : #building }
FameClassConnections >> connectOpposites: oppositeProperties toClass: classNode orOtherType: complexPropertyTypes [
	RSEdgeBuilder line
		color: self oppositeColor;
		fromShapes: oppositeProperties;
		toShapes: {classNode} , complexPropertyTypes;
		connectTo: #mmClass
]

{ #category : #building }
FameClassConnections >> connectProperties: complexProperties toOpposites: oppositeProperties [
	RSEdgeBuilder line
		color: (self highlightColor alpha: 0.5);
		fromShapes: complexProperties;
		toShapes: oppositeProperties;
		connectTo: #opposite
]

{ #category : #accessing }
FameClassConnections >> fameClass: aFM3Class [
	fameClass := aFM3Class
]

{ #category : #shapes }
FameClassConnections >> highlightColor [
	^ Color blue
]

{ #category : #shapes }
FameClassConnections >> nodeFor: aModel [
	^ RSCircle new
		model: aModel;
		popupText: #name;
		draggable;
		yourself
]

{ #category : #shapes }
FameClassConnections >> oppositeColor [
	^ Color lightGray
]

{ #category : #shapes }
FameClassConnections >> typeNodeSize [
	^ 20
]
