Class {
	#name : #JavaNewClassNode,
	#superclass : #JavaNewNode,
	#instVars : [
		'leftBrace',
		'declarations',
		'rightBrace'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaNewClassNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNewClass: self
]

{ #category : #generated }
JavaNewClassNode >> compositeNodeVariables [
	^ #(#declarations #expressions #arguments)
]

{ #category : #generated }
JavaNewClassNode >> declarations [
	^ declarations
]

{ #category : #generated }
JavaNewClassNode >> declarations: anOrderedCollection [
	self setParents: self declarations to: nil.
	declarations := anOrderedCollection.
	self setParents: self declarations to: self
]

{ #category : #generated }
JavaNewClassNode >> ignoredTokenVariables [
	^ #(#leftBrace #rightBrace #leftParen #rightParen #lt #gt)
]

{ #category : #'generated-initialize-release' }
JavaNewClassNode >> initialize [
	super initialize.
	declarations := OrderedCollection new: 2.
]

{ #category : #generated }
JavaNewClassNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JavaNewClassNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JavaNewClassNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JavaNewClassNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]
