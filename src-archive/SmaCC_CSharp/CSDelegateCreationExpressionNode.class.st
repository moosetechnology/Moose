Class {
	#name : #CSDelegateCreationExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'newToken',
		'type',
		'leftParenToken',
		'expression',
		'rightParenToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSDelegateCreationExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitDelegateCreationExpression: self
]

{ #category : #generated }
CSDelegateCreationExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
CSDelegateCreationExpressionNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSDelegateCreationExpressionNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSDelegateCreationExpressionNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSDelegateCreationExpressionNode >> newToken [
	^ newToken
]

{ #category : #generated }
CSDelegateCreationExpressionNode >> newToken: aSmaCCToken [
	newToken := aSmaCCToken
]

{ #category : #generated }
CSDelegateCreationExpressionNode >> nodeVariables [
	^ #(#type #expression)
]

{ #category : #generated }
CSDelegateCreationExpressionNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSDelegateCreationExpressionNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSDelegateCreationExpressionNode >> tokenVariables [
	^ #(#newToken #leftParenToken #rightParenToken)
]

{ #category : #generated }
CSDelegateCreationExpressionNode >> type [
	^ type
]

{ #category : #generated }
CSDelegateCreationExpressionNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
