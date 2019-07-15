"
FAMIXJavaSourceLanguage represents the Java programming language in which an entity is written.
"
Class {
	#name : #FAMIXJavaSourceLanguage,
	#superclass : #FAMIXSourceLanguage,
	#category : #'Famix-Java'
}

{ #category : #meta }
FAMIXJavaSourceLanguage class >> annotation [
	<MSEClass: #JavaSourceLanguage super: #FAMIXSourceLanguage>
	<package: #FAMIX>
]

{ #category : #testing }
FAMIXJavaSourceLanguage >> isJava [
	^ true
]
