Class {
	#name : #FamixTest3Association,
	#superclass : #FamixTest3SourcedEntity,
	#traits : 'FamixTAssociation + TAssociationMetaLevelDependency',
	#classTraits : 'FamixTAssociation classTrait + TAssociationMetaLevelDependency classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Association class >> annotation [

	<MSEClass: #Association super: #FamixTest3SourcedEntity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest3Association class >> generatedSlotNames [
	<generated>
	'FamixTest3Association class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest3Association class >> generatedTraitNames [
	<generated>
	^ #(FamixTAssociation TAssociationMetaLevelDependency)
]

{ #category : #meta }
FamixTest3Association class >> requirements [

	<generated>
	^ {  }
]
