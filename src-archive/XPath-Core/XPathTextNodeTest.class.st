"
This is a class for the 'text()' type test.
"
Class {
	#name : #XPathTextNodeTest,
	#superclass : #XPathNodeTest,
	#category : #'XPath-Core-Compilation'
}

{ #category : #testing }
XPathTextNodeTest >> isTextNodeTest [
	^ true
]

{ #category : #evaluating }
XPathTextNodeTest >> value: aNode [
	^ aNode isStringNode
]
