Class {
	#name : #FamixStAnnotationInstance,
	#superclass : #FamixStSourcedEntity,
	#traits : 'FamixTAnnotationInstance + FamixTTypedAnnotationInstance + FamixTWithAnnotationInstanceAttributes + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTAnnotationInstance classTrait + FamixTTypedAnnotationInstance classTrait + FamixTWithAnnotationInstanceAttributes classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStAnnotationInstance class >> annotation [

	<MSEClass: #AnnotationInstance super: #FamixStSourcedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixStAnnotationInstance class >> generatedSlotNames [
	<generated>
	'FamixStAnnotationInstance class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixStAnnotationInstance class >> generatedTraitNames [
	<generated>
	^ #(FamixTAnnotationInstance FamixTTypedAnnotationInstance FamixTWithAnnotationInstanceAttributes TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #meta }
FamixStAnnotationInstance class >> requirements [

	<generated>
	^ { FamixStNamedEntity }
]

{ #category : #'as yet unclassified' }
FamixStAnnotationInstance class >> resetMooseQueryCaches [
	super resetMooseQueryCaches.
	self resetTEntityMetaLevelDependencyCaches.

]

{ #category : #accessing }
FamixStAnnotationInstance >> belongsTo [

	<generated>
	^ self annotatedEntity

]

{ #category : #accessing }
FamixStAnnotationInstance >> belongsTo: anObject [

	<generated>
	self annotatedEntity: anObject

]

{ #category : #accessing }
FamixStAnnotationInstance >> name [
	^ String
		streamContents: [ :stream | 
			stream << '@'
				<< (self annotationType ifNil: [ super name ] ifNotNil: [ :type | type name ])
				<< ' on ' << (self annotatedEntity ifNotNil: #name ifNil: [ 'undefined' ]) ]
]
