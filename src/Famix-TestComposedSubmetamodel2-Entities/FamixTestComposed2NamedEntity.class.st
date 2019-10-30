Class {
	#name : #FamixTestComposed2NamedEntity,
	#superclass : #FamixTestComposed2SourcedEntity,
	#traits : 'FamixTNamed + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamed classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed2NamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FamixTestComposed2SourcedEntity>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	^self
]
