Class {
	#name : #FamixTest3SourcedEntity,
	#superclass : #FamixTest3Entity,
	#traits : 'FamixTWithComments + FamixTWithSourceAnchor + FamixTWithSourceLanguage',
	#classTraits : 'FamixTWithComments classTrait + FamixTWithSourceAnchor classTrait + FamixTWithSourceLanguage classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3SourcedEntity class >> annotation [

	<MSEClass: #SourcedEntity super: #FamixTest3Entity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]
