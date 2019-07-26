Class {
	#name : #FAMIXUnknownSourceLanguage,
	#superclass : #FAMIXEntity,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXUnknownSourceLanguage class >> annotation [

	<MSEClass: #UnknownSourceLanguage super: #FAMIXEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #meta }
FAMIXUnknownSourceLanguage class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FAMIXUnknownSourceLanguage >> isUnknown [ 
	^ true
]
