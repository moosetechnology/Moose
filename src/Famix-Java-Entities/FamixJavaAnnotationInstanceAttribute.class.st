Class {
	#name : #FamixJavaAnnotationInstanceAttribute,
	#superclass : #FamixJavaSourcedEntity,
	#traits : 'FamixTAnnotationInstanceAttribute + FamixTTypedAnnotationInstanceAttribute + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTAnnotationInstanceAttribute classTrait + FamixTTypedAnnotationInstanceAttribute classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAnnotationInstanceAttribute class >> annotation [

	<MSEClass: #AnnotationInstanceAttribute super: #FamixJavaSourcedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaAnnotationInstanceAttribute class >> generatedSlotNames [
	<generated>
	'FamixJavaAnnotationInstanceAttribute class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaAnnotationInstanceAttribute class >> generatedTraitNames [
	<generated>
	^ #(FamixTAnnotationInstanceAttribute FamixTTypedAnnotationInstanceAttribute TDependencyQueries)
]

{ #category : #meta }
FamixJavaAnnotationInstanceAttribute class >> requirements [

	<generated>
	^ { FamixJavaAnnotationInstance }
]

{ #category : #generator }
FamixJavaAnnotationInstanceAttribute class >> resetMooseQueryCaches [
	super resetMooseQueryCaches.
	self resetTEntityMetaLevelDependencyCaches.

]

{ #category : #accessing }
FamixJavaAnnotationInstanceAttribute >> belongsTo [

	<generated>
	^ self parentAnnotationInstance

]

{ #category : #accessing }
FamixJavaAnnotationInstanceAttribute >> belongsTo: anObject [

	<generated>
	self parentAnnotationInstance: anObject

]

{ #category : #'as yet unclassified' }
FamixJavaAnnotationInstanceAttribute >> name [ 
	^ self annotationTypeAttribute notNil 
		ifTrue: [ self annotationTypeAttribute name ]
		ifFalse: [ nil ]
]
