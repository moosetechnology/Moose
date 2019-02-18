Class {
	#name : #JavaEnumConstantNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'annotations',
		'name',
		'leftParen',
		'expressions',
		'commas',
		'rightParen',
		'leftBrace',
		'declarations',
		'rightBrace'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaEnumConstantNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitEnumConstant: self
]

{ #category : #generated }
JavaEnumConstantNode >> annotations [
	^ annotations
]

{ #category : #generated }
JavaEnumConstantNode >> annotations: anOrderedCollection [
	self setParents: self annotations to: nil.
	annotations := anOrderedCollection.
	self setParents: self annotations to: self
]

{ #category : #generated }
JavaEnumConstantNode >> commas [
	^ commas
]

{ #category : #generated }
JavaEnumConstantNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JavaEnumConstantNode >> compositeNodeVariables [
	^ #(#annotations #expressions #declarations)
]

{ #category : #generated }
JavaEnumConstantNode >> declarations [
	^ declarations
]

{ #category : #generated }
JavaEnumConstantNode >> declarations: anOrderedCollection [
	self setParents: self declarations to: nil.
	declarations := anOrderedCollection.
	self setParents: self declarations to: self
]

{ #category : #generated }
JavaEnumConstantNode >> expressions [
	^ expressions
]

{ #category : #generated }
JavaEnumConstantNode >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #generated }
JavaEnumConstantNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
JavaEnumConstantNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen #leftBrace #rightBrace)
]

{ #category : #'generated-initialize-release' }
JavaEnumConstantNode >> initialize [
	super initialize.
	annotations := OrderedCollection new: 2.
	expressions := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
	declarations := OrderedCollection new: 2.
]

{ #category : #generated }
JavaEnumConstantNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JavaEnumConstantNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JavaEnumConstantNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JavaEnumConstantNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JavaEnumConstantNode >> name [
	^ name
]

{ #category : #generated }
JavaEnumConstantNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
JavaEnumConstantNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JavaEnumConstantNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
JavaEnumConstantNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JavaEnumConstantNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JavaEnumConstantNode >> tokenVariables [
	^ #(#name)
]
