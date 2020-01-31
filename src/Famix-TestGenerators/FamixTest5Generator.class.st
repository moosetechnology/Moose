Class {
	#name : #FamixTest5Generator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'classEntity',
		'primitiveType',
		'method',
		'type',
		'reference',
		'invocation',
		'annotationType',
		'withAnnotationType',
		'annotationInstance'
	],
	#category : #'Famix-TestGenerators'
}

{ #category : #accessing }
FamixTest5Generator class >> packageName [

	^ #'Famix-Test5-Entities'
]

{ #category : #accessing }
FamixTest5Generator class >> prefix [

	^ #'FamixTest5'
]

{ #category : #accessing }
FamixTest5Generator class >> submetamodels [
	^ {  FamixGenerator }
]

{ #category : #definition }
FamixTest5Generator >> defineClasses [

	super defineClasses.

	annotationType := builder newClassNamed: #AnnotationType.
	withAnnotationType := builder newClassNamed: #WithAnnotationType.
	annotationInstance := builder newClassNamed: #TypedAnnotationInstance.
	
]

{ #category : #definition }
FamixTest5Generator >> defineRelations [

	super defineRelations.

	self apply: #TAnnotationType on: annotationType oppositeTrait: #TWithAnnotationTypes on: withAnnotationType.
	"annotationInstance"
	
]
