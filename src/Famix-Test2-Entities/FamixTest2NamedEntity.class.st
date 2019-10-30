Class {
	#name : #FamixTest2NamedEntity,
	#superclass : #FamixTest2SourcedEntity,
	#traits : 'FamixTNamed + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamed classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Test2-Entities-Entities'
}

{ #category : #meta }
FamixTest2NamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FamixTest2SourcedEntity>
	<package: #'Famix-Test2-Entities'>
	<generated>
	^self
]
