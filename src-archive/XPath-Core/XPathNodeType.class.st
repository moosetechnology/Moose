"
This is a base class for node types.
"
Class {
	#name : #XPathNodeType,
	#superclass : #XPathType,
	#category : #'XPath-Core-Types'
}

{ #category : #testing }
XPathNodeType >> isAttributeNodeType [
	^ false
]

{ #category : #testing }
XPathNodeType >> isCommentNodeType [
	^ false
]

{ #category : #testing }
XPathNodeType >> isElementNodeType [
	^ false
]

{ #category : #testing }
XPathNodeType >> isNamespaceNodeType [
	^ false
]

{ #category : #testing }
XPathNodeType >> isPINodeType [
	^ false
]

{ #category : #testing }
XPathNodeType >> isTextNodeType [
	^ false
]

{ #category : #accessing }
XPathNodeType >> name [
	^ 'node'
]
