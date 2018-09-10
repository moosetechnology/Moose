Class {
	#name : #FamixTest1NamedEntity,
	#superclass : #FamixTest1SourcedEntity,
	#traits : 'FamixTNamed + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamed classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1NamedEntity class >> annotation [

	<MSEClass: #NamedEntity super: #FamixTest1SourcedEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest1NamedEntity class >> generatedSlotNames [
	<generated>
	'FamixTest1NamedEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest1NamedEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTNamed TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #meta }
FamixTest1NamedEntity class >> requirements [

	<generated>
	^ {  }
]
