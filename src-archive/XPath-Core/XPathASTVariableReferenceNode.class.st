"
This is an AST node class for variable references. Variables are bound to values at runtime using XPathContext objects.
"
Class {
	#name : #XPathASTVariableReferenceNode,
	#superclass : #XPathASTNode,
	#instVars : [
		'name'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTVariableReferenceNode class >> name: aName [
	^ self new name: aName
]

{ #category : #visiting }
XPathASTVariableReferenceNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitVariableReference: self
]

{ #category : #testing }
XPathASTVariableReferenceNode >> isVariableReference [
	^ true
]

{ #category : #accessing }
XPathASTVariableReferenceNode >> name [
	^ name ifNil: [name := '']
]

{ #category : #accessing }
XPathASTVariableReferenceNode >> name: aVariableName [
	name := aVariableName
]
