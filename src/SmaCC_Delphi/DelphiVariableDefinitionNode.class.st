Class {
	#name : #DelphiVariableDefinitionNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'names',
		'commas',
		'colon',
		'type',
		'modifier',
		'semicolon'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiVariableDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitVariableDefinition: self
]

{ #category : #generated }
DelphiVariableDefinitionNode >> colon [
	^ colon
]

{ #category : #generated }
DelphiVariableDefinitionNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
DelphiVariableDefinitionNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiVariableDefinitionNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiVariableDefinitionNode >> compositeTokenVariables [
	^ #(#names)
]

{ #category : #generated }
DelphiVariableDefinitionNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
DelphiVariableDefinitionNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #'generated-initialize-release' }
DelphiVariableDefinitionNode >> initialize [
	super initialize.
	names := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiVariableDefinitionNode >> modifier [
	^ modifier
]

{ #category : #generated }
DelphiVariableDefinitionNode >> modifier: aSmaCCToken [
	modifier := aSmaCCToken
]

{ #category : #generated }
DelphiVariableDefinitionNode >> names [
	^ names
]

{ #category : #generated }
DelphiVariableDefinitionNode >> names: anOrderedCollection [
	names := anOrderedCollection
]

{ #category : #generated }
DelphiVariableDefinitionNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
DelphiVariableDefinitionNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
DelphiVariableDefinitionNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
DelphiVariableDefinitionNode >> tokenVariables [
	^ #(#colon #modifier)
]

{ #category : #generated }
DelphiVariableDefinitionNode >> type [
	^ type
]

{ #category : #generated }
DelphiVariableDefinitionNode >> type: aDelphiProgramNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aDelphiProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
