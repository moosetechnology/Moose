Class {
	#name : #DelphiArrayTypeNode,
	#superclass : #DelphiTypeNode,
	#instVars : [
		'packedToken',
		'arrayToken',
		'left',
		'indexes',
		'commas',
		'right',
		'ofToken',
		'type',
		'constToken'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiArrayTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitArrayType: self
]

{ #category : #generated }
DelphiArrayTypeNode >> arrayToken [
	^ arrayToken
]

{ #category : #generated }
DelphiArrayTypeNode >> arrayToken: aSmaCCToken [
	arrayToken := aSmaCCToken
]

{ #category : #generated }
DelphiArrayTypeNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiArrayTypeNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiArrayTypeNode >> compositeNodeVariables [
	^ #(#indexes)
]

{ #category : #generated }
DelphiArrayTypeNode >> constToken [
	^ constToken
]

{ #category : #generated }
DelphiArrayTypeNode >> constToken: aSmaCCToken [
	constToken := aSmaCCToken
]

{ #category : #generated }
DelphiArrayTypeNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
DelphiArrayTypeNode >> indexes [
	^ indexes
]

{ #category : #generated }
DelphiArrayTypeNode >> indexes: anOrderedCollection [
	self setParents: self indexes to: nil.
	indexes := anOrderedCollection.
	self setParents: self indexes to: self
]

{ #category : #'generated-initialize-release' }
DelphiArrayTypeNode >> initialize [
	super initialize.
	indexes := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiArrayTypeNode >> left [
	^ left
]

{ #category : #generated }
DelphiArrayTypeNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiArrayTypeNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
DelphiArrayTypeNode >> ofToken [
	^ ofToken
]

{ #category : #generated }
DelphiArrayTypeNode >> ofToken: aSmaCCToken [
	ofToken := aSmaCCToken
]

{ #category : #generated }
DelphiArrayTypeNode >> packedToken [
	^ packedToken
]

{ #category : #generated }
DelphiArrayTypeNode >> packedToken: aSmaCCToken [
	packedToken := aSmaCCToken
]

{ #category : #generated }
DelphiArrayTypeNode >> right [
	^ right
]

{ #category : #generated }
DelphiArrayTypeNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiArrayTypeNode >> tokenVariables [
	^ #(#packedToken #arrayToken #left #right #ofToken #constToken)
]

{ #category : #generated }
DelphiArrayTypeNode >> type [
	^ type
]

{ #category : #generated }
DelphiArrayTypeNode >> type: aDelphiProgramNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aDelphiProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
