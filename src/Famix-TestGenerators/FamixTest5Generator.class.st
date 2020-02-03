Class {
	#name : #FamixTest5Generator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'annotationType1',
		'withAnnotationType1',
		'annotationType2',
		'withAnnotationType2'
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

	annotationType1 := builder newClassNamed: #AnnotationType1.
	withAnnotationType1 := builder newClassNamed: #WithAnnotationType1.
	
	annotationType2 := builder newClassNamed: #AnnotationType2.
	withAnnotationType2 := builder newClassNamed: #WithAnnotationType2.

]

{ #category : #definition }
FamixTest5Generator >> defineRelations [

	super defineRelations.

	self apply: #TAnnotationType on: annotationType1 oppositeTrait: #TWithAnnotationTypes on: withAnnotationType1.

	self apply: #TWithAnnotationTypes on: withAnnotationType2 oppositeOn: annotationType2.

]
