Class {
	#name : #FAMIXJavaSourceLanguage,
	#superclass : #FAMIXSourceLanguage,
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXJavaSourceLanguage class >> annotation [

	<MSEClass: #JavaSourceLanguage super: #FAMIXSourceLanguage>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #testing }
FAMIXJavaSourceLanguage >> isJava [
	^ true
]
