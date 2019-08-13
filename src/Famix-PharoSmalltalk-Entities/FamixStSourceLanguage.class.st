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

{ #category : #testing }
FamixStSourceLanguage >> isSmalltalk [
	^ true
]

{ #category : #testing }
FamixStSourceLanguage >> name [

	<MSEProperty: #name type: #String> <derived>
	<MSEComment: 'The name of the language that is not modeled explicitly.'>
	
	^ 'Smalltalk'
]
