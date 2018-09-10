"
A base class for XPath exceptions.
"
Class {
	#name : #XPathException,
	#superclass : #XMLException,
	#instVars : [
		'position'
	],
	#category : #'XPath-Core-Exceptions'
}

{ #category : #testing }
XPathException >> hasPosition [
	^ position notNil
]

{ #category : #accessing }
XPathException >> messageText [
	^ self hasPosition
		ifTrue: [super messageText, ' (near pos. ', self position asString, ')']
		ifFalse: [super messageText]
]

{ #category : #accessing }
XPathException >> position [
	^ position
]

{ #category : #accessing }
XPathException >> position: anInteger [
	position := anInteger
]
