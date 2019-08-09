Class {
	#name : #FAMIXUnknownSourceLanguage,
	#superclass : #FAMIXSourceLanguage,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXUnknownSourceLanguage class >> annotation [

	<MSEClass: #UnknownSourceLanguage super: #FAMIXSourceLanguage>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #testing }
FAMIXUnknownSourceLanguage >> isUnknown [ 
	^ true
]
