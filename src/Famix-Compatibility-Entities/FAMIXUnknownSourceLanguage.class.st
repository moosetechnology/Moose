Class {
	#name : #FAMIXUnknownSourceLanguage,
	#superclass : #FAMIXSourceLanguage,
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXUnknownSourceLanguage class >> annotation [

	<MSEClass: #UnknownSourceLanguage super: #FAMIXSourceLanguage>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXUnknownSourceLanguage class >> generatedSlotNames [
	<generated>
	'FAMIXUnknownSourceLanguage class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXUnknownSourceLanguage class >> generatedTraitNames [
	<generated>
	^ #()
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
