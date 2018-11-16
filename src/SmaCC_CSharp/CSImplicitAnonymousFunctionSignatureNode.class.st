Class {
	#name : #CSImplicitAnonymousFunctionSignatureNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'leftParenToken',
		'names',
		'commaTokens',
		'rightParenToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSImplicitAnonymousFunctionSignatureNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitImplicitAnonymousFunctionSignature: self
]

{ #category : #generated }
CSImplicitAnonymousFunctionSignatureNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CSImplicitAnonymousFunctionSignatureNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CSImplicitAnonymousFunctionSignatureNode >> compositeTokenVariables [
	^ #(#names)
]

{ #category : #generated }
CSImplicitAnonymousFunctionSignatureNode >> ignoredCompositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #'generated-initialize-release' }
CSImplicitAnonymousFunctionSignatureNode >> initialize [
	super initialize.
	names := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CSImplicitAnonymousFunctionSignatureNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSImplicitAnonymousFunctionSignatureNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSImplicitAnonymousFunctionSignatureNode >> names [
	^ names
]

{ #category : #generated }
CSImplicitAnonymousFunctionSignatureNode >> names: anOrderedCollection [
	names := anOrderedCollection
]

{ #category : #generated }
CSImplicitAnonymousFunctionSignatureNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSImplicitAnonymousFunctionSignatureNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSImplicitAnonymousFunctionSignatureNode >> tokenVariables [
	^ #(#leftParenToken #rightParenToken)
]
