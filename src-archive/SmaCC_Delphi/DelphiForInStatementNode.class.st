Class {
	#name : #DelphiForInStatementNode,
	#superclass : #DelphiStatementNode,
	#instVars : [
		'forToken',
		'variable',
		'inToken',
		'fromExpr',
		'doToken',
		'statement'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiForInStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitForInStatement: self
]

{ #category : #generated }
DelphiForInStatementNode >> doToken [
	^ doToken
]

{ #category : #generated }
DelphiForInStatementNode >> doToken: aSmaCCToken [
	doToken := aSmaCCToken
]

{ #category : #generated }
DelphiForInStatementNode >> forToken [
	^ forToken
]

{ #category : #generated }
DelphiForInStatementNode >> forToken: aSmaCCToken [
	forToken := aSmaCCToken
]

{ #category : #generated }
DelphiForInStatementNode >> fromExpr [
	^ fromExpr
]

{ #category : #generated }
DelphiForInStatementNode >> fromExpr: aDelphiExpressionNode [
	self fromExpr notNil
		ifTrue: [ self fromExpr parent: nil ].
	fromExpr := aDelphiExpressionNode.
	self fromExpr notNil
		ifTrue: [ self fromExpr parent: self ]
]

{ #category : #generated }
DelphiForInStatementNode >> inToken [
	^ inToken
]

{ #category : #generated }
DelphiForInStatementNode >> inToken: aSmaCCToken [
	inToken := aSmaCCToken
]

{ #category : #generated }
DelphiForInStatementNode >> nodeVariables [
	^ #(#variable #fromExpr #statement)
]

{ #category : #generated }
DelphiForInStatementNode >> statement [
	^ statement
]

{ #category : #generated }
DelphiForInStatementNode >> statement: aDelphiStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aDelphiStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
DelphiForInStatementNode >> tokenVariables [
	^ #(#forToken #inToken #doToken)
]

{ #category : #generated }
DelphiForInStatementNode >> variable [
	^ variable
]

{ #category : #generated }
DelphiForInStatementNode >> variable: aDelphiVariableExpressionNode [
	self variable notNil
		ifTrue: [ self variable parent: nil ].
	variable := aDelphiVariableExpressionNode.
	self variable notNil
		ifTrue: [ self variable parent: self ]
]
