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
