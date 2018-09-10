"
This class stores additional settings and components relevant to the DOM parser and DOM nodes.
"
Class {
	#name : #XMLDOMConfiguration,
	#superclass : #XMLConfiguration,
	#instVars : [
		'preservesCDataNodes',
		'preservesCommentNodes',
		'preservesIgnorableWhitespace',
		'nodeFactory'
	],
	#category : #'XML-Parser'
}

{ #category : #accessing }
XMLDOMConfiguration >> attributeListClass [
	^ self nodeFactory attributeListClass
]

{ #category : #accessing }
XMLDOMConfiguration >> attributeListClass: aClass [
	self nodeFactory:
		(self nodeFactory asPluggableNodeFactory attributeListClass: aClass)
]

{ #category : #defaults }
XMLDOMConfiguration >> defaultNodeFactoryClass [
	^ XMLNodeFactory
]

{ #category : #defaults }
XMLDOMConfiguration >> defaultParserHandlerClass [
	^ XMLDOMParser
]

{ #category : #initialization }
XMLDOMConfiguration >> initialize [
	super initialize.

	"always used, so explicitly initialized"
	preservesCDataNodes := false.
	preservesCommentNodes := false.
	preservesIgnorableWhitespace := false.
	nodeFactory := self defaultNodeFactoryClass new.
]

{ #category : #accessing }
XMLDOMConfiguration >> isValidating: aBoolean [
	aBoolean
		ifFalse: [self preservesIgnorableWhitespace: false].
	super isValidating: aBoolean.
]

{ #category : #accessing }
XMLDOMConfiguration >> nodeFactory [
	^ nodeFactory
]

{ #category : #accessing }
XMLDOMConfiguration >> nodeFactory: aFactory [
	nodeFactory := aFactory
]

{ #category : #accessing }
XMLDOMConfiguration >> nodeListClass [
	^ self nodeFactory nodeListClass
]

{ #category : #accessing }
XMLDOMConfiguration >> nodeListClass: aClass [
	self nodeFactory:
		(self nodeFactory asPluggableNodeFactory nodeListClass: aClass)
]

{ #category : #copying }
XMLDOMConfiguration >> postCopy [
	super postCopy.

	nodeFactory := nodeFactory copy.
]

{ #category : #accessing }
XMLDOMConfiguration >> preservesCDataNodes [
	^ preservesCDataNodes
]

{ #category : #accessing }
XMLDOMConfiguration >> preservesCDataNodes: aBoolean [
	preservesCDataNodes := aBoolean
]

{ #category : #accessing }
XMLDOMConfiguration >> preservesCommentNodes [
	^ preservesCommentNodes
]

{ #category : #accessing }
XMLDOMConfiguration >> preservesCommentNodes: aBoolean [
	preservesCommentNodes := aBoolean
]

{ #category : #accessing }
XMLDOMConfiguration >> preservesIgnorableWhitespace [
	^ preservesIgnorableWhitespace
]

{ #category : #accessing }
XMLDOMConfiguration >> preservesIgnorableWhitespace: aBoolean [
	(preservesIgnorableWhitespace := aBoolean)
		ifTrue: [self isValidating: true]
]
