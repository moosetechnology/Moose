"
This class can be used to control the iteration of node collections during AST traversal. It wraps a ReadStream and supports #next and #peek (both return nil when #atEnd), and #atEnd, and access to the previous node visited that did not have a nil/null return value.
"
Class {
	#name : #XPathASTNodeVisitorIterator,
	#superclass : #Object,
	#instVars : [
		'stream',
		'previousVisited'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTNodeVisitorIterator class >> null [
	^ self on: #()
]

{ #category : #'instance creation' }
XPathASTNodeVisitorIterator class >> on: aCollection [
	^ self new on: aCollection
]

{ #category : #accessing }
XPathASTNodeVisitorIterator >> atEnd [
	^ stream atEnd
]

{ #category : #accessing }
XPathASTNodeVisitorIterator >> next [
	^ stream atEnd
		ifTrue: [XPathASTNullNode new]
		ifFalse: [stream next]
]

{ #category : #initialization }
XPathASTNodeVisitorIterator >> on: aCollection [
	stream := aCollection readStream
]

{ #category : #accessing }
XPathASTNodeVisitorIterator >> peek [
	^ stream atEnd
		ifTrue: [XPathASTNullNode new]
		ifFalse: [stream peek]
]

{ #category : #accessing }
XPathASTNodeVisitorIterator >> previousVisited [
	^ previousVisited ifNil: [previousVisited := XPathASTNullNode new]
]

{ #category : #visiting }
XPathASTNodeVisitorIterator >> visitNextWith: aNodeVisitor [
	(self next acceptNodeVisitor: aNodeVisitor)
		ifNil: [^ XPathASTNullNode new]
		ifNotNil: [:node |
			node isNull
				ifFalse: [previousVisited := node].
			^ node]
]
