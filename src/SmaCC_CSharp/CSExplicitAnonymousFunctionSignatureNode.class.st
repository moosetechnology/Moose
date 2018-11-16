Class {
	#name : #CSExplicitAnonymousFunctionSignatureNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'leftParenToken',
		'parameters',
		'commaTokens',
		'rightParenToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSExplicitAnonymousFunctionSignatureNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitExplicitAnonymousFunctionSignature: self
]

{ #category : #generated }
CSExplicitAnonymousFunctionSignatureNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CSExplicitAnonymousFunctionSignatureNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CSExplicitAnonymousFunctionSignatureNode >> compositeNodeVariables [
	^ #(#parameters)
]

{ #category : #generated }
CSExplicitAnonymousFunctionSignatureNode >> ignoredCompositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #'generated-initialize-release' }
CSExplicitAnonymousFunctionSignatureNode >> initialize [
	super initialize.
	parameters := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CSExplicitAnonymousFunctionSignatureNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSExplicitAnonymousFunctionSignatureNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSExplicitAnonymousFunctionSignatureNode >> parameters [
	^ parameters
]

{ #category : #generated }
CSExplicitAnonymousFunctionSignatureNode >> parameters: anOrderedCollection [
	self setParents: self parameters to: nil.
	parameters := anOrderedCollection.
	self setParents: self parameters to: self
]

{ #category : #generated }
CSExplicitAnonymousFunctionSignatureNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSExplicitAnonymousFunctionSignatureNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSExplicitAnonymousFunctionSignatureNode >> tokenVariables [
	^ #(#leftParenToken #rightParenToken)
]
