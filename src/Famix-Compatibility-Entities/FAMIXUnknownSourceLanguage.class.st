Class {
	#name : #FAMIXUnknownSourceLanguage,
	#superclass : #FAMIXSourceLanguage,
	#traits : 'FamixTSourceLanguage + FamixTUnknownSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait + FamixTUnknownSourceLanguage classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXUnknownSourceLanguage class >> annotation [

	<MSEClass: #UnknownSourceLanguage super: #FAMIXSourceLanguage>
	<package: #FAMIX>
	<generated>
	^self
]
