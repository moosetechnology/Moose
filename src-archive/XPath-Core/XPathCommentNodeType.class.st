"
This is a class for the comment node type.
"
Class {
	#name : #XPathCommentNodeType,
	#superclass : #XPathNodeType,
	#category : #'XPath-Core-Types'
}

{ #category : #testing }
XPathCommentNodeType >> isCommentNodeType [
	^ true
]

{ #category : #accessing }
XPathCommentNodeType >> name [
	^ 'comment'
]
