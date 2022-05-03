"
I show annotationTypes and the entities annotated with their instances.
"
Class {
	#name : #FamixAnnotationTypeGroupConstellation,
	#superclass : #MooseAbstractVisualization,
	#instVars : [
		'famixAnnotationTypeGroup'
	],
	#category : #'Famix-Visualizations'
}

{ #category : #accessing }
FamixAnnotationTypeGroupConstellation class >> defaultTitle [
	^ 'Annotations constellation'
]

{ #category : #public }
FamixAnnotationTypeGroupConstellation class >> forAnnotationTypeGroup: aFamixAnnotationTypeGroup [
	^ self new
		famixAnnotationTypeGroup: aFamixAnnotationTypeGroup;
		yourself
]

{ #category : #accessing }
FamixAnnotationTypeGroupConstellation class >> icon [
	^ MooseIcons mooseDependencies
]

{ #category : #building }
FamixAnnotationTypeGroupConstellation >> build [
	| containerNodes annotationLabels |
	containerNodes := self buildAnnotationContainerNodes.
	annotationLabels := self buildAnnotationTypeLabels.
	self connectLabels: annotationLabels toNodes: containerNodes.
	RSForceBasedLayout on: canvas nodes.
	canvas pushBackEdges.
	super build
]

{ #category : #building }
FamixAnnotationTypeGroupConstellation >> buildAnnotationContainerNodes [
	| annotationContainers nodes |
	annotationContainers := famixAnnotationTypeGroup
		flatCollectAsSet:
			[ :annotationType | annotationType instances collect: #annotatedEntity ].
	nodes := annotationContainers
		collect: [ :c | self nodeForAnnotatedEntity: c ].
	canvas addAll: nodes.
	^ nodes
]

{ #category : #building }
FamixAnnotationTypeGroupConstellation >> buildAnnotationTypeLabels [
	| labels |
	labels := famixAnnotationTypeGroup
		collect:
			[ :annotationType | self labelForAnnotationType: annotationType ].
	canvas addAll: labels.
	^ labels
]

{ #category : #building }
FamixAnnotationTypeGroupConstellation >> buildLegend [
	| legend |
	legend := RSLegend new.
	legend container: self canvas.
	legend onDemand.
	legend title: self class defaultTitle.
	legend
		text: 'Annotation types and the entities using their instances'.
	legend text: 'Annotated entities' withCircleColor: self nodeColor.
	legend build
]

{ #category : #building }
FamixAnnotationTypeGroupConstellation >> connectLabels: annotationLabels toNodes: containerNodes [
	RSLineBuilder line
		fromShapes: annotationLabels;
		toShapes: containerNodes;
		color: Color veryLightGray;
		connectToAll:
				[ :annotationType | annotationType instances collect: #annotatedEntity ]
]

{ #category : #initialization }
FamixAnnotationTypeGroupConstellation >> famixAnnotationTypeGroup: aFamixAnnotationTypeGroup [
	famixAnnotationTypeGroup := aFamixAnnotationTypeGroup
]

{ #category : #shapes }
FamixAnnotationTypeGroupConstellation >> labelForAnnotationType: annotationType [
	^ (RSLabel text: annotationType name model: annotationType)
		draggable;
		color: Color black;
		yourself
]

{ #category : #shapes }
FamixAnnotationTypeGroupConstellation >> nodeColor [
	^ Color lightGray
]

{ #category : #shapes }
FamixAnnotationTypeGroupConstellation >> nodeForAnnotatedEntity: entity [
	^ RSCircle new
		model: entity;
		color: self nodeColor;
		popup;
		draggable;
		yourself
]
