Class {
	#name : #CSFinallyClauseNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'finallyToken',
		'block'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSFinallyClauseNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFinallyClause: self
]

{ #category : #generated }
CSFinallyClauseNode >> block [
	^ block
]

{ #category : #generated }
CSFinallyClauseNode >> block: aCSBlockStatementNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aCSBlockStatementNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
CSFinallyClauseNode >> finallyToken [
	^ finallyToken
]

{ #category : #generated }
CSFinallyClauseNode >> finallyToken: aSmaCCToken [
	finallyToken := aSmaCCToken
]

{ #category : #generated }
CSFinallyClauseNode >> nodeVariables [
	^ #(#block)
]

{ #category : #generated }
CSFinallyClauseNode >> tokenVariables [
	^ #(#finallyToken)
]
