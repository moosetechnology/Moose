Class {
	#name : #DelphiFunctionHeaderNode,
	#superclass : #DelphiMethodHeaderNode,
	#instVars : [
		'functionToken',
		'colon',
		'type',
		'semicolons',
		'arguments'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiFunctionHeaderNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFunctionHeader: self
]

{ #category : #generated }
DelphiFunctionHeaderNode >> arguments [
	^ arguments
]

{ #category : #generated }
DelphiFunctionHeaderNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
DelphiFunctionHeaderNode >> colon [
	^ colon
]

{ #category : #generated }
DelphiFunctionHeaderNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
DelphiFunctionHeaderNode >> compositeNodeVariables [
	^ #(#arguments #modifiers)
]

{ #category : #generated }
DelphiFunctionHeaderNode >> functionToken [
	^ functionToken
]

{ #category : #generated }
DelphiFunctionHeaderNode >> functionToken: aSmaCCToken [
	functionToken := aSmaCCToken
]

{ #category : #generated }
DelphiFunctionHeaderNode >> ignoredCompositeTokenVariables [
	^ #(#semicolons)
]

{ #category : #'generated-initialize-release' }
DelphiFunctionHeaderNode >> initialize [
	super initialize.
	semicolons := OrderedCollection new: 2.
	arguments := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiFunctionHeaderNode >> nodeVariables [
	^ #(#type #attribute #qualifiedName)
]

{ #category : #generated }
DelphiFunctionHeaderNode >> semicolons [
	^ semicolons
]

{ #category : #generated }
DelphiFunctionHeaderNode >> semicolons: anOrderedCollection [
	semicolons := anOrderedCollection
]

{ #category : #generated }
DelphiFunctionHeaderNode >> tokenVariables [
	^ #(#functionToken #colon #left #right)
]

{ #category : #generated }
DelphiFunctionHeaderNode >> type [
	^ type
]

{ #category : #generated }
DelphiFunctionHeaderNode >> type: aDelphiProgramNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aDelphiProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
