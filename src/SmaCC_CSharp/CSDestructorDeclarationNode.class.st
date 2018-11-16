Class {
	#name : #CSDestructorDeclarationNode,
	#superclass : #CSDeclarationNode,
	#instVars : [
		'_attributes',
		'modifiers',
		'tildeToken',
		'identifierToken',
		'leftParenToken',
		'rightParenToken',
		'body'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSDestructorDeclarationNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSDestructorDeclarationNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSDestructorDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitDestructorDeclaration: self
]

{ #category : #generated }
CSDestructorDeclarationNode >> body [
	^ body
]

{ #category : #generated }
CSDestructorDeclarationNode >> body: aCSMethodBodyNode [
	self body notNil
		ifTrue: [ self body parent: nil ].
	body := aCSMethodBodyNode.
	self body notNil
		ifTrue: [ self body parent: self ]
]

{ #category : #generated }
CSDestructorDeclarationNode >> compositeNodeVariables [
	^ #(#_attributes)
]

{ #category : #generated }
CSDestructorDeclarationNode >> compositeTokenVariables [
	^ #(#modifiers)
]

{ #category : #generated }
CSDestructorDeclarationNode >> identifierToken [
	^ identifierToken
]

{ #category : #generated }
CSDestructorDeclarationNode >> identifierToken: aSmaCCToken [
	identifierToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
CSDestructorDeclarationNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
	modifiers := OrderedCollection new: 2.
]

{ #category : #generated }
CSDestructorDeclarationNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSDestructorDeclarationNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSDestructorDeclarationNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
CSDestructorDeclarationNode >> modifiers: anOrderedCollection [
	modifiers := anOrderedCollection
]

{ #category : #generated }
CSDestructorDeclarationNode >> nodeVariables [
	^ #(#body)
]

{ #category : #generated }
CSDestructorDeclarationNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSDestructorDeclarationNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSDestructorDeclarationNode >> tildeToken [
	^ tildeToken
]

{ #category : #generated }
CSDestructorDeclarationNode >> tildeToken: aSmaCCToken [
	tildeToken := aSmaCCToken
]

{ #category : #generated }
CSDestructorDeclarationNode >> tokenVariables [
	^ #(#tildeToken #identifierToken #leftParenToken #rightParenToken)
]
