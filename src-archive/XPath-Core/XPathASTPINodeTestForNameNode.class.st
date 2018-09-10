"
This is an AST node class for the 'processing-instruction(name)' type test.
"
Class {
	#name : #XPathASTPINodeTestForNameNode,
	#superclass : #XPathASTPINodeTestNode,
	#instVars : [
		'name'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTPINodeTestForNameNode class >> name: aName [
	^ self new name: aName
]

{ #category : #visiting }
XPathASTPINodeTestForNameNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitPINodeTestForName: self
]

{ #category : #testing }
XPathASTPINodeTestForNameNode >> isPINodeTestForName [
	^ true
]

{ #category : #accessing }
XPathASTPINodeTestForNameNode >> name [
	^ name ifNil: [name := '']
]

{ #category : #accessing }
XPathASTPINodeTestForNameNode >> name: aName [
	name := aName
]
