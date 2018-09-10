Class {
	#name : #FamixTest2SourceLanguage,
	#superclass : #FamixTest2Entity,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-Test2-Entities-Entities'
}

{ #category : #meta }
FamixTest2SourceLanguage class >> annotation [

	<MSEClass: #SourceLanguage super: #FamixTest2Entity>
	<package: #'Famix-Test2-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest2SourceLanguage class >> generatedSlotNames [
	<generated>
	'FamixTest2SourceLanguage class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest2SourceLanguage class >> generatedTraitNames [
	<generated>
	^ #(FamixTSourceLanguage)
]

{ #category : #meta }
FamixTest2SourceLanguage class >> requirements [

	<generated>
	^ {  }
]
