Class {
	#name : #CSGetAccessorDeclarationNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'_attributes',
		'modifiers',
		'getToken',
		'body',
		'semicolonToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSGetAccessorDeclarationNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSGetAccessorDeclarationNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSGetAccessorDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitGetAccessorDeclaration: self
]

{ #category : #generated }
CSGetAccessorDeclarationNode >> body [
	^ body
]

{ #category : #generated }
CSGetAccessorDeclarationNode >> body: aCSBlockStatementNode [
	self body notNil
		ifTrue: [ self body parent: nil ].
	body := aCSBlockStatementNode.
	self body notNil
		ifTrue: [ self body parent: self ]
]

{ #category : #generated }
CSGetAccessorDeclarationNode >> compositeNodeVariables [
	^ #(#_attributes)
]

{ #category : #generated }
CSGetAccessorDeclarationNode >> compositeTokenVariables [
	^ #(#modifiers)
]

{ #category : #generated }
CSGetAccessorDeclarationNode >> getToken [
	^ getToken
]

{ #category : #generated }
CSGetAccessorDeclarationNode >> getToken: aSmaCCToken [
	getToken := aSmaCCToken
]

{ #category : #generated }
CSGetAccessorDeclarationNode >> ignoredTokenVariables [
	^ #(#semicolonToken)
]

{ #category : #'generated-initialize-release' }
CSGetAccessorDeclarationNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
	modifiers := OrderedCollection new: 2.
]

{ #category : #generated }
CSGetAccessorDeclarationNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
CSGetAccessorDeclarationNode >> modifiers: anOrderedCollection [
	modifiers := anOrderedCollection
]

{ #category : #generated }
CSGetAccessorDeclarationNode >> nodeVariables [
	^ #(#body)
]

{ #category : #generated }
CSGetAccessorDeclarationNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CSGetAccessorDeclarationNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CSGetAccessorDeclarationNode >> tokenVariables [
	^ #(#getToken)
]
