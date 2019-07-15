Class {
	#name : #DelphiMainMethodDefinitionNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'definitions',
		'block',
		'semicolon'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiMainMethodDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMainMethodDefinition: self
]

{ #category : #generated }
DelphiMainMethodDefinitionNode >> block [
	^ block
]

{ #category : #generated }
DelphiMainMethodDefinitionNode >> block: aDelphiStatementNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aDelphiStatementNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
DelphiMainMethodDefinitionNode >> compositeNodeVariables [
	^ #(#definitions)
]

{ #category : #generated }
DelphiMainMethodDefinitionNode >> definitions [
	^ definitions
]

{ #category : #generated }
DelphiMainMethodDefinitionNode >> definitions: anOrderedCollection [
	self setParents: self definitions to: nil.
	definitions := anOrderedCollection.
	self setParents: self definitions to: self
]

{ #category : #generated }
DelphiMainMethodDefinitionNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #'generated-initialize-release' }
DelphiMainMethodDefinitionNode >> initialize [
	super initialize.
	definitions := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiMainMethodDefinitionNode >> nodeVariables [
	^ #(#block)
]

{ #category : #generated }
DelphiMainMethodDefinitionNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
DelphiMainMethodDefinitionNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]
