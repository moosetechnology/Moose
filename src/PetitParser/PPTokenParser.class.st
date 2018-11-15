"
A parser that answers a token with the value of my delegate parses.

Instance Variables:
	tokenClass	<PPToken class>	The token sub-class to be used.
"
Class {
	#name : #PPTokenParser,
	#superclass : #PPFlattenParser,
	#instVars : [
		'tokenClass'
	],
	#category : #'PetitParser-Parsers'
}

{ #category : #private }
PPTokenParser >> defaultTokenClass [
	^ PPToken
]

{ #category : #initialization }
PPTokenParser >> initialize [
	tokenClass := self defaultTokenClass
	
]

{ #category : #private }
PPTokenParser >> on: aCollection start: aStartInteger stop: aStopInteger value: anObject [
	^ self tokenClass on: aCollection start: aStartInteger stop: aStopInteger value: anObject
]

{ #category : #accessing }
PPTokenParser >> tokenClass [
	^ tokenClass
]

{ #category : #accessing }
PPTokenParser >> tokenClass: aTokenClass [
	tokenClass := aTokenClass
]
