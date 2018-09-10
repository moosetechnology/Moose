"
This is a node test created from a BlockClosure.
"
Class {
	#name : #XPathBlockNodeTest,
	#superclass : #XPathNodeTest,
	#instVars : [
		'block'
	],
	#category : #'XPath-Core-Compilation'
}

{ #category : #'instance creation' }
XPathBlockNodeTest class >> block: aBlock [
	^ self new block: aBlock
]

{ #category : #accessing }
XPathBlockNodeTest >> block [
	^ block
]

{ #category : #accessing }
XPathBlockNodeTest >> block: aBlock [
	block := aBlock
]

{ #category : #evaluating }
XPathBlockNodeTest >> value: aNode [
	^ block value: aNode
]
