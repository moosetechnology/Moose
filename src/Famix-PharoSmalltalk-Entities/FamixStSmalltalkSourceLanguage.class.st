Class {
	#name : #FamixStSmalltalkSourceLanguage,
	#superclass : #FamixStSourceLanguage,
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStSmalltalkSourceLanguage class >> annotation [

	<MSEClass: #SmalltalkSourceLanguage super: #FamixStSourceLanguage>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixStSmalltalkSourceLanguage class >> generatedSlotNames [
	<generated>
	'FamixStSmalltalkSourceLanguage class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixStSmalltalkSourceLanguage class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixStSmalltalkSourceLanguage class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FamixStSmalltalkSourceLanguage >> isSmalltalk [
	^ true
]
