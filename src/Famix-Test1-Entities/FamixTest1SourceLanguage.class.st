Class {
	#name : #FamixTest1SourceLanguage,
	#superclass : #FamixTest1Entity,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1SourceLanguage class >> annotation [

	<MSEClass: #SourceLanguage super: #FamixTest1Entity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest1SourceLanguage class >> generatedSlotNames [
	<generated>
	'FamixTest1SourceLanguage class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest1SourceLanguage class >> generatedTraitNames [
	<generated>
	^ #(FamixTSourceLanguage)
]

{ #category : #meta }
FamixTest1SourceLanguage class >> requirements [

	<generated>
	^ {  }
]
