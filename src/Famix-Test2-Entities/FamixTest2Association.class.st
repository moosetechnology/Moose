Class {
	#name : #FamixTest2Association,
	#superclass : #FamixTest2SourcedEntity,
	#traits : 'FamixTAssociation + TAssociationMetaLevelDependency',
	#classTraits : 'FamixTAssociation classTrait + TAssociationMetaLevelDependency classTrait',
	#category : #'Famix-Test2-Entities-Entities'
}

{ #category : #meta }
FamixTest2Association class >> annotation [

	<MSEClass: #Association super: #FamixTest2SourcedEntity>
	<package: #'Famix-Test2-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest2Association class >> generatedSlotNames [
	<generated>
	'FamixTest2Association class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest2Association class >> generatedTraitNames [
	<generated>
	^ #(FamixTAssociation TAssociationMetaLevelDependency)
]

{ #category : #meta }
FamixTest2Association class >> requirements [

	<generated>
	^ {  }
]
