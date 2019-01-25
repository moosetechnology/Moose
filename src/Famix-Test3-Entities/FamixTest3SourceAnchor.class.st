Class {
	#name : #FamixTest3SourceAnchor,
	#superclass : #FamixTest3Entity,
	#traits : 'FamixTSourceAnchor + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTSourceAnchor classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3SourceAnchor class >> annotation [

	<MSEClass: #SourceAnchor super: #FamixTest3Entity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest3SourceAnchor class >> generatedSlotNames [
	<generated>
	'FamixTest3SourceAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest3SourceAnchor class >> generatedTraitNames [
	<generated>
	^ #(FamixTSourceAnchor TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #meta }
FamixTest3SourceAnchor class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'moosequery-queries-generic' }
FamixTest3SourceAnchor >> throughAllFrom [
	"Query all the incoming associations of the receiver and its children.

	Example:
		aFAMIXClass queryAllIncoming.
			--> Will return a MooseIncomingQueryResult containing the FAMIXAssociation having aFAMIXClass or its children as target
	"

	^ (MooseQueryCalculator strategy: MooseQueryIncomingDirectionStrategy) throughAllFor: self
]
