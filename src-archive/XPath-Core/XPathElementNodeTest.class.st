"
This is a class for the 'element()' type test or for '*' type tests when the principal node type of the axis is an element.
"
Class {
	#name : #XPathElementNodeTest,
	#superclass : #XPathNodeTest,
	#category : #'XPath-Core-Compilation'
}

{ #category : #testing }
XPathElementNodeTest >> isElementNodeTest [
	^ true
]

{ #category : #evaluating }
XPathElementNodeTest >> value: aNode [
	^ aNode isElement
]
