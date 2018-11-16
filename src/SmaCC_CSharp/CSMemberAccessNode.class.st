Class {
	#name : #CSMemberAccessNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'expression',
		'periodToken',
		'identifier',
		'typeArguments'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSMemberAccessNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMemberAccess: self
]

{ #category : #generated }
CSMemberAccessNode >> expression [
	^ expression
]

{ #category : #generated }
CSMemberAccessNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSMemberAccessNode >> identifier [
	^ identifier
]

{ #category : #generated }
CSMemberAccessNode >> identifier: aSmaCCToken [
	identifier := aSmaCCToken
]

{ #category : #generated }
CSMemberAccessNode >> nodeVariables [
	^ #(#expression #typeArguments)
]

{ #category : #generated }
CSMemberAccessNode >> periodToken [
	^ periodToken
]

{ #category : #generated }
CSMemberAccessNode >> periodToken: aSmaCCToken [
	periodToken := aSmaCCToken
]

{ #category : #generated }
CSMemberAccessNode >> tokenVariables [
	^ #(#periodToken #identifier)
]

{ #category : #generated }
CSMemberAccessNode >> typeArguments [
	^ typeArguments
]

{ #category : #generated }
CSMemberAccessNode >> typeArguments: aCSTypeArgumentListNode [
	self typeArguments notNil
		ifTrue: [ self typeArguments parent: nil ].
	typeArguments := aCSTypeArgumentListNode.
	self typeArguments notNil
		ifTrue: [ self typeArguments parent: self ]
]
