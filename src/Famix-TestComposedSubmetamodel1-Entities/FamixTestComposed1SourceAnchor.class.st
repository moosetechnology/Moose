Class {
	#name : #FamixTestComposed1SourceAnchor,
	#superclass : #FamixTestComposed1Entity,
	#traits : 'FamixTSourceAnchor + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTSourceAnchor classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed1SourceAnchor class >> annotation [

	<MSEClass: #SourceAnchor super: #FamixTestComposed1Entity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^self
]
