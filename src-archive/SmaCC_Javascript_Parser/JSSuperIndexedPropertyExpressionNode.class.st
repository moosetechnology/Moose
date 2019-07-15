Class {
	#name : #JSSuperIndexedPropertyExpressionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'superToken',
		'leftBracket',
		'expression',
		'rightBracket'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSSuperIndexedPropertyExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSuperIndexedPropertyExpression: self
]

{ #category : #generated }
JSSuperIndexedPropertyExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
JSSuperIndexedPropertyExpressionNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSSuperIndexedPropertyExpressionNode >> ignoredTokenVariables [
	^ #(#leftBracket #rightBracket)
]

{ #category : #generated }
JSSuperIndexedPropertyExpressionNode >> leftBracket [
	^ leftBracket
]

{ #category : #generated }
JSSuperIndexedPropertyExpressionNode >> leftBracket: aSmaCCToken [
	leftBracket := aSmaCCToken
]

{ #category : #generated }
JSSuperIndexedPropertyExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JSSuperIndexedPropertyExpressionNode >> rightBracket [
	^ rightBracket
]

{ #category : #generated }
JSSuperIndexedPropertyExpressionNode >> rightBracket: aSmaCCToken [
	rightBracket := aSmaCCToken
]

{ #category : #generated }
JSSuperIndexedPropertyExpressionNode >> superToken [
	^ superToken
]

{ #category : #generated }
JSSuperIndexedPropertyExpressionNode >> superToken: aSmaCCToken [
	superToken := aSmaCCToken
]

{ #category : #generated }
JSSuperIndexedPropertyExpressionNode >> tokenVariables [
	^ #(#superToken)
]
