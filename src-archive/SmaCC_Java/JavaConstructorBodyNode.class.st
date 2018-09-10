Class {
	#name : #JavaConstructorBodyNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'leftBrace',
		'constructorInvocation',
		'statements',
		'rightBrace'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaConstructorBodyNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitConstructorBody: self
]

{ #category : #generated }
JavaConstructorBodyNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
JavaConstructorBodyNode >> constructorInvocation [
	^ constructorInvocation
]

{ #category : #generated }
JavaConstructorBodyNode >> constructorInvocation: aJavaProgramNode [
	self constructorInvocation notNil
		ifTrue: [ self constructorInvocation parent: nil ].
	constructorInvocation := aJavaProgramNode.
	self constructorInvocation notNil
		ifTrue: [ self constructorInvocation parent: self ]
]

{ #category : #generated }
JavaConstructorBodyNode >> ignoredTokenVariables [
	^ #(#leftBrace #rightBrace)
]

{ #category : #'generated-initialize-release' }
JavaConstructorBodyNode >> initialize [
	super initialize.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
JavaConstructorBodyNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JavaConstructorBodyNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JavaConstructorBodyNode >> nodeVariables [
	^ #(#constructorInvocation)
]

{ #category : #generated }
JavaConstructorBodyNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JavaConstructorBodyNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
JavaConstructorBodyNode >> statements [
	^ statements
]

{ #category : #generated }
JavaConstructorBodyNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]
