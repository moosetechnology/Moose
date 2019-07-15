Class {
	#name : #SwiftBlockNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'leftBraceToken',
		'statements',
		'rightBraceToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftBlockNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitBlock: self
]

{ #category : #generated }
SwiftBlockNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #'generated-initialize-release' }
SwiftBlockNode >> initialize [
	super initialize.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftBlockNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
SwiftBlockNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
SwiftBlockNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
SwiftBlockNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
SwiftBlockNode >> statements [
	^ statements
]

{ #category : #generated }
SwiftBlockNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
SwiftBlockNode >> tokenVariables [
	^ #(#leftBraceToken #rightBraceToken)
]
