"
This is a class for the text (string) node type.
"
Class {
	#name : #XPathTextNodeType,
	#superclass : #XPathNodeType,
	#category : #'XPath-Core-Types'
}

{ #category : #testing }
XPathTextNodeType >> isTextNodeType [
	^ true
]

{ #category : #accessing }
XPathTextNodeType >> name [
	^ 'text'
]
