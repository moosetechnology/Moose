"
This is an AST node class for the 'namespace(name)' type test or for the 'name' type test when the principal node type of the axis is 'namespace'.
"
Class {
	#name : #XPathASTNamespaceTestForNameNode,
	#superclass : #XPathASTNamespaceTestNode,
	#instVars : [
		'name'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTNamespaceTestForNameNode class >> name: aName [
	^ self new name: aName
]

{ #category : #visiting }
XPathASTNamespaceTestForNameNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitNamespaceNodeTestForName: self
]

{ #category : #testing }
XPathASTNamespaceTestForNameNode >> isNamespaceNodeTestForName [
	^ true
]

{ #category : #accessing }
XPathASTNamespaceTestForNameNode >> name [
	^ name ifNil: [name := '']
]

{ #category : #accessing }
XPathASTNamespaceTestForNameNode >> name: aName [
	name := aName
]
