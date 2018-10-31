Class {
	#name : #FamixTestComposed2SourceLanguage,
	#superclass : #FamixTestComposed2Entity,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed2SourceLanguage class >> annotation [

	<MSEClass: #SourceLanguage super: #FamixTestComposed2Entity>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposed2SourceLanguage class >> generatedSlotNames [
	<generated>
	'FamixTestComposed2SourceLanguage class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposed2SourceLanguage class >> generatedTraitNames [
	<generated>
	^ #(FamixTSourceLanguage)
]

{ #category : #meta }
FamixTestComposed2SourceLanguage class >> requirements [

	<generated>
	^ {  }
]
