Class {
	#name : #FAMIXAnnotationInstanceAttribute,
	#superclass : #FAMIXSourcedEntity,
	#traits : 'FamixTAnnotationInstanceAttribute + FamixTTypedAnnotationInstanceAttribute + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTAnnotationInstanceAttribute classTrait + FamixTTypedAnnotationInstanceAttribute classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXAnnotationInstanceAttribute class >> annotation [

	<MSEClass: #AnnotationInstanceAttribute super: #FAMIXSourcedEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXAnnotationInstanceAttribute class >> generatedSlotNames [
	<generated>
	'FAMIXAnnotationInstanceAttribute class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXAnnotationInstanceAttribute class >> generatedTraitNames [
	<generated>
	^ #(FamixTAnnotationInstanceAttribute FamixTTypedAnnotationInstanceAttribute TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #meta }
FAMIXAnnotationInstanceAttribute class >> requirements [

	<generated>
	^ { FAMIXAnnotationInstance }
]

{ #category : #'Moose-Query-Extensions' }
FAMIXAnnotationInstanceAttribute class >> resetMooseQueryCaches [
	super resetMooseQueryCaches.
	self resetTEntityMetaLevelDependencyCaches.

]

{ #category : #accessing }
FAMIXAnnotationInstanceAttribute >> belongsTo [

	<generated>
	^ self parentAnnotationInstance

]

{ #category : #accessing }
FAMIXAnnotationInstanceAttribute >> belongsTo: anObject [

	<generated>
	self parentAnnotationInstance: anObject

]

{ #category : #'as yet unclassified' }
FAMIXAnnotationInstanceAttribute >> name [ 
	^ self annotationTypeAttribute notNil 
		ifTrue: [ self annotationTypeAttribute name ]
		ifFalse: [ nil ]
]
