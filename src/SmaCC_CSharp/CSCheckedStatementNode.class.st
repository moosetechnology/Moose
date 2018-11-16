Class {
	#name : #CSCheckedStatementNode,
	#superclass : #CSStatementNode,
	#instVars : [
		'checkedToken',
		'block'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSCheckedStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitCheckedStatement: self
]

{ #category : #generated }
CSCheckedStatementNode >> block [
	^ block
]

{ #category : #generated }
CSCheckedStatementNode >> block: aCSBlockStatementNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aCSBlockStatementNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
CSCheckedStatementNode >> checkedToken [
	^ checkedToken
]

{ #category : #generated }
CSCheckedStatementNode >> checkedToken: aSmaCCToken [
	checkedToken := aSmaCCToken
]

{ #category : #generated }
CSCheckedStatementNode >> nodeVariables [
	^ #(#block)
]

{ #category : #generated }
CSCheckedStatementNode >> tokenVariables [
	^ #(#checkedToken)
]
