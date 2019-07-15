Class {
	#name : #JSClassExpressionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'classToken',
		'name',
		'extendsToken',
		'superclass',
		'leftBrace',
		'elements',
		'rightBrace'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSClassExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitClassExpression: self
]

{ #category : #generated }
JSClassExpressionNode >> classToken [
	^ classToken
]

{ #category : #generated }
JSClassExpressionNode >> classToken: aSmaCCToken [
	classToken := aSmaCCToken
]

{ #category : #generated }
JSClassExpressionNode >> compositeNodeVariables [
	^ #(#elements)
]

{ #category : #generated }
JSClassExpressionNode >> elements [
	^ elements
]

{ #category : #generated }
JSClassExpressionNode >> elements: anOrderedCollection [
	self setParents: self elements to: nil.
	elements := anOrderedCollection.
	self setParents: self elements to: self
]

{ #category : #generated }
JSClassExpressionNode >> extendsToken [
	^ extendsToken
]

{ #category : #generated }
JSClassExpressionNode >> extendsToken: aSmaCCToken [
	extendsToken := aSmaCCToken
]

{ #category : #generated }
JSClassExpressionNode >> ignoredTokenVariables [
	^ #(#leftBrace #rightBrace)
]

{ #category : #'generated-initialize-release' }
JSClassExpressionNode >> initialize [
	super initialize.
	elements := OrderedCollection new: 2.
]

{ #category : #generated }
JSClassExpressionNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JSClassExpressionNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JSClassExpressionNode >> name [
	^ name
]

{ #category : #generated }
JSClassExpressionNode >> name: aJSNameExpressionNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aJSNameExpressionNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
JSClassExpressionNode >> nodeVariables [
	^ #(#name #superclass)
]

{ #category : #generated }
JSClassExpressionNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JSClassExpressionNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
JSClassExpressionNode >> superclass [
	^ superclass
]

{ #category : #generated }
JSClassExpressionNode >> superclass: aJSExpressionNode [
	self superclass notNil
		ifTrue: [ self superclass parent: nil ].
	superclass := aJSExpressionNode.
	self superclass notNil
		ifTrue: [ self superclass parent: self ]
]

{ #category : #generated }
JSClassExpressionNode >> tokenVariables [
	^ #(#classToken #extendsToken)
]
