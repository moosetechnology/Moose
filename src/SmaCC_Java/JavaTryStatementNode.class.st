Class {
	#name : #JavaTryStatementNode,
	#superclass : #JavaStatementNode,
	#instVars : [
		'tryToken',
		'leftParen',
		'resources',
		'semicolons',
		'rightParen',
		'block',
		'catches',
		'finally'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaTryStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitTryStatement: self
]

{ #category : #generated }
JavaTryStatementNode >> block [
	^ block
]

{ #category : #generated }
JavaTryStatementNode >> block: aJavaBlockNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aJavaBlockNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
JavaTryStatementNode >> catches [
	^ catches
]

{ #category : #generated }
JavaTryStatementNode >> catches: anOrderedCollection [
	self setParents: self catches to: nil.
	catches := anOrderedCollection.
	self setParents: self catches to: self
]

{ #category : #generated }
JavaTryStatementNode >> compositeNodeVariables [
	^ #(#resources #catches)
]

{ #category : #generated }
JavaTryStatementNode >> finally [
	^ finally
]

{ #category : #generated }
JavaTryStatementNode >> finally: aJavaFinallyClauseNode [
	self finally notNil
		ifTrue: [ self finally parent: nil ].
	finally := aJavaFinallyClauseNode.
	self finally notNil
		ifTrue: [ self finally parent: self ]
]

{ #category : #generated }
JavaTryStatementNode >> ignoredCompositeTokenVariables [
	^ #(#semicolons)
]

{ #category : #generated }
JavaTryStatementNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen)
]

{ #category : #'generated-initialize-release' }
JavaTryStatementNode >> initialize [
	super initialize.
	resources := OrderedCollection new: 2.
	semicolons := OrderedCollection new: 2.
	catches := OrderedCollection new: 2.
]

{ #category : #generated }
JavaTryStatementNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JavaTryStatementNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JavaTryStatementNode >> nodeVariables [
	^ #(#block #finally)
]

{ #category : #generated }
JavaTryStatementNode >> resources [
	^ resources
]

{ #category : #generated }
JavaTryStatementNode >> resources: anOrderedCollection [
	self setParents: self resources to: nil.
	resources := anOrderedCollection.
	self setParents: self resources to: self
]

{ #category : #generated }
JavaTryStatementNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JavaTryStatementNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JavaTryStatementNode >> semicolons [
	^ semicolons
]

{ #category : #generated }
JavaTryStatementNode >> semicolons: anOrderedCollection [
	semicolons := anOrderedCollection
]

{ #category : #generated }
JavaTryStatementNode >> tokenVariables [
	^ #(#tryToken)
]

{ #category : #generated }
JavaTryStatementNode >> tryToken [
	^ tryToken
]

{ #category : #generated }
JavaTryStatementNode >> tryToken: aSmaCCToken [
	tryToken := aSmaCCToken
]
