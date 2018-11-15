"
Abstract literal parser that parses some kind of literal type (to be specified by subclasses).

Instance Variables:
	literal	<Object>	The literal object to be parsed.
	message	<String>	The error message to be generated.


"
Class {
	#name : #PPLiteralParser,
	#superclass : #PPParser,
	#instVars : [
		'literal',
		'message'
	],
	#category : #'PetitParser-Parsers'
}

{ #category : #'instance creation' }
PPLiteralParser class >> on: anObject [
	^ self on: anObject message: anObject printString , ' expected'
]

{ #category : #'instance creation' }
PPLiteralParser class >> on: anObject message: aString [
	^ self new initializeOn: anObject message: aString
]

{ #category : #operators }
PPLiteralParser >> caseInsensitive [
	"Answer a parser that can parse the receiver case-insensitive."
	
	self subclassResponsibility
]

{ #category : #initialization }
PPLiteralParser >> initializeOn: anObject message: aString [
	literal := anObject.
	message := aString
]

{ #category : #accessing }
PPLiteralParser >> literal [
	"Answer the parsed literal."

	^ literal
]

{ #category : #accessing }
PPLiteralParser >> message [
	"Answer the failure message."
	
	^ message
]

{ #category : #printing }
PPLiteralParser >> printNameOn: aStream [
	super printNameOn: aStream.
	aStream nextPutAll: ', '; print: literal
]
