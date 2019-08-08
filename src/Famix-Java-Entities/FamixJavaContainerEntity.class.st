Class {
	#name : #FamixJavaContainerEntity,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixTWithAnnotationTypes + FamixTWithClasses + FamixTWithTypes + TOODependencyQueries',
	#classTraits : 'FamixTWithAnnotationTypes classTrait + FamixTWithClasses classTrait + FamixTWithTypes classTrait + TOODependencyQueries classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaContainerEntity class >> annotation [

	<MSEClass: #ContainerEntity super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
FamixJavaContainerEntity >> addClass: aClass [
	
	types add: aClass
]

{ #category : #'as yet unclassified' }
FamixJavaContainerEntity >> mooseNameWithDots [
	^ self mooseName ifNotNil: [ '.' join: (self mooseName substrings: '::') ]
]
