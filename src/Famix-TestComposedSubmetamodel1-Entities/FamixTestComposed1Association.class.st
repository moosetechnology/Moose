Class {
	#name : #FamixTestComposed1Association,
	#superclass : #FamixTestComposed1SourcedEntity,
	#traits : 'FamixTAssociation + TAssociationMetaLevelDependency',
	#classTraits : 'FamixTAssociation classTrait + TAssociationMetaLevelDependency classTrait',
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed1Association class >> annotation [

	<MSEClass: #Association super: #FamixTestComposed1SourcedEntity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposed1Association class >> generatedSlotNames [
	<generated>
	'FamixTestComposed1Association class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposed1Association class >> generatedTraitNames [
	<generated>
	^ #(FamixTAssociation TAssociationMetaLevelDependency)
]

{ #category : #meta }
FamixTestComposed1Association class >> requirements [

	<generated>
	^ {  }
]
