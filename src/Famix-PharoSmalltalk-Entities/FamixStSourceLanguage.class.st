Class {
	#name : #FamixStSourceLanguage,
	#superclass : #FamixStEntity,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStSourceLanguage class >> annotation [

	<MSEClass: #SourceLanguage super: #FamixStEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixStSourceLanguage class >> generatedSlotNames [
	<generated>
	'FamixStSourceLanguage class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixStSourceLanguage class >> generatedTraitNames [
	<generated>
	^ #(FamixTSourceLanguage)
]

{ #category : #meta }
FamixStSourceLanguage class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FamixStSourceLanguage >> isSmalltalk [
	^ false
]

{ #category : #testing }
FamixStSourceLanguage >> name [

	<MSEProperty: #name type: #String> <derived>
	<MSEComment: 'The name of the language that is not modeled explicitly.'>
	
	^ 'Smalltalk'
]
