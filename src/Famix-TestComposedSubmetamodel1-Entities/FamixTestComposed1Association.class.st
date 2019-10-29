Class {
	#name : #FamixTestComposed1Association,
	#superclass : #FamixTestComposed1SourcedEntity,
	#traits : 'FamixTAssociation + TAssociationMetaLevelDependency',
	#classTraits : 'FamixTAssociation classTrait + TAssociationMetaLevelDependency classTrait',
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed1Association class >> annotation [

	<FMClass: #Association super: #FamixTestComposed1SourcedEntity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^self
]
