Class {
	#name : #SmaCCRewriteTestBinaryExpressionNode,
	#superclass : #SmaCCRewriteTestExpressionNode,
	#instVars : [
		'left',
		'operator',
		'right'
	],
	#category : #'SmaCC_Rewrite_Engine_Tests'
}

{ #category : #generated }
SmaCCRewriteTestBinaryExpressionNode >> acceptVisitor: anExpressionVisitor [
	^ anExpressionVisitor visitBinaryExpression: self
]

{ #category : #generated }
SmaCCRewriteTestBinaryExpressionNode >> left [
	^ left
]

{ #category : #generated }
SmaCCRewriteTestBinaryExpressionNode >> left: aSmaCCRewriteTestExpressionNode [
	self left notNil
		ifTrue: [ self left parent: nil ].
	left := aSmaCCRewriteTestExpressionNode.
	self left notNil
		ifTrue: [ self left parent: self ]
]

{ #category : #generated }
SmaCCRewriteTestBinaryExpressionNode >> nodeVariables [
	^ #(#left #right)
]

{ #category : #generated }
SmaCCRewriteTestBinaryExpressionNode >> operator [
	^ operator
]

{ #category : #generated }
SmaCCRewriteTestBinaryExpressionNode >> operator: aSmaCCToken [
	operator := aSmaCCToken
]

{ #category : #generated }
SmaCCRewriteTestBinaryExpressionNode >> right [
	^ right
]

{ #category : #generated }
SmaCCRewriteTestBinaryExpressionNode >> right: aSmaCCRewriteTestExpressionNode [
	self right notNil
		ifTrue: [ self right parent: nil ].
	right := aSmaCCRewriteTestExpressionNode.
	self right notNil
		ifTrue: [ self right parent: self ]
]

{ #category : #generated }
SmaCCRewriteTestBinaryExpressionNode >> tokenVariables [
	^ #(#operator)
]
