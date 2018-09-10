"
This is a class for the 'namespace()' type test or for '*' type tests when the principal node type of the axis is an namespace.
"
Class {
	#name : #XPathNamespaceTest,
	#superclass : #XPathNodeTest,
	#category : #'XPath-Core-Compilation'
}

{ #category : #testing }
XPathNamespaceTest >> isNamespaceNodeTest [
	^ true
]

{ #category : #evaluating }
XPathNamespaceTest >> value: aNode [
	^ aNode isNamespace
]
