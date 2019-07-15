Class {
	#name : #DelphiNamedDefinedTypeNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'name',
		'left',
		'genericTypeArguments',
		'commas',
		'right',
		'equalToken',
		'type',
		'modifier',
		'semicolon'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiNamedDefinedTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNamedDefinedType: self
]

{ #category : #generated }
DelphiNamedDefinedTypeNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiNamedDefinedTypeNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiNamedDefinedTypeNode >> compositeTokenVariables [
	^ #(#genericTypeArguments)
]

{ #category : #generated }
DelphiNamedDefinedTypeNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
DelphiNamedDefinedTypeNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
DelphiNamedDefinedTypeNode >> genericTypeArguments [
	^ genericTypeArguments
]

{ #category : #generated }
DelphiNamedDefinedTypeNode >> genericTypeArguments: anOrderedCollection [
	genericTypeArguments := anOrderedCollection
]

{ #category : #generated }
DelphiNamedDefinedTypeNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
DelphiNamedDefinedTypeNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #'generated-initialize-release' }
DelphiNamedDefinedTypeNode >> initialize [
	super initialize.
	genericTypeArguments := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiNamedDefinedTypeNode >> left [
	^ left
]

{ #category : #generated }
DelphiNamedDefinedTypeNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiNamedDefinedTypeNode >> modifier [
	^ modifier
]

{ #category : #generated }
DelphiNamedDefinedTypeNode >> modifier: aSmaCCToken [
	modifier := aSmaCCToken
]

{ #category : #generated }
DelphiNamedDefinedTypeNode >> name [
	^ name
]

{ #category : #generated }
DelphiNamedDefinedTypeNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
DelphiNamedDefinedTypeNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
DelphiNamedDefinedTypeNode >> right [
	^ right
]

{ #category : #generated }
DelphiNamedDefinedTypeNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiNamedDefinedTypeNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
DelphiNamedDefinedTypeNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
DelphiNamedDefinedTypeNode >> tokenVariables [
	^ #(#name #left #right #equalToken #modifier)
]

{ #category : #generated }
DelphiNamedDefinedTypeNode >> type [
	^ type
]

{ #category : #generated }
DelphiNamedDefinedTypeNode >> type: aDelphiProgramNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aDelphiProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
