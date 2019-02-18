Class {
	#name : #JavaIfElseStatementNode,
	#superclass : #JavaIfStatementNode,
	#instVars : [
		'elseToken',
		'falseStatement'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaIfElseStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitIfElseStatement: self
]

{ #category : #generated }
JavaIfElseStatementNode >> elseToken [
	^ elseToken
]

{ #category : #generated }
JavaIfElseStatementNode >> elseToken: aSmaCCToken [
	elseToken := aSmaCCToken
]

{ #category : #generated }
JavaIfElseStatementNode >> falseStatement [
	^ falseStatement
]

{ #category : #generated }
JavaIfElseStatementNode >> falseStatement: aJavaStatementNode [
	self falseStatement notNil
		ifTrue: [ self falseStatement parent: nil ].
	falseStatement := aJavaStatementNode.
	self falseStatement notNil
		ifTrue: [ self falseStatement parent: self ]
]

{ #category : #generated }
JavaIfElseStatementNode >> nodeVariables [
	^ #(#falseStatement #expression #trueStatement)
]

{ #category : #generated }
JavaIfElseStatementNode >> tokenVariables [
	^ #(#elseToken #ifToken)
]
