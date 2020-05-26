Class {
	#name : #FMMetaModelBuilderTestDummy,
	#superclass : #Object,
	#category : #'Fame-Tests-Core'
}

{ #category : #meta }
FMMetaModelBuilderTestDummy class >> annotation [
	<FMClass: #FMAnnotationTest super: #Object>
]

{ #category : #properties }
FMMetaModelBuilderTestDummy >> simpleProperty [
	<FMProperty: #aPropertyName type: #Boolean>
	<FMComment: 'Comment of the simple property'>
	
]
