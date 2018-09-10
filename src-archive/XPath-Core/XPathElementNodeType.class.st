"
This is a class for the element node type.
"
Class {
	#name : #XPathElementNodeType,
	#superclass : #XPathNodeType,
	#category : #'XPath-Core-Types'
}

{ #category : #testing }
XPathElementNodeType >> isElementNodeType [
	^ true
]

{ #category : #accessing }
XPathElementNodeType >> name [
	^ 'element'
]
