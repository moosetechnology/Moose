"
FAMIXUnknownSourceLanguage represents source language that has not been specified by the user.

The difference with CustomSourceLanguage is that people can export from outside a CustomSourceLanguage with a string representing the language, while the UnknownSourceLanguage is provided by default (null object pattern).



"
Class {
	#name : #FAMIXUnknownSourceLanguage,
	#superclass : #FAMIXSourceLanguage,
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXUnknownSourceLanguage class >> annotation [
	<MSEClass: #UnknownSourceLanguage super: #FAMIXSourceLanguage>
	<package: #FAMIX>
]

{ #category : #testing }
FAMIXUnknownSourceLanguage >> isUnknown [ 
	^ true
]
