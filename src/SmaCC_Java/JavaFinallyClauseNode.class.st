Class {
	#name : #JavaFinallyClauseNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'finallyToken',
		'block'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaFinallyClauseNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFinallyClause: self
]

{ #category : #generated }
JavaFinallyClauseNode >> block [
	^ block
]

{ #category : #generated }
JavaFinallyClauseNode >> block: aJavaBlockNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aJavaBlockNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
JavaFinallyClauseNode >> finallyToken [
	^ finallyToken
]

{ #category : #generated }
JavaFinallyClauseNode >> finallyToken: aSmaCCToken [
	finallyToken := aSmaCCToken
]

{ #category : #generated }
JavaFinallyClauseNode >> nodeVariables [
	^ #(#block)
]

{ #category : #generated }
JavaFinallyClauseNode >> tokenVariables [
	^ #(#finallyToken)
]
