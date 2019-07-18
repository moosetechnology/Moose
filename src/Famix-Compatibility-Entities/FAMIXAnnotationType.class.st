Class {
	#name : #FAMIXAnnotationType,
	#superclass : #FAMIXType,
	#traits : 'FamixTAnnotationType',
	#classTraits : 'FamixTAnnotationType classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXAnnotationType class >> annotation [

	<MSEClass: #AnnotationType super: #FAMIXType>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #meta }
FAMIXAnnotationType class >> requirements [

	<generated>
	^ { FAMIXContainerEntity }
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
FAMIXAnnotationType >> belongsTo [

	<generated>
	^ self annotationTypesContainer

]

{ #category : #accessing }
FAMIXAnnotationType >> belongsTo: anObject [

	<generated>
	self annotationTypesContainer: anObject

]

{ #category : #accessing }
FAMIXAnnotationType >> typeContainer [

	^ self annotationTypesContainer
]

{ #category : #accessing }
FAMIXAnnotationType >> typeContainer: anObject [

	^ self annotationTypesContainer: anObject
]
