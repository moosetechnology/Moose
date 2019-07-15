Class {
	#name : #CSConstDeclaratorNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'name',
		'equalToken',
		'expression'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSConstDeclaratorNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitConstDeclarator: self
]

{ #category : #generated }
CSConstDeclaratorNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
CSConstDeclaratorNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
CSConstDeclaratorNode >> expression [
	^ expression
]

{ #category : #generated }
CSConstDeclaratorNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSConstDeclaratorNode >> name [
	^ name
]

{ #category : #generated }
CSConstDeclaratorNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
CSConstDeclaratorNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
CSConstDeclaratorNode >> tokenVariables [
	^ #(#name #equalToken)
]
