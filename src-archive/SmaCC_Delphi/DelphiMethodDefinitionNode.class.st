Class {
	#name : #DelphiMethodDefinitionNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'header',
		'definitions',
		'block',
		'semicolon'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiMethodDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMethodDefinition: self
]

{ #category : #generated }
DelphiMethodDefinitionNode >> block [
	^ block
]

{ #category : #generated }
DelphiMethodDefinitionNode >> block: aDelphiStatementNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aDelphiStatementNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
DelphiMethodDefinitionNode >> compositeNodeVariables [
	^ #(#definitions)
]

{ #category : #generated }
DelphiMethodDefinitionNode >> definitions [
	^ definitions
]

{ #category : #generated }
DelphiMethodDefinitionNode >> definitions: anOrderedCollection [
	self setParents: self definitions to: nil.
	definitions := anOrderedCollection.
	self setParents: self definitions to: self
]

{ #category : #generated }
DelphiMethodDefinitionNode >> header [
	^ header
]

{ #category : #generated }
DelphiMethodDefinitionNode >> header: aDelphiMethodHeaderNode [
	self header notNil
		ifTrue: [ self header parent: nil ].
	header := aDelphiMethodHeaderNode.
	self header notNil
		ifTrue: [ self header parent: self ]
]

{ #category : #generated }
DelphiMethodDefinitionNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #'generated-initialize-release' }
DelphiMethodDefinitionNode >> initialize [
	super initialize.
	definitions := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiMethodDefinitionNode >> nodeVariables [
	^ #(#header #block)
]

{ #category : #generated }
DelphiMethodDefinitionNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
DelphiMethodDefinitionNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]
