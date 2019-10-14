Class {
	#name : #FamixJavaUnknownSourceLanguage,
	#superclass : #FamixJavaSourceLanguage,
	#traits : 'FamixTUnknownSourceLanguage',
	#classTraits : 'FamixTUnknownSourceLanguage classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaUnknownSourceLanguage class >> annotation [

	<MSEClass: #UnknownSourceLanguage super: #FamixJavaSourceLanguage>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #'accessing' }
FamixJavaUnknownSourceLanguage >> name [
	
	<MSEProperty: #name type: #String> 
	<derived>
	<MSEComment: 'The name of the language'>
	
	^ 'Unknown'
]
