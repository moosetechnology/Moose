"
This is an AST node class for function calls. Instances have a function name and zero or more argument AST nodes.
"
Class {
	#name : #XPathASTFunctionCallNode,
	#superclass : #XPathASTNode,
	#instVars : [
		'name',
		'arguments'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTFunctionCallNode class >> name: aName [
	^ self new name: aName
]

{ #category : #visiting }
XPathASTFunctionCallNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitFunctionCall: self
]

{ #category : #adding }
XPathASTFunctionCallNode >> addArgument: aNode [
	^ self arguments addLast: aNode
]

{ #category : #accessing }
XPathASTFunctionCallNode >> arguments [
	^ arguments ifNil: [arguments := OrderedCollection new]
]

{ #category : #accessing }
XPathASTFunctionCallNode >> arguments: aCollection [
	arguments := aCollection asOrderedCollection
]

{ #category : #enumerating }
XPathASTFunctionCallNode >> argumentsDo: aBlock [
	self arguments do: aBlock
]

{ #category : #testing }
XPathASTFunctionCallNode >> hasArguments [
	^ arguments notNil
		and: [arguments notEmpty]
]

{ #category : #testing }
XPathASTFunctionCallNode >> isFalseFunctionCall [
	^ self name = 'false'
]

{ #category : #testing }
XPathASTFunctionCallNode >> isFunctionCall [
	^ true
]

{ #category : #testing }
XPathASTFunctionCallNode >> isLastFunctionCall [
	^ self name = 'last'
]

{ #category : #testing }
XPathASTFunctionCallNode >> isPositionFunctionCall [
	^ self name = 'position'
]

{ #category : #testing }
XPathASTFunctionCallNode >> isTrueFunctionCall [
	^ self name = 'true'
]

{ #category : #accessing }
XPathASTFunctionCallNode >> name [
	^ name ifNil: [name := '']
]

{ #category : #accessing }
XPathASTFunctionCallNode >> name: aFunctionName [
	name := aFunctionName
]

{ #category : #removing }
XPathASTFunctionCallNode >> removeArgument: aNode [
	^ self arguments remove: aNode
]

{ #category : #accessing }
XPathASTFunctionCallNode >> totalArguments [
	^ arguments
		ifNil: [0]
		ifNotNil: [arguments size]
]
