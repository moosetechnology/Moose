"
This is a class for the 'node()' type test for any node.
"
Class {
	#name : #XPathAnyNodeTest,
	#superclass : #XPathNodeTest,
	#category : #'XPath-Core-Compilation'
}

{ #category : #testing }
XPathAnyNodeTest >> isAnyNodeTest [
	^ true
]

{ #category : #evaluating }
XPathAnyNodeTest >> value: aNode [
	^ true
]
