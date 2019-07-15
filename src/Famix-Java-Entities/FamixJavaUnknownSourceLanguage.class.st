Class {
	#name : #FamixJavaUnknownSourceLanguage,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaUnknownSourceLanguage class >> annotation [

	<MSEClass: #UnknownSourceLanguage super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaUnknownSourceLanguage class >> generatedSlotNames [
	<generated>
	'FamixJavaUnknownSourceLanguage class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaUnknownSourceLanguage class >> generatedTraitNames [
	<generated>
	^ #(FamixTSourceLanguage)
]

{ #category : #meta }
FamixJavaUnknownSourceLanguage class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
FamixJavaUnknownSourceLanguage >> isUnknown [ 
	^ true
]

{ #category : #'as yet unclassified' }
FamixJavaUnknownSourceLanguage >> name [
	
	<MSEProperty: #name type: #String> 
	<derived>
	<MSEComment: 'The name of the language'>
	
	^ 'Unknown'
]
