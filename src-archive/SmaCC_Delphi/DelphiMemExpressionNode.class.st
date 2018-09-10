Class {
	#name : #DelphiMemExpressionNode,
	#superclass : #DelphiExpressionNode,
	#instVars : [
		'mem',
		'leftBrace',
		'baseExpression',
		'colon',
		'addressExpression',
		'rightBrace'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiMemExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMemExpression: self
]

{ #category : #generated }
DelphiMemExpressionNode >> addressExpression [
	^ addressExpression
]

{ #category : #generated }
DelphiMemExpressionNode >> addressExpression: aDelphiExpressionNode [
	self addressExpression notNil
		ifTrue: [ self addressExpression parent: nil ].
	addressExpression := aDelphiExpressionNode.
	self addressExpression notNil
		ifTrue: [ self addressExpression parent: self ]
]

{ #category : #generated }
DelphiMemExpressionNode >> baseExpression [
	^ baseExpression
]

{ #category : #generated }
DelphiMemExpressionNode >> baseExpression: aDelphiExpressionNode [
	self baseExpression notNil
		ifTrue: [ self baseExpression parent: nil ].
	baseExpression := aDelphiExpressionNode.
	self baseExpression notNil
		ifTrue: [ self baseExpression parent: self ]
]

{ #category : #generated }
DelphiMemExpressionNode >> colon [
	^ colon
]

{ #category : #generated }
DelphiMemExpressionNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
DelphiMemExpressionNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
DelphiMemExpressionNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
DelphiMemExpressionNode >> mem [
	^ mem
]

{ #category : #generated }
DelphiMemExpressionNode >> mem: aSmaCCToken [
	mem := aSmaCCToken
]

{ #category : #generated }
DelphiMemExpressionNode >> nodeVariables [
	^ #(#baseExpression #addressExpression)
]

{ #category : #generated }
DelphiMemExpressionNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
DelphiMemExpressionNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
DelphiMemExpressionNode >> tokenVariables [
	^ #(#mem #leftBrace #colon #rightBrace)
]
