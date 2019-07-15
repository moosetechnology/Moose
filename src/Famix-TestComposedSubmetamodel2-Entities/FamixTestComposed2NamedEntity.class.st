Class {
	#name : #FamixTestComposed2NamedEntity,
	#superclass : #FamixTestComposed2SourcedEntity,
	#traits : 'FamixTNamed + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamed classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed2NamedEntity class >> annotation [

	<MSEClass: #NamedEntity super: #FamixTestComposed2SourcedEntity>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposed2NamedEntity class >> generatedSlotNames [
	<generated>
	'FamixTestComposed2NamedEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposed2NamedEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTNamed TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #meta }
FamixTestComposed2NamedEntity class >> requirements [

	<generated>
	^ {  }
]
