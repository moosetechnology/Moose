Class {
	#name : #DelphiVariableNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'names',
		'commas',
		'colon',
		'type',
		'modifier',
		'equal',
		'value',
		'semicolon'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiVariableNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitVariable: self
]

{ #category : #generated }
DelphiVariableNode >> colon [
	^ colon
]

{ #category : #generated }
DelphiVariableNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
DelphiVariableNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiVariableNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiVariableNode >> compositeTokenVariables [
	^ #(#names)
]

{ #category : #generated }
DelphiVariableNode >> equal [
	^ equal
]

{ #category : #generated }
DelphiVariableNode >> equal: aSmaCCToken [
	equal := aSmaCCToken
]

{ #category : #generated }
DelphiVariableNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
DelphiVariableNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #'generated-initialize-release' }
DelphiVariableNode >> initialize [
	super initialize.
	names := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiVariableNode >> modifier [
	^ modifier
]

{ #category : #generated }
DelphiVariableNode >> modifier: aSmaCCToken [
	modifier := aSmaCCToken
]

{ #category : #generated }
DelphiVariableNode >> names [
	^ names
]

{ #category : #generated }
DelphiVariableNode >> names: anOrderedCollection [
	names := anOrderedCollection
]

{ #category : #generated }
DelphiVariableNode >> nodeVariables [
	^ #(#type #value)
]

{ #category : #generated }
DelphiVariableNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
DelphiVariableNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
DelphiVariableNode >> tokenVariables [
	^ #(#colon #modifier #equal)
]

{ #category : #generated }
DelphiVariableNode >> type [
	^ type
]

{ #category : #generated }
DelphiVariableNode >> type: aDelphiProgramNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aDelphiProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]

{ #category : #generated }
DelphiVariableNode >> value [
	^ value
]

{ #category : #generated }
DelphiVariableNode >> value: aDelphiExpressionNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aDelphiExpressionNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]
