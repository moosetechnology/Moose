"
This is a class for the namespace node type.
"
Class {
	#name : #XPathNamespaceNodeType,
	#superclass : #XPathNodeType,
	#category : #'XPath-Core-Types'
}

{ #category : #testing }
XPathNamespaceNodeType >> isNamespaceNodeType [
	^ true
]

{ #category : #accessing }
XPathNamespaceNodeType >> name [
	^ 'namespace'
]
