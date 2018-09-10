Class {
	#name : #FamixTest1SourceAnchor,
	#superclass : #FamixTest1Entity,
	#traits : 'FamixTSourceAnchor + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTSourceAnchor classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1SourceAnchor class >> annotation [

	<MSEClass: #SourceAnchor super: #FamixTest1Entity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest1SourceAnchor class >> generatedSlotNames [
	<generated>
	'FamixTest1SourceAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest1SourceAnchor class >> generatedTraitNames [
	<generated>
	^ #(FamixTSourceAnchor TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #meta }
FamixTest1SourceAnchor class >> requirements [

	<generated>
	^ {  }
]
