Class {
	#name : #CSNamespaceDeclarationNode,
	#superclass : #CSDeclarationNode,
	#instVars : [
		'namespaceToken',
		'identifier',
		'leftBraceToken',
		'directives',
		'declarations',
		'rightBraceToken',
		'semicolon'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSNamespaceDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNamespaceDeclaration: self
]

{ #category : #generated }
CSNamespaceDeclarationNode >> compositeNodeVariables [
	^ #(#directives #declarations)
]

{ #category : #generated }
CSNamespaceDeclarationNode >> declarations [
	^ declarations
]

{ #category : #generated }
CSNamespaceDeclarationNode >> declarations: anOrderedCollection [
	self setParents: self declarations to: nil.
	declarations := anOrderedCollection.
	self setParents: self declarations to: self
]

{ #category : #generated }
CSNamespaceDeclarationNode >> directives [
	^ directives
]

{ #category : #generated }
CSNamespaceDeclarationNode >> directives: anOrderedCollection [
	self setParents: self directives to: nil.
	directives := anOrderedCollection.
	self setParents: self directives to: self
]

{ #category : #generated }
CSNamespaceDeclarationNode >> identifier [
	^ identifier
]

{ #category : #generated }
CSNamespaceDeclarationNode >> identifier: aCSQualifiedIdentifierNode [
	self identifier notNil
		ifTrue: [ self identifier parent: nil ].
	identifier := aCSQualifiedIdentifierNode.
	self identifier notNil
		ifTrue: [ self identifier parent: self ]
]

{ #category : #'generated-initialize-release' }
CSNamespaceDeclarationNode >> initialize [
	super initialize.
	directives := OrderedCollection new: 2.
	declarations := OrderedCollection new: 2.
]

{ #category : #generated }
CSNamespaceDeclarationNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
CSNamespaceDeclarationNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
CSNamespaceDeclarationNode >> namespaceToken [
	^ namespaceToken
]

{ #category : #generated }
CSNamespaceDeclarationNode >> namespaceToken: aSmaCCToken [
	namespaceToken := aSmaCCToken
]

{ #category : #generated }
CSNamespaceDeclarationNode >> nodeVariables [
	^ #(#identifier)
]

{ #category : #generated }
CSNamespaceDeclarationNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
CSNamespaceDeclarationNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
CSNamespaceDeclarationNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
CSNamespaceDeclarationNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
CSNamespaceDeclarationNode >> tokenVariables [
	^ #(#namespaceToken #leftBraceToken #rightBraceToken #semicolon)
]
