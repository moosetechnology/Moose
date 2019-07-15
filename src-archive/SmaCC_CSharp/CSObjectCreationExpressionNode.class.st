Class {
	#name : #CSObjectCreationExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'newToken',
		'type',
		'leftParenToken',
		'arguments',
		'commaTokens',
		'rightParenToken',
		'initializer'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSObjectCreationExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitObjectCreationExpression: self
]

{ #category : #generated }
CSObjectCreationExpressionNode >> arguments [
	^ arguments
]

{ #category : #generated }
CSObjectCreationExpressionNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
CSObjectCreationExpressionNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CSObjectCreationExpressionNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CSObjectCreationExpressionNode >> compositeNodeVariables [
	^ #(#arguments)
]

{ #category : #generated }
CSObjectCreationExpressionNode >> ignoredCompositeTokenVariables [
	^ #(#commaTokens #_leftParens #_rightParens)
]

{ #category : #'generated-initialize-release' }
CSObjectCreationExpressionNode >> initialize [
	super initialize.
	arguments := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CSObjectCreationExpressionNode >> initializer [
	^ initializer
]

{ #category : #generated }
CSObjectCreationExpressionNode >> initializer: aCSProgramNode [
	self initializer notNil
		ifTrue: [ self initializer parent: nil ].
	initializer := aCSProgramNode.
	self initializer notNil
		ifTrue: [ self initializer parent: self ]
]

{ #category : #generated }
CSObjectCreationExpressionNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSObjectCreationExpressionNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSObjectCreationExpressionNode >> newToken [
	^ newToken
]

{ #category : #generated }
CSObjectCreationExpressionNode >> newToken: aSmaCCToken [
	newToken := aSmaCCToken
]

{ #category : #generated }
CSObjectCreationExpressionNode >> nodeVariables [
	^ #(#type #initializer)
]

{ #category : #generated }
CSObjectCreationExpressionNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSObjectCreationExpressionNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSObjectCreationExpressionNode >> tokenVariables [
	^ #(#newToken #leftParenToken #rightParenToken)
]

{ #category : #generated }
CSObjectCreationExpressionNode >> type [
	^ type
]

{ #category : #generated }
CSObjectCreationExpressionNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
