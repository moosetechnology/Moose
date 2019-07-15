Class {
	#name : #CSStackallocInitializerNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'stackallocToken',
		'type',
		'leftBracketToken',
		'expression',
		'rightBracketToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSStackallocInitializerNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitStackallocInitializer: self
]

{ #category : #generated }
CSStackallocInitializerNode >> expression [
	^ expression
]

{ #category : #generated }
CSStackallocInitializerNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSStackallocInitializerNode >> leftBracketToken [
	^ leftBracketToken
]

{ #category : #generated }
CSStackallocInitializerNode >> leftBracketToken: aSmaCCToken [
	leftBracketToken := aSmaCCToken
]

{ #category : #generated }
CSStackallocInitializerNode >> nodeVariables [
	^ #(#type #expression)
]

{ #category : #generated }
CSStackallocInitializerNode >> rightBracketToken [
	^ rightBracketToken
]

{ #category : #generated }
CSStackallocInitializerNode >> rightBracketToken: aSmaCCToken [
	rightBracketToken := aSmaCCToken
]

{ #category : #generated }
CSStackallocInitializerNode >> stackallocToken [
	^ stackallocToken
]

{ #category : #generated }
CSStackallocInitializerNode >> stackallocToken: aSmaCCToken [
	stackallocToken := aSmaCCToken
]

{ #category : #generated }
CSStackallocInitializerNode >> tokenVariables [
	^ #(#stackallocToken #leftBracketToken #rightBracketToken)
]

{ #category : #generated }
CSStackallocInitializerNode >> type [
	^ type
]

{ #category : #generated }
CSStackallocInitializerNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
