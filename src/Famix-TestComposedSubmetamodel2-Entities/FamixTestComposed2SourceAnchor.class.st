Class {
	#name : #FamixTestComposed2SourceAnchor,
	#superclass : #FamixTestComposed2Entity,
	#traits : 'FamixTSourceAnchor + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTSourceAnchor classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed2SourceAnchor class >> annotation [

	<MSEClass: #SourceAnchor super: #FamixTestComposed2Entity>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposed2SourceAnchor class >> generatedSlotNames [
	<generated>
	'FamixTestComposed2SourceAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposed2SourceAnchor class >> generatedTraitNames [
	<generated>
	^ #(FamixTSourceAnchor TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #meta }
FamixTestComposed2SourceAnchor class >> requirements [

	<generated>
	^ {  }
]
