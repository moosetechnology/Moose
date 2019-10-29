Class {
	#name : #FamixStContainerEntity,
	#superclass : #FamixStNamedEntity,
	#traits : 'FamixTWithAnnotationTypes + FamixTWithClasses + FamixTWithTypes + TOODependencyQueries',
	#classTraits : 'FamixTWithAnnotationTypes classTrait + FamixTWithClasses classTrait + FamixTWithTypes classTrait + TOODependencyQueries classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStContainerEntity class >> annotation [

	<FMClass: #ContainerEntity super: #FamixStNamedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #metrics }
FamixStContainerEntity >> fanOut [
	<FMProperty: #fanOut type: #Number>
	<derived>
	<FMComment: 'Number of provider classes'>
	^ self lookUpPropertyNamed: #fanOut computedAs: [ (self allProvidersAtScope: FamixTType) size ]
]
