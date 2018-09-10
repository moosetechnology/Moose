"
A pushed-back non-qualified name token, to be read by nextNCName.
"
Class {
	#name : #XPathPushedBackNCNameToken,
	#superclass : #XPathPushedBackToken,
	#category : #'XPath-Core-Streams'
}

{ #category : #testing }
XPathPushedBackNCNameToken >> isNCNameToken [
	^ true
]
