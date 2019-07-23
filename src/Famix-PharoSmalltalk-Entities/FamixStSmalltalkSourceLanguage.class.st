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

{ #category : #testing }
FamixStSmalltalkSourceLanguage >> isSmalltalk [
	^ true
]
