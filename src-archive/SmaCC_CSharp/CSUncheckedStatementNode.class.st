Class {
	#name : #CSUncheckedStatementNode,
	#superclass : #CSStatementNode,
	#instVars : [
		'uncheckedToken',
		'block'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSUncheckedStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitUncheckedStatement: self
]

{ #category : #generated }
CSUncheckedStatementNode >> block [
	^ block
]

{ #category : #generated }
CSUncheckedStatementNode >> block: aCSBlockStatementNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aCSBlockStatementNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
CSUncheckedStatementNode >> nodeVariables [
	^ #(#block)
]

{ #category : #generated }
CSUncheckedStatementNode >> tokenVariables [
	^ #(#uncheckedToken)
]

{ #category : #generated }
CSUncheckedStatementNode >> uncheckedToken [
	^ uncheckedToken
]

{ #category : #generated }
CSUncheckedStatementNode >> uncheckedToken: aSmaCCToken [
	uncheckedToken := aSmaCCToken
]
