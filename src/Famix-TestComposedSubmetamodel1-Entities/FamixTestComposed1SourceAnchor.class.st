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

{ #category : #generator }
FamixTestComposed1SourceAnchor class >> generatedSlotNames [
	<generated>
	'FamixTestComposed1SourceAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposed1SourceAnchor class >> generatedTraitNames [
	<generated>
	^ #(FamixTSourceAnchor TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #meta }
FamixTestComposed1SourceAnchor class >> requirements [

	<generated>
	^ {  }
]
