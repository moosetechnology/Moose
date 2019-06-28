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

{ #category : #meta }
FAMIXCSourceLanguage class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FAMIXCSourceLanguage >> isC [
	^ true
]
