Class {
	#name : #CSFixedSizeBufferDeclaratorNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'name',
		'leftBracketToken',
		'expression',
		'rightBracketToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSFixedSizeBufferDeclaratorNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFixedSizeBufferDeclarator: self
]

{ #category : #generated }
CSFixedSizeBufferDeclaratorNode >> expression [
	^ expression
]

{ #category : #generated }
CSFixedSizeBufferDeclaratorNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSFixedSizeBufferDeclaratorNode >> leftBracketToken [
	^ leftBracketToken
]

{ #category : #generated }
CSFixedSizeBufferDeclaratorNode >> leftBracketToken: aSmaCCToken [
	leftBracketToken := aSmaCCToken
]

{ #category : #generated }
CSFixedSizeBufferDeclaratorNode >> name [
	^ name
]

{ #category : #generated }
CSFixedSizeBufferDeclaratorNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
CSFixedSizeBufferDeclaratorNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
CSFixedSizeBufferDeclaratorNode >> rightBracketToken [
	^ rightBracketToken
]

{ #category : #generated }
CSFixedSizeBufferDeclaratorNode >> rightBracketToken: aSmaCCToken [
	rightBracketToken := aSmaCCToken
]

{ #category : #generated }
CSFixedSizeBufferDeclaratorNode >> tokenVariables [
	^ #(#name #leftBracketToken #rightBracketToken)
]
