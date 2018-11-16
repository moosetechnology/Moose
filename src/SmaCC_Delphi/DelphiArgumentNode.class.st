Class {
	#name : #DelphiArgumentNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'typeToken',
		'names',
		'commas',
		'colon',
		'type',
		'equal',
		'value'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiArgumentNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitArgument: self
]

{ #category : #generated }
DelphiArgumentNode >> colon [
	^ colon
]

{ #category : #generated }
DelphiArgumentNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
DelphiArgumentNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiArgumentNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiArgumentNode >> compositeTokenVariables [
	^ #(#names)
]

{ #category : #generated }
DelphiArgumentNode >> equal [
	^ equal
]

{ #category : #generated }
DelphiArgumentNode >> equal: aSmaCCToken [
	equal := aSmaCCToken
]

{ #category : #generated }
DelphiArgumentNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #'generated-initialize-release' }
DelphiArgumentNode >> initialize [
	super initialize.
	names := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiArgumentNode >> names [
	^ names
]

{ #category : #generated }
DelphiArgumentNode >> names: anOrderedCollection [
	names := anOrderedCollection
]

{ #category : #generated }
DelphiArgumentNode >> nodeVariables [
	^ #(#type #value)
]

{ #category : #generated }
DelphiArgumentNode >> tokenVariables [
	^ #(#typeToken #colon #equal)
]

{ #category : #generated }
DelphiArgumentNode >> type [
	^ type
]

{ #category : #generated }
DelphiArgumentNode >> type: aDelphiProgramNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aDelphiProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]

{ #category : #generated }
DelphiArgumentNode >> typeToken [
	^ typeToken
]

{ #category : #generated }
DelphiArgumentNode >> typeToken: aSmaCCToken [
	typeToken := aSmaCCToken
]

{ #category : #generated }
DelphiArgumentNode >> value [
	^ value
]

{ #category : #generated }
DelphiArgumentNode >> value: aDelphiExpressionNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aDelphiExpressionNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]
