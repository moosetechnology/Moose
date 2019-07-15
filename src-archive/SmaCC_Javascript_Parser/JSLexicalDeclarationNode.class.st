Class {
	#name : #JSLexicalDeclarationNode,
	#superclass : #JSStatementNode,
	#instVars : [
		'typeToken',
		'bindings',
		'commas',
		'semicolon'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSLexicalDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitLexicalDeclaration: self
]

{ #category : #generated }
JSLexicalDeclarationNode >> bindings [
	^ bindings
]

{ #category : #generated }
JSLexicalDeclarationNode >> bindings: anOrderedCollection [
	self setParents: self bindings to: nil.
	bindings := anOrderedCollection.
	self setParents: self bindings to: self
]

{ #category : #generated }
JSLexicalDeclarationNode >> commas [
	^ commas
]

{ #category : #generated }
JSLexicalDeclarationNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JSLexicalDeclarationNode >> compositeNodeVariables [
	^ #(#bindings)
]

{ #category : #generated }
JSLexicalDeclarationNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
JSLexicalDeclarationNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #'generated-initialize-release' }
JSLexicalDeclarationNode >> initialize [
	super initialize.
	bindings := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JSLexicalDeclarationNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JSLexicalDeclarationNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
JSLexicalDeclarationNode >> tokenVariables [
	^ #(#typeToken)
]

{ #category : #generated }
JSLexicalDeclarationNode >> typeToken [
	^ typeToken
]

{ #category : #generated }
JSLexicalDeclarationNode >> typeToken: aSmaCCToken [
	typeToken := aSmaCCToken
]
