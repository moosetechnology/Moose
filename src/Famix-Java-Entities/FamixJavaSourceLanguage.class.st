Class {
	#name : #FamixJavaSourceLanguage,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaSourceLanguage class >> annotation [

	<MSEClass: #SourceLanguage super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaSourceLanguage class >> generatedSlotNames [
	<generated>
	'FamixJavaSourceLanguage class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaSourceLanguage class >> generatedTraitNames [
	<generated>
	^ #(FamixTSourceLanguage)
]

{ #category : #meta }
FamixJavaSourceLanguage class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
FamixJavaSourceLanguage >> isC [ 
	^ false
]

{ #category : #'as yet unclassified' }
FamixJavaSourceLanguage >> isJava [
	^ true
]

{ #category : #'as yet unclassified' }
FamixJavaSourceLanguage >> isSmalltalk [
	 ^ false
]

{ #category : #'as yet unclassified' }
FamixJavaSourceLanguage >> isUnknown [ 
	^ false
]

{ #category : #'as yet unclassified' }
FamixJavaSourceLanguage >> name [
	
	<MSEProperty: #name type: #String> 
	<derived>
	<MSEComment: 'The name of the language'>
	
	^ 'Java'
]
