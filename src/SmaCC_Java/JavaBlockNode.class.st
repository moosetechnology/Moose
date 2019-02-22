Class {
	#name : #JavaBlockNode,
	#superclass : #JavaStatementNode,
	#instVars : [
		'leftBrace',
		'statements',
		'rightBrace'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaBlockNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBlock: self
]

{ #category : #generated }
JavaBlockNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
JavaBlockNode >> ignoredTokenVariables [
	^ #(#leftBrace #rightBrace)
]

{ #category : #'generated-initialize-release' }
JavaBlockNode >> initialize [
	super initialize.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
JavaBlockNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JavaBlockNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JavaBlockNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JavaBlockNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
JavaBlockNode >> statements [
	^ statements
]

{ #category : #generated }
JavaBlockNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]
