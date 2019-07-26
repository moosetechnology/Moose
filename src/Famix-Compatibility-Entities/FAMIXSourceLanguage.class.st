Class {
	#name : #FAMIXSourceLanguage,
	#superclass : #FAMIXEntity,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXSourceLanguage class >> annotation [

	<MSEClass: #SourceLanguage super: #FAMIXEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'Famix-C' }
FAMIXSourceLanguage >> isC [ 
	^ false
]

{ #category : #'Famix-Java' }
FAMIXSourceLanguage >> isJava [
	^ false
]

{ #category : #'Famix-Smalltalk' }
FAMIXSourceLanguage >> isSmalltalk [
	 ^ false
]

{ #category : #testing }
FAMIXSourceLanguage >> isUnknown [ 
	^ false
]

{ #category : #accessing }
FAMIXSourceLanguage >> name [
	"The name of the language that is not modeled explicitly"
	
	<MSEProperty: #name type: #String> <derived>
	<MSEComment: 'The name of the language that is not modeled explicitly.'>
	
	^ (self class name removePrefix: 'FAMIX') removeSuffix: 'SourceLanguage'
]
