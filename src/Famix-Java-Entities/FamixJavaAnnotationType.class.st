Class {
	#name : #FamixJavaAnnotationType,
	#superclass : #FamixJavaType,
	#traits : 'FamixTAnnotationType',
	#classTraits : 'FamixTAnnotationType classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAnnotationType class >> annotation [

	<MSEClass: #AnnotationType super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaAnnotationType class >> generatedSlotNames [
	<generated>
	'FamixJavaAnnotationType class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaAnnotationType class >> generatedTraitNames [
	<generated>
	^ #(FamixTAnnotationType)
]

{ #category : #meta }
FamixJavaAnnotationType class >> requirements [

	<generated>
	^ { FamixJavaContainerEntity }
]

{ #category : #'as yet unclassified' }
FamixJavaAnnotationType >> annotatedEntities [
	^ self instances collect: [:each | each annotatedEntity ]
]

{ #category : #'as yet unclassified' }
FamixJavaAnnotationType >> annotatedEntitiesGroup [
	<navigation: 'Annotated entities'>
	^ self annotatedEntities asMooseGroup
]

{ #category : #accessing }
FamixJavaAnnotationType >> belongsTo [

	<generated>
	^ self annotationTypesContainer

]

{ #category : #accessing }
FamixJavaAnnotationType >> belongsTo: anObject [

	<generated>
	self annotationTypesContainer: anObject

]

{ #category : #'as yet unclassified' }
FamixJavaAnnotationType >> typeContainer [

	^ self annotationTypesContainer
]

{ #category : #'as yet unclassified' }
FamixJavaAnnotationType >> typeContainer: anObject [

	^ self annotationTypesContainer: anObject
]
