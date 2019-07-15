"
This is a class for the attribute node type.
"
Class {
	#name : #XPathAttributeNodeType,
	#superclass : #XPathNodeType,
	#category : #'XPath-Core-Types'
}

{ #category : #testing }
XPathAttributeNodeType >> isAttributeNodeType [
	^ true
]

{ #category : #accessing }
XPathAttributeNodeType >> name [
	^ 'attribute'
]
