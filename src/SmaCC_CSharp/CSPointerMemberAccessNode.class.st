Class {
	#name : #CSPointerMemberAccessNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'expression',
		'arrowToken',
		'name'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSPointerMemberAccessNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPointerMemberAccess: self
]

{ #category : #generated }
CSPointerMemberAccessNode >> arrowToken [
	^ arrowToken
]

{ #category : #generated }
CSPointerMemberAccessNode >> arrowToken: aSmaCCToken [
	arrowToken := aSmaCCToken
]

{ #category : #generated }
CSPointerMemberAccessNode >> expression [
	^ expression
]

{ #category : #generated }
CSPointerMemberAccessNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSPointerMemberAccessNode >> name [
	^ name
]

{ #category : #generated }
CSPointerMemberAccessNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
CSPointerMemberAccessNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
CSPointerMemberAccessNode >> tokenVariables [
	^ #(#arrowToken #name)
]
