Class {
	#name : #FamixTest3SourceLanguage,
	#superclass : #FamixTest3Entity,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3SourceLanguage class >> annotation [

	<MSEClass: #SourceLanguage super: #FamixTest3Entity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest3SourceLanguage class >> generatedSlotNames [
	<generated>
	'FamixTest3SourceLanguage class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest3SourceLanguage class >> generatedTraitNames [
	<generated>
	^ #(FamixTSourceLanguage)
]

{ #category : #meta }
FamixTest3SourceLanguage class >> requirements [

	<generated>
	^ {  }
]
