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

{ #category : #'moosequery-queries-generic' }
FamixTestComposed1SourceAnchor >> throughAllFrom [
	"Query all the incoming associations of the receiver and its children.

	Example:
		aFAMIXClass queryAllIncoming.
			--> Will return a MooseIncomingQueryResult containing the FAMIXAssociation having aFAMIXClass or its children as target
	"

	^ (MooseQueryCalculator strategy: MooseQueryIncomingDirectionStrategy) throughAllFor: self
]
