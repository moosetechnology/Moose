Class {
	#name : #FamixTest1Association,
	#superclass : #FamixTest1SourcedEntity,
	#traits : 'FamixTAssociation + TAssociationMetaLevelDependency',
	#classTraits : 'FamixTAssociation classTrait + TAssociationMetaLevelDependency classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1Association class >> annotation [

	<MSEClass: #Association super: #FamixTest1SourcedEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest1Association class >> generatedSlotNames [
	<generated>
	'FamixTest1Association class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest1Association class >> generatedTraitNames [
	<generated>
	^ #(FamixTAssociation TAssociationMetaLevelDependency)
]

{ #category : #meta }
FamixTest1Association class >> requirements [

	<generated>
	^ {  }
]
