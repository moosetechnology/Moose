Class {
	#name : #FamixJavaSourceLanguage,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaSourceLanguage class >> annotation [

	<FMClass: #SourceLanguage super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
FamixJavaSourceLanguage >> isC [ 
	^ false
]

{ #category : #'*Famix-Java-Entities' }
FamixJavaSourceLanguage >> isJava [
	^ true
]

{ #category : #'as yet unclassified' }
FamixJavaSourceLanguage >> name [
	
	<FMProperty: #name type: #String> 
	<derived>
	<FMComment: 'The name of the language'>
	
	^ 'Java'
]
