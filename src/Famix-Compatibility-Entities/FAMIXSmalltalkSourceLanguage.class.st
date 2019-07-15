Class {
	#name : #FAMIXSmalltalkSourceLanguage,
	#superclass : #FAMIXSourceLanguage,
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXSmalltalkSourceLanguage class >> annotation [

	<MSEClass: #SmalltalkSourceLanguage super: #FAMIXSourceLanguage>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXSmalltalkSourceLanguage class >> generatedSlotNames [
	<generated>
	'FAMIXSmalltalkSourceLanguage class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXSmalltalkSourceLanguage class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FAMIXSmalltalkSourceLanguage class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FAMIXSmalltalkSourceLanguage >> isSmalltalk [
	^ true
]
