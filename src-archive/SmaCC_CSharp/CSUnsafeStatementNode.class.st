Class {
	#name : #CSUnsafeStatementNode,
	#superclass : #CSStatementNode,
	#instVars : [
		'unsafeToken',
		'block'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSUnsafeStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitUnsafeStatement: self
]

{ #category : #generated }
CSUnsafeStatementNode >> block [
	^ block
]

{ #category : #generated }
CSUnsafeStatementNode >> block: aCSBlockStatementNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aCSBlockStatementNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
CSUnsafeStatementNode >> nodeVariables [
	^ #(#block)
]

{ #category : #generated }
CSUnsafeStatementNode >> tokenVariables [
	^ #(#unsafeToken)
]

{ #category : #generated }
CSUnsafeStatementNode >> unsafeToken [
	^ unsafeToken
]

{ #category : #generated }
CSUnsafeStatementNode >> unsafeToken: aSmaCCToken [
	unsafeToken := aSmaCCToken
]
