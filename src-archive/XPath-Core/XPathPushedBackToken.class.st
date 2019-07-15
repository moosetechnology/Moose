"
This is a class for storing pushed-back tokens so they can be quickly read again.
"
Class {
	#name : #XPathPushedBackToken,
	#superclass : #Object,
	#instVars : [
		'value',
		'position'
	],
	#category : #'XPath-Core-Streams'
}

{ #category : #'instance creation' }
XPathPushedBackToken class >> value: aValue position: aPosition [
	^ self new
		setValue: aValue
		position: aPosition
]

{ #category : #testing }
XPathPushedBackToken >> isNCNameToken [
	^ false
]

{ #category : #accessing }
XPathPushedBackToken >> position [
	^ position
]

{ #category : #initialization }
XPathPushedBackToken >> setValue: aValue position: aPosition [
	value := aValue.
	position := aPosition.
]

{ #category : #accessing }
XPathPushedBackToken >> value [
	^ value
]
