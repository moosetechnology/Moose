Class {
	#name : #DelphiIfStatementNode,
	#superclass : #DelphiStatementNode,
	#instVars : [
		'ifToken',
		'expression',
		'thenToken',
		'thenStatement',
		'elseToken',
		'elseStatement'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiIfStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitIfStatement: self
]

{ #category : #generated }
DelphiIfStatementNode >> elseStatement [
	^ elseStatement
]

{ #category : #generated }
DelphiIfStatementNode >> elseStatement: aDelphiStatementNode [
	self elseStatement notNil
		ifTrue: [ self elseStatement parent: nil ].
	elseStatement := aDelphiStatementNode.
	self elseStatement notNil
		ifTrue: [ self elseStatement parent: self ]
]

{ #category : #generated }
DelphiIfStatementNode >> elseToken [
	^ elseToken
]

{ #category : #generated }
DelphiIfStatementNode >> elseToken: aSmaCCToken [
	elseToken := aSmaCCToken
]

{ #category : #generated }
DelphiIfStatementNode >> expression [
	^ expression
]

{ #category : #generated }
DelphiIfStatementNode >> expression: aDelphiExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aDelphiExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
DelphiIfStatementNode >> ifToken [
	^ ifToken
]

{ #category : #generated }
DelphiIfStatementNode >> ifToken: aSmaCCToken [
	ifToken := aSmaCCToken
]

{ #category : #generated }
DelphiIfStatementNode >> nodeVariables [
	^ #(#expression #thenStatement #elseStatement)
]

{ #category : #generated }
DelphiIfStatementNode >> thenStatement [
	^ thenStatement
]

{ #category : #generated }
DelphiIfStatementNode >> thenStatement: aDelphiStatementNode [
	self thenStatement notNil
		ifTrue: [ self thenStatement parent: nil ].
	thenStatement := aDelphiStatementNode.
	self thenStatement notNil
		ifTrue: [ self thenStatement parent: self ]
]

{ #category : #generated }
DelphiIfStatementNode >> thenToken [
	^ thenToken
]

{ #category : #generated }
DelphiIfStatementNode >> thenToken: aSmaCCToken [
	thenToken := aSmaCCToken
]

{ #category : #generated }
DelphiIfStatementNode >> tokenVariables [
	^ #(#ifToken #thenToken #elseToken)
]
