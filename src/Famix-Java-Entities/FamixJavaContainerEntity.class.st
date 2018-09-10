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

{ #category : #generator }
FamixJavaContainerEntity class >> generatedSlotNames [
	<generated>
	'FamixJavaContainerEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaContainerEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTWithAnnotationTypes FamixTWithClasses FamixTWithTypes TOODependencyQueries)
]

{ #category : #meta }
FamixJavaContainerEntity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
FamixJavaContainerEntity >> accept: aVisitor [

	aVisitor visitContainerEntity: self
]

{ #category : #'as yet unclassified' }
FamixJavaContainerEntity >> addClass: aClass [
	
	types add: aClass
]

{ #category : #'as yet unclassified' }
FamixJavaContainerEntity >> copyFrom: anEntity within: aVisitor [

	super copyFrom: anEntity within: aVisitor.
	anEntity types do: [:t|
		self addType: (aVisitor visit: t) ].

	
]

{ #category : #testing }
FamixJavaContainerEntity >> isContainerEntity [

	<generated>
	^ true
]

{ #category : #'as yet unclassified' }
FamixJavaContainerEntity >> mooseNameWithDots [
	^ self mooseName ifNotNil: [ '.' join: (self mooseName substrings: '::') ]
]

{ #category : #'as yet unclassified' }
FamixJavaContainerEntity >> numberOfChildren [
	<MSEProperty: #numberOfChildren type: #Number>
	<MSEComment: 'Number of direct children entities in the containment tree.'>
	<derived>
	
	^ self children size
]
