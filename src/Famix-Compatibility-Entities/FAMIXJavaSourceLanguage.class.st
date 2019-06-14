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

{ #category : #generator }
FAMIXJavaSourceLanguage class >> generatedSlotNames [
	<generated>
	'FAMIXJavaSourceLanguage class>>#generatedSlotNames'.
	^ #()
]

{ #category : #meta }
FAMIXJavaSourceLanguage class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FAMIXJavaSourceLanguage >> isJava [
	^ true
]
