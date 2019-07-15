"
This is a class for the 'processing-instruction()' type test.
"
Class {
	#name : #XPathPINodeTest,
	#superclass : #XPathNodeTest,
	#category : #'XPath-Core-Compilation'
}

{ #category : #testing }
XPathPINodeTest >> isPINodeTest [
	^ true
]

{ #category : #evaluating }
XPathPINodeTest >> value: aNode [
	^ aNode isPI
]
