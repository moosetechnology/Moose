Class {
	#name : #FamixTest1UnknownSourceLanguage,
	#superclass : #FamixTest1SourceLanguage,
	#traits : 'FamixTSourceLanguage + FamixTUnknownSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait + FamixTUnknownSourceLanguage classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1UnknownSourceLanguage class >> annotation [

	<MSEClass: #UnknownSourceLanguage super: #FamixTest1SourceLanguage>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]
