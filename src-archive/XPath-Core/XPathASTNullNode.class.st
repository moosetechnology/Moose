"
This class is used during parsing to separate the nested operator nodes belonging to one ""or"" expression from those belonging to another, and to function as a ""null"" object to simplify AST visiting and iteration.
"
Class {
	#name : #XPathASTNullNode,
	#superclass : #XPathASTNode,
	#classInstVars : [
		'instance'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #accessing }
XPathASTNullNode class >> instance [
	^ instance
		ifNil: [instance := self basicNew initialize]
]

{ #category : #'instance creation' }
XPathASTNullNode class >> new [
	^ self instance
]

{ #category : #testing }
XPathASTNullNode >> isNull [
	^ true
]

{ #category : #accessing }
XPathASTNullNode >> parent [
	^ parent ifNil: [parent := self]
]

{ #category : #accessing }
XPathASTNullNode >> parent: aNode [
]

{ #category : #accessing }
XPathASTNullNode >> type: aType [
]
