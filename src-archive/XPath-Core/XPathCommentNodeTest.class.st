"
This is a class for the 'comment()' type test.
"
Class {
	#name : #XPathCommentNodeTest,
	#superclass : #XPathNodeTest,
	#category : #'XPath-Core-Compilation'
}

{ #category : #testing }
XPathCommentNodeTest >> isCommentNodeTest [
	^ true
]

{ #category : #evaluating }
XPathCommentNodeTest >> value: aNode [
	^ aNode isComment
]
