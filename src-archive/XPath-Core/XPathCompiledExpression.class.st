"
This class stores the compiled XPath expression's three-argument (the context node, the XPathContext object, and node test array) BlockClosure and its array of XPathNodeTest objects.
"
Class {
	#name : #XPathCompiledExpression,
	#superclass : #Object,
	#instVars : [
		'block',
		'nodeTests'
	],
	#category : #'XPath-Core-Compilation'
}

{ #category : #'instance creation' }
XPathCompiledExpression class >> block: aBlock nodeTests: aNodeTestCollection [
	^ self new
		setBlock: aBlock
		nodeTests: aNodeTestCollection
]

{ #category : #accessing }
XPathCompiledExpression >> block [
	^ block
]

{ #category : #evaluating }
XPathCompiledExpression >> evaluateInNode: aNode withContext: aContext [
	^ self block
		value: aNode
		value: aContext
		value: self nodeTests
]

{ #category : #accessing }
XPathCompiledExpression >> nodeTests [
	^ nodeTests
]

{ #category : #printing }
XPathCompiledExpression >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		print: self block;
		nextPut: $).
]

{ #category : #initialization }
XPathCompiledExpression >> setBlock: aBlock nodeTests: aNodeTestCollection [
	block := aBlock.
	nodeTests := aNodeTestCollection asArray.
]
