Class {
	#name : #FAMIXCSourceLanguage,
	#superclass : #FAMIXSourceLanguage,
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXCSourceLanguage class >> annotation [

	<MSEClass: #CSourceLanguage super: #FAMIXSourceLanguage>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXCSourceLanguage class >> generatedSlotNames [
	<generated>
	'FAMIXCSourceLanguage class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXCSourceLanguage class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FAMIXCSourceLanguage class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FAMIXCSourceLanguage >> isC [
	^ true
]
