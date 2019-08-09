Class {
	#name : #FamixJavaUnknownSourceLanguage,
	#superclass : #FamixJavaSourceLanguage,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaUnknownSourceLanguage class >> annotation [

	<MSEClass: #UnknownSourceLanguage super: #FamixJavaSourceLanguage>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
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
