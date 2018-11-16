Class {
	#name : #CSNamedEntityNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'target',
		'periodToken',
		'identifierToken',
		'typeArguments'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSNamedEntityNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNamedEntity: self
]

{ #category : #generated }
CSNamedEntityNode >> identifierToken [
	^ identifierToken
]

{ #category : #generated }
CSNamedEntityNode >> identifierToken: aSmaCCToken [
	identifierToken := aSmaCCToken
]

{ #category : #generated }
CSNamedEntityNode >> nodeVariables [
	^ #(#target #typeArguments)
]

{ #category : #generated }
CSNamedEntityNode >> periodToken [
	^ periodToken
]

{ #category : #generated }
CSNamedEntityNode >> periodToken: aSmaCCToken [
	periodToken := aSmaCCToken
]

{ #category : #generated }
CSNamedEntityNode >> target [
	^ target
]

{ #category : #generated }
CSNamedEntityNode >> target: aCSExpressionNode [
	self target notNil
		ifTrue: [ self target parent: nil ].
	target := aCSExpressionNode.
	self target notNil
		ifTrue: [ self target parent: self ]
]

{ #category : #generated }
CSNamedEntityNode >> tokenVariables [
	^ #(#periodToken #identifierToken)
]

{ #category : #generated }
CSNamedEntityNode >> typeArguments [
	^ typeArguments
]

{ #category : #generated }
CSNamedEntityNode >> typeArguments: aCSTypeArgumentListNode [
	self typeArguments notNil
		ifTrue: [ self typeArguments parent: nil ].
	typeArguments := aCSTypeArgumentListNode.
	self typeArguments notNil
		ifTrue: [ self typeArguments parent: self ]
]
