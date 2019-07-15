"
FAMIXCustomSourceLanguage represents any source language that is not supported by default in moose. So, the CustomSourceLanguage is simply a possibility to specify
some language from an outside parser without for which there are no specific tools defined. Actually, it just represents the name of the language with a string.






"
Class {
	#name : #FAMIXCustomSourceLanguage,
	#superclass : #FAMIXSourceLanguage,
	#instVars : [
		'name'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXCustomSourceLanguage class >> annotation [
	<MSEClass: #CustomSourceLanguage super: #FAMIXSourceLanguage>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXCustomSourceLanguage >> name [
	<MSEProperty: #name type: #String>
	<MSEComment: 'The name of a custom language that is not modeled explicitly.'>
	
	^name
]

{ #category : #accessing }
FAMIXCustomSourceLanguage >> name: aString [
	name := aString
]
