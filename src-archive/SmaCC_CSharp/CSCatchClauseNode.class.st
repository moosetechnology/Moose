Class {
	#name : #CSCatchClauseNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'catchToken',
		'leftParenToken',
		'type',
		'name',
		'rightParenToken',
		'filter',
		'block'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSCatchClauseNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitCatchClause: self
]

{ #category : #generated }
CSCatchClauseNode >> block [
	^ block
]

{ #category : #generated }
CSCatchClauseNode >> block: aCSBlockStatementNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aCSBlockStatementNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
CSCatchClauseNode >> catchToken [
	^ catchToken
]

{ #category : #generated }
CSCatchClauseNode >> catchToken: aSmaCCToken [
	catchToken := aSmaCCToken
]

{ #category : #generated }
CSCatchClauseNode >> filter [
	^ filter
]

{ #category : #generated }
CSCatchClauseNode >> filter: aCSExceptionFilterNode [
	self filter notNil
		ifTrue: [ self filter parent: nil ].
	filter := aCSExceptionFilterNode.
	self filter notNil
		ifTrue: [ self filter parent: self ]
]

{ #category : #generated }
CSCatchClauseNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSCatchClauseNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSCatchClauseNode >> name [
	^ name
]

{ #category : #generated }
CSCatchClauseNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
CSCatchClauseNode >> nodeVariables [
	^ #(#type #filter #block)
]

{ #category : #generated }
CSCatchClauseNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSCatchClauseNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSCatchClauseNode >> tokenVariables [
	^ #(#catchToken #leftParenToken #name #rightParenToken)
]

{ #category : #generated }
CSCatchClauseNode >> type [
	^ type
]

{ #category : #generated }
CSCatchClauseNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
