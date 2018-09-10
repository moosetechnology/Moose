Class {
	#name : #DelphiForStatementNode,
	#superclass : #DelphiStatementNode,
	#instVars : [
		'forToken',
		'variable',
		'assignmentToken',
		'fromExpr',
		'toToken',
		'toExpr',
		'doToken',
		'statement'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiForStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitForStatement: self
]

{ #category : #generated }
DelphiForStatementNode >> assignmentToken [
	^ assignmentToken
]

{ #category : #generated }
DelphiForStatementNode >> assignmentToken: aSmaCCToken [
	assignmentToken := aSmaCCToken
]

{ #category : #generated }
DelphiForStatementNode >> doToken [
	^ doToken
]

{ #category : #generated }
DelphiForStatementNode >> doToken: aSmaCCToken [
	doToken := aSmaCCToken
]

{ #category : #generated }
DelphiForStatementNode >> forToken [
	^ forToken
]

{ #category : #generated }
DelphiForStatementNode >> forToken: aSmaCCToken [
	forToken := aSmaCCToken
]

{ #category : #generated }
DelphiForStatementNode >> fromExpr [
	^ fromExpr
]

{ #category : #generated }
DelphiForStatementNode >> fromExpr: aDelphiExpressionNode [
	self fromExpr notNil
		ifTrue: [ self fromExpr parent: nil ].
	fromExpr := aDelphiExpressionNode.
	self fromExpr notNil
		ifTrue: [ self fromExpr parent: self ]
]

{ #category : #generated }
DelphiForStatementNode >> nodeVariables [
	^ #(#variable #fromExpr #toExpr #statement)
]

{ #category : #generated }
DelphiForStatementNode >> statement [
	^ statement
]

{ #category : #generated }
DelphiForStatementNode >> statement: aDelphiStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aDelphiStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
DelphiForStatementNode >> toExpr [
	^ toExpr
]

{ #category : #generated }
DelphiForStatementNode >> toExpr: aDelphiExpressionNode [
	self toExpr notNil
		ifTrue: [ self toExpr parent: nil ].
	toExpr := aDelphiExpressionNode.
	self toExpr notNil
		ifTrue: [ self toExpr parent: self ]
]

{ #category : #generated }
DelphiForStatementNode >> toToken [
	^ toToken
]

{ #category : #generated }
DelphiForStatementNode >> toToken: aSmaCCToken [
	toToken := aSmaCCToken
]

{ #category : #generated }
DelphiForStatementNode >> tokenVariables [
	^ #(#forToken #assignmentToken #toToken #doToken)
]

{ #category : #generated }
DelphiForStatementNode >> variable [
	^ variable
]

{ #category : #generated }
DelphiForStatementNode >> variable: aDelphiVariableExpressionNode [
	self variable notNil
		ifTrue: [ self variable parent: nil ].
	variable := aDelphiVariableExpressionNode.
	self variable notNil
		ifTrue: [ self variable parent: self ]
]
