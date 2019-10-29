Class {
	#name : #FamixTest1Association,
	#superclass : #FamixTest1SourcedEntity,
	#traits : 'FamixTAssociation + TAssociationMetaLevelDependency',
	#classTraits : 'FamixTAssociation classTrait + TAssociationMetaLevelDependency classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1Association class >> annotation [

	<FMClass: #Association super: #FamixTest1SourcedEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]
