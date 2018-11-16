Class {
	#name : #DelphiInstantiatedGenericTypeNode,
	#superclass : #DelphiTypeNode,
	#instVars : [
		'type',
		'left',
		'typeArguments',
		'commas',
		'right'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiInstantiatedGenericTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitInstantiatedGenericType: self
]

{ #category : #generated }
DelphiInstantiatedGenericTypeNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiInstantiatedGenericTypeNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiInstantiatedGenericTypeNode >> compositeNodeVariables [
	^ #(#typeArguments)
]

{ #category : #generated }
DelphiInstantiatedGenericTypeNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #'generated-initialize-release' }
DelphiInstantiatedGenericTypeNode >> initialize [
	super initialize.
	typeArguments := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiInstantiatedGenericTypeNode >> left [
	^ left
]

{ #category : #generated }
DelphiInstantiatedGenericTypeNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiInstantiatedGenericTypeNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
DelphiInstantiatedGenericTypeNode >> right [
	^ right
]

{ #category : #generated }
DelphiInstantiatedGenericTypeNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiInstantiatedGenericTypeNode >> tokenVariables [
	^ #(#left #right)
]

{ #category : #generated }
DelphiInstantiatedGenericTypeNode >> type [
	^ type
]

{ #category : #generated }
DelphiInstantiatedGenericTypeNode >> type: aDelphiProgramNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aDelphiProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]

{ #category : #generated }
DelphiInstantiatedGenericTypeNode >> typeArguments [
	^ typeArguments
]

{ #category : #generated }
DelphiInstantiatedGenericTypeNode >> typeArguments: anOrderedCollection [
	self setParents: self typeArguments to: nil.
	typeArguments := anOrderedCollection.
	self setParents: self typeArguments to: self
]
