Class {
	#name : #CSFixedPointerDeclaratorNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'identifierToken',
		'equalToken',
		'andToken',
		'expression'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSFixedPointerDeclaratorNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFixedPointerDeclarator: self
]

{ #category : #generated }
CSFixedPointerDeclaratorNode >> andToken [
	^ andToken
]

{ #category : #generated }
CSFixedPointerDeclaratorNode >> andToken: aSmaCCToken [
	andToken := aSmaCCToken
]

{ #category : #generated }
CSFixedPointerDeclaratorNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
CSFixedPointerDeclaratorNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
CSFixedPointerDeclaratorNode >> expression [
	^ expression
]

{ #category : #generated }
CSFixedPointerDeclaratorNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSFixedPointerDeclaratorNode >> identifierToken [
	^ identifierToken
]

{ #category : #generated }
CSFixedPointerDeclaratorNode >> identifierToken: aSmaCCToken [
	identifierToken := aSmaCCToken
]

{ #category : #generated }
CSFixedPointerDeclaratorNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
CSFixedPointerDeclaratorNode >> tokenVariables [
	^ #(#identifierToken #equalToken #andToken)
]
