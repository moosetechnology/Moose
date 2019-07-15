Class {
	#name : #CSSizeofExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'sizeofToken',
		'leftParenToken',
		'type',
		'rightParenToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSSizeofExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSizeofExpression: self
]

{ #category : #generated }
CSSizeofExpressionNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSSizeofExpressionNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSSizeofExpressionNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
CSSizeofExpressionNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSSizeofExpressionNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSSizeofExpressionNode >> sizeofToken [
	^ sizeofToken
]

{ #category : #generated }
CSSizeofExpressionNode >> sizeofToken: aSmaCCToken [
	sizeofToken := aSmaCCToken
]

{ #category : #generated }
CSSizeofExpressionNode >> tokenVariables [
	^ #(#sizeofToken #leftParenToken #rightParenToken)
]

{ #category : #generated }
CSSizeofExpressionNode >> type [
	^ type
]

{ #category : #generated }
CSSizeofExpressionNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
