Class {
	#name : #FamixTest3NamedEntity,
	#superclass : #FamixTest3SourcedEntity,
	#traits : 'FamixTNamed + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamed classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3NamedEntity class >> annotation [

	<MSEClass: #NamedEntity super: #FamixTest3SourcedEntity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest3NamedEntity class >> generatedSlotNames [
	<generated>
	'FamixTest3NamedEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest3NamedEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTNamed TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #meta }
FamixTest3NamedEntity class >> requirements [

	<generated>
	^ {  }
]
