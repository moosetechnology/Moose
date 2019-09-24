Class {
	#name : #FamixTest3UnknownSourceLanguage,
	#superclass : #FamixTest3SourceLanguage,
	#traits : 'FamixTSourceLanguage + FamixTUnknownSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait + FamixTUnknownSourceLanguage classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3UnknownSourceLanguage class >> annotation [

	<MSEClass: #UnknownSourceLanguage super: #FamixTest3SourceLanguage>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]
