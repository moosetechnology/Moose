Class {
	#name : #CSUsingDirectiveNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'usingToken',
		'namespace',
		'semicolonToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSUsingDirectiveNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitUsingDirective: self
]

{ #category : #generated }
CSUsingDirectiveNode >> ignoredTokenVariables [
	^ #(#semicolonToken)
]

{ #category : #generated }
CSUsingDirectiveNode >> namespace [
	^ namespace
]

{ #category : #generated }
CSUsingDirectiveNode >> namespace: aCSTypeNode [
	self namespace notNil
		ifTrue: [ self namespace parent: nil ].
	namespace := aCSTypeNode.
	self namespace notNil
		ifTrue: [ self namespace parent: self ]
]

{ #category : #generated }
CSUsingDirectiveNode >> nodeVariables [
	^ #(#namespace)
]

{ #category : #generated }
CSUsingDirectiveNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CSUsingDirectiveNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CSUsingDirectiveNode >> tokenVariables [
	^ #(#usingToken)
]

{ #category : #generated }
CSUsingDirectiveNode >> usingToken [
	^ usingToken
]

{ #category : #generated }
CSUsingDirectiveNode >> usingToken: aSmaCCToken [
	usingToken := aSmaCCToken
]
