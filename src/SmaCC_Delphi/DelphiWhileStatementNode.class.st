Class {
	#name : #DelphiWhileStatementNode,
	#superclass : #DelphiStatementNode,
	#instVars : [
		'whileToken',
		'expression',
		'doToken',
		'statement'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiWhileStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitWhileStatement: self
]

{ #category : #generated }
DelphiWhileStatementNode >> doToken [
	^ doToken
]

{ #category : #generated }
DelphiWhileStatementNode >> doToken: aSmaCCToken [
	doToken := aSmaCCToken
]

{ #category : #generated }
DelphiWhileStatementNode >> expression [
	^ expression
]

{ #category : #generated }
DelphiWhileStatementNode >> expression: aDelphiExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aDelphiExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
DelphiWhileStatementNode >> nodeVariables [
	^ #(#expression #statement)
]

{ #category : #generated }
DelphiWhileStatementNode >> statement [
	^ statement
]

{ #category : #generated }
DelphiWhileStatementNode >> statement: aDelphiStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aDelphiStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
DelphiWhileStatementNode >> tokenVariables [
	^ #(#whileToken #doToken)
]

{ #category : #generated }
DelphiWhileStatementNode >> whileToken [
	^ whileToken
]

{ #category : #generated }
DelphiWhileStatementNode >> whileToken: aSmaCCToken [
	whileToken := aSmaCCToken
]
