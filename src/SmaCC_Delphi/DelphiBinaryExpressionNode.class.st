Class {
	#name : #DelphiBinaryExpressionNode,
	#superclass : #DelphiExpressionNode,
	#instVars : [
		'leftExpression',
		'operator',
		'rightExpression'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiBinaryExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBinaryExpression: self
]

{ #category : #generated }
DelphiBinaryExpressionNode >> leftExpression [
	^ leftExpression
]

{ #category : #generated }
DelphiBinaryExpressionNode >> leftExpression: aDelphiExpressionNode [
	self leftExpression notNil
		ifTrue: [ self leftExpression parent: nil ].
	leftExpression := aDelphiExpressionNode.
	self leftExpression notNil
		ifTrue: [ self leftExpression parent: self ]
]

{ #category : #generated }
DelphiBinaryExpressionNode >> nodeVariables [
	^ #(#leftExpression #rightExpression)
]

{ #category : #generated }
DelphiBinaryExpressionNode >> operator [
	^ operator
]

{ #category : #generated }
DelphiBinaryExpressionNode >> operator: aSmaCCToken [
	operator := aSmaCCToken
]

{ #category : #generated }
DelphiBinaryExpressionNode >> rightExpression [
	^ rightExpression
]

{ #category : #generated }
DelphiBinaryExpressionNode >> rightExpression: aDelphiExpressionNode [
	self rightExpression notNil
		ifTrue: [ self rightExpression parent: nil ].
	rightExpression := aDelphiExpressionNode.
	self rightExpression notNil
		ifTrue: [ self rightExpression parent: self ]
]

{ #category : #generated }
DelphiBinaryExpressionNode >> tokenVariables [
	^ #(#operator)
]
