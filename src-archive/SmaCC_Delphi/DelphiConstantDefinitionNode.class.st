Class {
	#name : #DelphiConstantDefinitionNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'name',
		'colon',
		'type',
		'equalToken',
		'expression',
		'modifier',
		'deprecatedToken',
		'semicolon'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiConstantDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitConstantDefinition: self
]

{ #category : #generated }
DelphiConstantDefinitionNode >> colon [
	^ colon
]

{ #category : #generated }
DelphiConstantDefinitionNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
DelphiConstantDefinitionNode >> deprecatedToken [
	^ deprecatedToken
]

{ #category : #generated }
DelphiConstantDefinitionNode >> deprecatedToken: aSmaCCToken [
	deprecatedToken := aSmaCCToken
]

{ #category : #generated }
DelphiConstantDefinitionNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
DelphiConstantDefinitionNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
DelphiConstantDefinitionNode >> expression [
	^ expression
]

{ #category : #generated }
DelphiConstantDefinitionNode >> expression: aDelphiExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aDelphiExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
DelphiConstantDefinitionNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
DelphiConstantDefinitionNode >> modifier [
	^ modifier
]

{ #category : #generated }
DelphiConstantDefinitionNode >> modifier: aSmaCCToken [
	modifier := aSmaCCToken
]

{ #category : #generated }
DelphiConstantDefinitionNode >> name [
	^ name
]

{ #category : #generated }
DelphiConstantDefinitionNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
DelphiConstantDefinitionNode >> nodeVariables [
	^ #(#type #expression)
]

{ #category : #generated }
DelphiConstantDefinitionNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
DelphiConstantDefinitionNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
DelphiConstantDefinitionNode >> tokenVariables [
	^ #(#name #colon #equalToken #modifier #deprecatedToken)
]

{ #category : #generated }
DelphiConstantDefinitionNode >> type [
	^ type
]

{ #category : #generated }
DelphiConstantDefinitionNode >> type: aDelphiProgramNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aDelphiProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
