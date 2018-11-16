Class {
	#name : #CSConstantDeclaratorNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'identifierToken',
		'equalToken',
		'expression'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSConstantDeclaratorNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitConstantDeclarator: self
]

{ #category : #generated }
CSConstantDeclaratorNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
CSConstantDeclaratorNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
CSConstantDeclaratorNode >> expression [
	^ expression
]

{ #category : #generated }
CSConstantDeclaratorNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSConstantDeclaratorNode >> identifierToken [
	^ identifierToken
]

{ #category : #generated }
CSConstantDeclaratorNode >> identifierToken: aSmaCCToken [
	identifierToken := aSmaCCToken
]

{ #category : #generated }
CSConstantDeclaratorNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
CSConstantDeclaratorNode >> tokenVariables [
	^ #(#identifierToken #equalToken)
]
