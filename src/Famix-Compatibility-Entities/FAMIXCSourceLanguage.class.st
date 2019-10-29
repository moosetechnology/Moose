Class {
	#name : #FAMIXCSourceLanguage,
	#superclass : #FAMIXSourceLanguage,
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXCSourceLanguage class >> annotation [

	<FMClass: #CSourceLanguage super: #FAMIXSourceLanguage>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #testing }
FAMIXCSourceLanguage >> isC [
	^ true
]
