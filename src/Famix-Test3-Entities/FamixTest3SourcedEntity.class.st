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

{ #category : #generator }
FamixTest3SourcedEntity class >> generatedSlotNames [
	<generated>
	'FamixTest3SourcedEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest3SourcedEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTWithComments FamixTWithSourceAnchor FamixTWithSourceLanguage)
]

{ #category : #meta }
FamixTest3SourcedEntity class >> requirements [

	<generated>
	^ {  }
]
