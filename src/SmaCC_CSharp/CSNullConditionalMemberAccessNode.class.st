Class {
	#name : #CSNullConditionalMemberAccessNode,
	#superclass : #CSMemberAccessNode,
	#instVars : [
		'baseOperations',
		'questionMarkToken',
		'identifierToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSNullConditionalMemberAccessNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNullConditionalMemberAccess: self
]

{ #category : #generated }
CSNullConditionalMemberAccessNode >> baseOperations [
	^ baseOperations
]

{ #category : #generated }
CSNullConditionalMemberAccessNode >> baseOperations: aCSExpressionNode [
	self baseOperations notNil
		ifTrue: [ self baseOperations parent: nil ].
	baseOperations := aCSExpressionNode.
	self baseOperations notNil
		ifTrue: [ self baseOperations parent: self ]
]

{ #category : #generated }
CSNullConditionalMemberAccessNode >> identifierToken [
	^ identifierToken
]

{ #category : #generated }
CSNullConditionalMemberAccessNode >> identifierToken: aSmaCCToken [
	identifierToken := aSmaCCToken
]

{ #category : #generated }
CSNullConditionalMemberAccessNode >> nodeVariables [
	^ #(#baseOperations #expression #typeArguments)
]

{ #category : #generated }
CSNullConditionalMemberAccessNode >> questionMarkToken [
	^ questionMarkToken
]

{ #category : #generated }
CSNullConditionalMemberAccessNode >> questionMarkToken: aSmaCCToken [
	questionMarkToken := aSmaCCToken
]

{ #category : #generated }
CSNullConditionalMemberAccessNode >> tokenVariables [
	^ #(#questionMarkToken #identifierToken #periodToken #identifier)
]
