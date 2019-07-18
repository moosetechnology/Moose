Class {
	#name : #FamixTestComposed1NamedEntity,
	#superclass : #FamixTestComposed1SourcedEntity,
	#traits : 'FamixTNamed + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamed classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #'as yet unclassified' }
FamixTestComposed1NamedEntity class >> annotation [

	<MSEClass: #NamedEntity super: #FamixTestComposed1SourcedEntity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTestComposed1NamedEntity class >> requirements [

	<generated>
	^ {  }
]
