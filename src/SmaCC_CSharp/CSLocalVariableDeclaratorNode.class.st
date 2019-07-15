Class {
	#name : #CSLocalVariableDeclaratorNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'name',
		'equalToken',
		'expression'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSLocalVariableDeclaratorNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitLocalVariableDeclarator: self
]

{ #category : #generated }
CSLocalVariableDeclaratorNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
CSLocalVariableDeclaratorNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
CSLocalVariableDeclaratorNode >> expression [
	^ expression
]

{ #category : #generated }
CSLocalVariableDeclaratorNode >> expression: aCSProgramNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSProgramNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSLocalVariableDeclaratorNode >> name [
	^ name
]

{ #category : #generated }
CSLocalVariableDeclaratorNode >> name: aCSSimpleNameNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aCSSimpleNameNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
CSLocalVariableDeclaratorNode >> nodeVariables [
	^ #(#name #expression)
]

{ #category : #generated }
CSLocalVariableDeclaratorNode >> tokenVariables [
	^ #(#equalToken)
]
