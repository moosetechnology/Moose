"
This is a class for the 'attribute()' type test or for the '*' type test when the principal node type of the axis is 'attribute'.
"
Class {
	#name : #XPathAttributeNodeTest,
	#superclass : #XPathNodeTest,
	#category : #'XPath-Core-Compilation'
}

{ #category : #testing }
XPathAttributeNodeTest >> isAttributeNodeTest [
	^ true
]

{ #category : #evaluating }
XPathAttributeNodeTest >> value: aNode [
	^ aNode isAttribute
]
