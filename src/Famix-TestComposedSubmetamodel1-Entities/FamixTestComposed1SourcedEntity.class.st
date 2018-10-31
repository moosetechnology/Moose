Class {
	#name : #FamixTestComposed1SourcedEntity,
	#superclass : #FamixTestComposed1Entity,
	#traits : 'FamixTWithComments + FamixTWithSourceAnchor + FamixTWithSourceLanguage',
	#classTraits : 'FamixTWithComments classTrait + FamixTWithSourceAnchor classTrait + FamixTWithSourceLanguage classTrait',
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed1SourcedEntity class >> annotation [

	<MSEClass: #SourcedEntity super: #FamixTestComposed1Entity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposed1SourcedEntity class >> generatedSlotNames [
	<generated>
	'FamixTestComposed1SourcedEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposed1SourcedEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTWithComments FamixTWithSourceAnchor FamixTWithSourceLanguage)
]

{ #category : #meta }
FamixTestComposed1SourcedEntity class >> requirements [

	<generated>
	^ {  }
]
