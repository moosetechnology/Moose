"
FAMIXCSourceLanguage represents the C language.
"
Class {
	#name : #FAMIXCSourceLanguage,
	#superclass : #FAMIXSourceLanguage,
	#category : #'Famix-C'
}

{ #category : #meta }
FAMIXCSourceLanguage class >> annotation [
	<MSEClass: #CSourceLanguage super: #FAMIXSourceLanguage>
	<package: #FAMIX>
]

{ #category : #testing }
FAMIXCSourceLanguage >> isC [
	^ true
]
