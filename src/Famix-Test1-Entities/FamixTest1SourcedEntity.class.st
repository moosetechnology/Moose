Class {
	#name : #FamixTest1SourcedEntity,
	#superclass : #FamixTest1Entity,
	#traits : 'FamixTWithComments + FamixTWithFiles + FamixTWithSourceAnchor + FamixTWithSourceLanguage',
	#classTraits : 'FamixTWithComments classTrait + FamixTWithFiles classTrait + FamixTWithSourceAnchor classTrait + FamixTWithSourceLanguage classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1SourcedEntity class >> annotation [

	<MSEClass: #SourcedEntity super: #FamixTest1Entity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest1SourcedEntity class >> generatedSlotNames [
	<generated>
	'FamixTest1SourcedEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest1SourcedEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTWithComments FamixTWithFiles FamixTWithSourceAnchor FamixTWithSourceLanguage)
]

{ #category : #meta }
FamixTest1SourcedEntity class >> requirements [

	<generated>
	^ {  }
]
