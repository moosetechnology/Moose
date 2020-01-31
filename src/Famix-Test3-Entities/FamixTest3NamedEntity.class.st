Class {
	#name : #FamixTest3NamedEntity,
	#superclass : #FamixTest3SourcedEntity,
	#traits : 'FamixTNamedEntity + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamedEntity classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3NamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FamixTest3SourcedEntity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]
