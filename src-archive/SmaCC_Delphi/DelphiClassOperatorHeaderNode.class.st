Class {
	#name : #DelphiClassOperatorHeaderNode,
	#superclass : #DelphiMethodHeaderNode,
	#instVars : [
		'classToken',
		'operatorToken',
		'arguments',
		'semicolons',
		'colon',
		'type'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiClassOperatorHeaderNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitClassOperatorHeader: self
]

{ #category : #generated }
DelphiClassOperatorHeaderNode >> arguments [
	^ arguments
]

{ #category : #generated }
DelphiClassOperatorHeaderNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
DelphiClassOperatorHeaderNode >> classToken [
	^ classToken
]

{ #category : #generated }
DelphiClassOperatorHeaderNode >> classToken: aSmaCCToken [
	classToken := aSmaCCToken
]

{ #category : #generated }
DelphiClassOperatorHeaderNode >> colon [
	^ colon
]

{ #category : #generated }
DelphiClassOperatorHeaderNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
DelphiClassOperatorHeaderNode >> compositeNodeVariables [
	^ #(#arguments #modifiers)
]

{ #category : #generated }
DelphiClassOperatorHeaderNode >> ignoredCompositeTokenVariables [
	^ #(#semicolons)
]

{ #category : #'generated-initialize-release' }
DelphiClassOperatorHeaderNode >> initialize [
	super initialize.
	semicolons := OrderedCollection new: 2.
	arguments := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiClassOperatorHeaderNode >> nodeVariables [
	^ #(#type #attribute #qualifiedName)
]

{ #category : #generated }
DelphiClassOperatorHeaderNode >> operatorToken [
	^ operatorToken
]

{ #category : #generated }
DelphiClassOperatorHeaderNode >> operatorToken: aSmaCCToken [
	operatorToken := aSmaCCToken
]

{ #category : #generated }
DelphiClassOperatorHeaderNode >> semicolons [
	^ semicolons
]

{ #category : #generated }
DelphiClassOperatorHeaderNode >> semicolons: anOrderedCollection [
	semicolons := anOrderedCollection
]

{ #category : #generated }
DelphiClassOperatorHeaderNode >> tokenVariables [
	^ #(#classToken #operatorToken #colon #left #right)
]

{ #category : #generated }
DelphiClassOperatorHeaderNode >> type [
	^ type
]

{ #category : #generated }
DelphiClassOperatorHeaderNode >> type: aDelphiProgramNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aDelphiProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
