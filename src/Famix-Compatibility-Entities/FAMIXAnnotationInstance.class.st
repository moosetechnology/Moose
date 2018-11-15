Class {
	#name : #FAMIXAnnotationInstance,
	#superclass : #FAMIXSourcedEntity,
	#traits : 'FamixTAnnotationInstance + FamixTTypedAnnotationInstance + FamixTWithAnnotationInstanceAttributes + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTAnnotationInstance classTrait + FamixTTypedAnnotationInstance classTrait + FamixTWithAnnotationInstanceAttributes classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXAnnotationInstance class >> annotation [

	<MSEClass: #AnnotationInstance super: #FAMIXSourcedEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXAnnotationInstance class >> generatedSlotNames [
	<generated>
	'FAMIXAnnotationInstance class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXAnnotationInstance class >> generatedTraitNames [
	<generated>
	^ #(FamixTAnnotationInstance FamixTTypedAnnotationInstance FamixTWithAnnotationInstanceAttributes TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #meta }
FAMIXAnnotationInstance class >> requirements [

	<generated>
	^ { FAMIXNamedEntity }
]

{ #category : #'Moose-Query-Extensions' }
FAMIXAnnotationInstance class >> resetMooseQueryCaches [
	super resetMooseQueryCaches.
	self resetTEntityMetaLevelDependencyCaches.

]

{ #category : #accessing }
FAMIXAnnotationInstance >> belongsTo [

	<generated>
	^ self annotatedEntity

]

{ #category : #accessing }
FAMIXAnnotationInstance >> belongsTo: anObject [

	<generated>
	self annotatedEntity: anObject

]

{ #category : #accessing }
FAMIXAnnotationInstance >> mooseNameOn: aStream [
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

{ #category : #accessing }
FAMIXAnnotationInstance >> name [
	^ String
		streamContents: [ :stream | 
			stream << '@'
				<< (self annotationType ifNil: [ super name ] ifNotNil: [ :type | type name ])
				<< ' on ' << (self annotatedEntity ifNotNil: #name ifNil: [ 'undefined' ]) ]
]
