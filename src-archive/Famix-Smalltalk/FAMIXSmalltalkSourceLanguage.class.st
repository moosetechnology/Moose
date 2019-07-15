"
FAMIXSmalltalkSourceLanguage represents the Smalltalk language.
"
Class {
	#name : #FAMIXSmalltalkSourceLanguage,
	#superclass : #FAMIXSourceLanguage,
	#category : #'Famix-Smalltalk'
}

{ #category : #meta }
FAMIXSmalltalkSourceLanguage class >> annotation [
	<MSEClass: #SmalltalkSourceLanguage super: #FAMIXSourceLanguage>
	<package: #FAMIX>
]

{ #category : #testing }
FAMIXSmalltalkSourceLanguage >> isSmalltalk [
	^ true
]
