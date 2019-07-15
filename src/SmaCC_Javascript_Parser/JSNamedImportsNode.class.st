Class {
	#name : #JSNamedImportsNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'leftBrace',
		'rightBrace',
		'specifiers',
		'commas'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSNamedImportsNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNamedImports: self
]

{ #category : #generated }
JSNamedImportsNode >> commas [
	^ commas
]

{ #category : #generated }
JSNamedImportsNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JSNamedImportsNode >> compositeNodeVariables [
	^ #(#specifiers)
]

{ #category : #generated }
JSNamedImportsNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
JSNamedImportsNode >> ignoredTokenVariables [
	^ #(#leftBrace #rightBrace)
]

{ #category : #'generated-initialize-release' }
JSNamedImportsNode >> initialize [
	super initialize.
	specifiers := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JSNamedImportsNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JSNamedImportsNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JSNamedImportsNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JSNamedImportsNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
JSNamedImportsNode >> specifiers [
	^ specifiers
]

{ #category : #generated }
JSNamedImportsNode >> specifiers: anOrderedCollection [
	self setParents: self specifiers to: nil.
	specifiers := anOrderedCollection.
	self setParents: self specifiers to: self
]
