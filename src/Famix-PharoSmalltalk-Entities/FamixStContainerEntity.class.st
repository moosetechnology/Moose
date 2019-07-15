Class {
	#name : #FamixStContainerEntity,
	#superclass : #FamixStNamedEntity,
	#traits : 'FamixTWithAnnotationTypes + FamixTWithClasses + FamixTWithTypes + TOODependencyQueries',
	#classTraits : 'FamixTWithAnnotationTypes classTrait + FamixTWithClasses classTrait + FamixTWithTypes classTrait + TOODependencyQueries classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStContainerEntity class >> annotation [

	<MSEClass: #ContainerEntity super: #FamixStNamedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixStContainerEntity class >> generatedSlotNames [
	<generated>
	'FamixStContainerEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixStContainerEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTWithAnnotationTypes FamixTWithClasses FamixTWithTypes TOODependencyQueries)
]

{ #category : #meta }
FamixStContainerEntity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FamixStContainerEntity >> numberOfChildren [
	<MSEProperty: #numberOfChildren type: #Number>
	<MSEComment: 'Number of direct children entities in the containment tree.'>
	<derived>
	
	^ self children size
]
