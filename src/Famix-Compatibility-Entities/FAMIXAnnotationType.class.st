Class {
	#name : #FAMIXAnnotationType,
	#superclass : #FAMIXType,
	#traits : 'FamixTAnnotationType',
	#classTraits : 'FamixTAnnotationType classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXAnnotationType class >> annotation [

	<FMClass: #AnnotationType super: #FAMIXType>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'accessing-query' }
FAMIXAnnotationType >> annotatedEntities [
	^ self instances collect: [:each | each annotatedEntity ]
]

{ #category : #'accessing-query' }
FAMIXAnnotationType >> annotatedEntitiesGroup [
	<navigation: 'Annotated entities'>
	^ self annotatedEntities asMooseGroup
]

{ #category : #accessing }
FAMIXAnnotationType >> typeContainer [

	^ self annotationTypesContainer
]

{ #category : #accessing }
FAMIXAnnotationType >> typeContainer: anObject [

	^ self annotationTypesContainer: anObject
]
