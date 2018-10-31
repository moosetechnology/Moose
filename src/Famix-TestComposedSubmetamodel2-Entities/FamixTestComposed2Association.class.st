Class {
	#name : #FamixTestComposed2Association,
	#superclass : #FamixTestComposed2SourcedEntity,
	#traits : 'FamixTAssociation + TAssociationMetaLevelDependency',
	#classTraits : 'FamixTAssociation classTrait + TAssociationMetaLevelDependency classTrait',
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed2Association class >> annotation [

	<MSEClass: #Association super: #FamixTestComposed2SourcedEntity>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposed2Association class >> generatedSlotNames [
	<generated>
	'FamixTestComposed2Association class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposed2Association class >> generatedTraitNames [
	<generated>
	^ #(FamixTAssociation TAssociationMetaLevelDependency)
]

{ #category : #meta }
FamixTestComposed2Association class >> requirements [

	<generated>
	^ {  }
]
