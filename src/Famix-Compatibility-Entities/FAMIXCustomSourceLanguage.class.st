Class {
	#name : #FAMIXCustomSourceLanguage,
	#superclass : #FAMIXSourceLanguage,
	#traits : 'FamixTNamed',
	#classTraits : 'FamixTNamed classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXCustomSourceLanguage class >> annotation [

	<MSEClass: #CustomSourceLanguage super: #FAMIXSourceLanguage>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXCustomSourceLanguage class >> generatedSlotNames [
	<generated>
	'FAMIXCustomSourceLanguage class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXCustomSourceLanguage class >> generatedTraitNames [
	<generated>
	^ #(FamixTNamed)
]

{ #category : #meta }
FAMIXCustomSourceLanguage class >> requirements [

	<generated>
	^ {  }
]
