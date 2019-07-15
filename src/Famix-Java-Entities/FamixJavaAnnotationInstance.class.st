Class {
	#name : #FamixJavaAnnotationInstance,
	#superclass : #FamixJavaSourcedEntity,
	#traits : 'FamixTAnnotationInstance + FamixTTypedAnnotationInstance + FamixTWithAnnotationInstanceAttributes + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTAnnotationInstance classTrait + FamixTTypedAnnotationInstance classTrait + FamixTWithAnnotationInstanceAttributes classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAnnotationInstance class >> annotation [

	<MSEClass: #AnnotationInstance super: #FamixJavaSourcedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaAnnotationInstance class >> generatedSlotNames [
	<generated>
	'FamixJavaAnnotationInstance class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaAnnotationInstance class >> generatedTraitNames [
	<generated>
	^ #(FamixTAnnotationInstance FamixTTypedAnnotationInstance FamixTWithAnnotationInstanceAttributes TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #meta }
FamixJavaAnnotationInstance class >> requirements [

	<generated>
	^ { FamixJavaNamedEntity }
]

{ #category : #'Moose-Query' }
FamixJavaAnnotationInstance class >> resetMooseQueryCaches [
	super resetMooseQueryCaches.
	self resetTEntityMetaLevelDependencyCaches.

]

{ #category : #accessing }
FamixJavaAnnotationInstance >> belongsTo [

	<generated>
	^ self annotatedEntity

]

{ #category : #accessing }
FamixJavaAnnotationInstance >> belongsTo: anObject [

	<generated>
	self annotatedEntity: anObject

]

{ #category : #'as yet unclassified' }
FamixJavaAnnotationInstance >> mooseNameOn: aStream [
	self annotationType notNil ifTrue: [
		self annotationType mooseNameOn: aStream ].
	aStream nextPut: $(.
	self attributes 
			do: [:each | aStream nextPutAll: each value asString ]
			separatedBy: [aStream nextPut: $,].  
	aStream nextPut: $).
	aStream nextPut: $-.
	self annotatedEntity notNil ifTrue: [
		self annotatedEntity mooseNameOn: aStream ]
]

{ #category : #'as yet unclassified' }
FamixJavaAnnotationInstance >> name [
	^ String
		streamContents: [ :stream | 
			stream << '@'
				<< (self annotationType ifNil: [ super name ] ifNotNil: [ :type | type name ])
				<< ' on ' << (self annotatedEntity ifNotNil: #name ifNil: [ 'undefined' ]) ]
]
