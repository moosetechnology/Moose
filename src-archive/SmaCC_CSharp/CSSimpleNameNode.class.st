Class {
	#name : #CSSimpleNameNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'identifierToken',
		'typeArguments'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSSimpleNameNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSimpleName: self
]

{ #category : #generated }
CSSimpleNameNode >> identifierToken [
	^ identifierToken
]

{ #category : #generated }
CSSimpleNameNode >> identifierToken: aSmaCCToken [
	identifierToken := aSmaCCToken
]

{ #category : #generated }
CSSimpleNameNode >> nodeVariables [
	^ #(#typeArguments)
]

{ #category : #generated }
CSSimpleNameNode >> tokenVariables [
	^ #(#identifierToken)
]

{ #category : #generated }
CSSimpleNameNode >> typeArguments [
	^ typeArguments
]

{ #category : #generated }
CSSimpleNameNode >> typeArguments: aCSTypeArgumentListNode [
	self typeArguments notNil
		ifTrue: [ self typeArguments parent: nil ].
	typeArguments := aCSTypeArgumentListNode.
	self typeArguments notNil
		ifTrue: [ self typeArguments parent: self ]
]
