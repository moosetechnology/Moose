Class {
	#name : #CSMethodDeclarationNode,
	#superclass : #CSDeclarationNode,
	#instVars : [
		'header',
		'body'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSMethodDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMethodDeclaration: self
]

{ #category : #generated }
CSMethodDeclarationNode >> body [
	^ body
]

{ #category : #generated }
CSMethodDeclarationNode >> body: aCSMethodBodyNode [
	self body notNil
		ifTrue: [ self body parent: nil ].
	body := aCSMethodBodyNode.
	self body notNil
		ifTrue: [ self body parent: self ]
]

{ #category : #generated }
CSMethodDeclarationNode >> header [
	^ header
]

{ #category : #generated }
CSMethodDeclarationNode >> header: aCSMethodHeaderNode [
	self header notNil
		ifTrue: [ self header parent: nil ].
	header := aCSMethodHeaderNode.
	self header notNil
		ifTrue: [ self header parent: self ]
]

{ #category : #generated }
CSMethodDeclarationNode >> nodeVariables [
	^ #(#header #body)
]
