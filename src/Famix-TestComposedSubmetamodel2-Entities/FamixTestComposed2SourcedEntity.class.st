Class {
	#name : #FamixTestComposed2SourcedEntity,
	#superclass : #FamixTestComposed2Entity,
	#traits : 'FamixTWithComments + FamixTWithSourceAnchor + FamixTWithSourceLanguage',
	#classTraits : 'FamixTWithComments classTrait + FamixTWithSourceAnchor classTrait + FamixTWithSourceLanguage classTrait',
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed2SourcedEntity class >> annotation [

	<MSEClass: #SourcedEntity super: #FamixTestComposed2Entity>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposed2SourcedEntity class >> generatedSlotNames [
	<generated>
	'FamixTestComposed2SourcedEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposed2SourcedEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTWithComments FamixTWithSourceAnchor FamixTWithSourceLanguage)
]

{ #category : #meta }
FamixTestComposed2SourcedEntity class >> requirements [

	<generated>
	^ {  }
]
