Class {
	#name : #JavaForEachStatementNode,
	#superclass : #JavaStatementNode,
	#instVars : [
		'forToken',
		'leftParen',
		'modifiers',
		'type',
		'name',
		'colon',
		'expression',
		'rightParen',
		'statement'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaForEachStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitForEachStatement: self
]

{ #category : #generated }
JavaForEachStatementNode >> colon [
	^ colon
]

{ #category : #generated }
JavaForEachStatementNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
JavaForEachStatementNode >> compositeNodeVariables [
	^ #(#modifiers)
]

{ #category : #generated }
JavaForEachStatementNode >> expression [
	^ expression
]

{ #category : #generated }
JavaForEachStatementNode >> expression: aJavaExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJavaExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JavaForEachStatementNode >> forToken [
	^ forToken
]

{ #category : #generated }
JavaForEachStatementNode >> forToken: aSmaCCToken [
	forToken := aSmaCCToken
]

{ #category : #generated }
JavaForEachStatementNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen)
]

{ #category : #'generated-initialize-release' }
JavaForEachStatementNode >> initialize [
	super initialize.
	modifiers := OrderedCollection new: 2.
]

{ #category : #generated }
JavaForEachStatementNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JavaForEachStatementNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JavaForEachStatementNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
JavaForEachStatementNode >> modifiers: anOrderedCollection [
	self setParents: self modifiers to: nil.
	modifiers := anOrderedCollection.
	self setParents: self modifiers to: self
]

{ #category : #generated }
JavaForEachStatementNode >> name [
	^ name
]

{ #category : #generated }
JavaForEachStatementNode >> name: aJavaProgramNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aJavaProgramNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
JavaForEachStatementNode >> nodeVariables [
	^ #(#type #name #expression #statement)
]

{ #category : #generated }
JavaForEachStatementNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JavaForEachStatementNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JavaForEachStatementNode >> statement [
	^ statement
]

{ #category : #generated }
JavaForEachStatementNode >> statement: aJavaStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aJavaStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
JavaForEachStatementNode >> tokenVariables [
	^ #(#forToken #colon)
]

{ #category : #generated }
JavaForEachStatementNode >> type [
	^ type
]

{ #category : #generated }
JavaForEachStatementNode >> type: aJavaTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aJavaTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
