Class {
	#name : #CSBinaryExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'left',
		'operator',
		'right'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSBinaryExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBinaryExpression: self
]

{ #category : #generated }
CSBinaryExpressionNode >> left [
	^ left
]

{ #category : #generated }
CSBinaryExpressionNode >> left: aCSExpressionNode [
	self left notNil
		ifTrue: [ self left parent: nil ].
	left := aCSExpressionNode.
	self left notNil
		ifTrue: [ self left parent: self ]
]

{ #category : #generated }
CSBinaryExpressionNode >> nodeVariables [
	^ #(#left #right)
]

{ #category : #generated }
CSBinaryExpressionNode >> operator [
	^ operator
]

{ #category : #generated }
CSBinaryExpressionNode >> operator: aSmaCCToken [
	operator := aSmaCCToken
]

{ #category : #generated }
CSBinaryExpressionNode >> right [
	^ right
]

{ #category : #generated }
CSBinaryExpressionNode >> right: aCSProgramNode [
	self right notNil
		ifTrue: [ self right parent: nil ].
	right := aCSProgramNode.
	self right notNil
		ifTrue: [ self right parent: self ]
]

{ #category : #generated }
CSBinaryExpressionNode >> tokenVariables [
	^ #(#operator)
]
