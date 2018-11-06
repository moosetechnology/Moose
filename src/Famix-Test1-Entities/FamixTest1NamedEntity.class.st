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

{ #category : #'as yet unclassified' }
FamixTest1NamedEntity class >> dependencyFM3PropertyDescription [
	"TODO: Clean"

	^ self allDeclaredProperties
		select: [ :e | e hasOpposite and: [ e opposite isSource or: [ e opposite isTarget ] ] ]
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

{ #category : #'as yet unclassified' }
FamixTest1NamedEntity class >> outgoingAssociationTypes [
	"Here we add a cache because this is heavely used in MooseQuery for the navigations."
	"TODO: Clean"

	^ outgoingAssociationTypes
		ifNil: [ outgoingAssociationTypes := self privateOutgoingAssociationTypes ]
]

{ #category : #'as yet unclassified' }
FamixTest1NamedEntity class >> parentTypes [
	"TODO: Clean"

	^ self privateParentTypes 
]

{ #category : #meta }
FamixTest1NamedEntity class >> requirements [

	<generated>
	^ {  }
]
