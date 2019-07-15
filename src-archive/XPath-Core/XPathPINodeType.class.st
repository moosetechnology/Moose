"
This is a class for the PI node type.
"
Class {
	#name : #XPathPINodeType,
	#superclass : #XPathNodeType,
	#category : #'XPath-Core-Types'
}

{ #category : #testing }
XPathPINodeType >> isPINodeType [
	^ true
]

{ #category : #accessing }
XPathPINodeType >> name [
	^ 'processing-instruction'
]
