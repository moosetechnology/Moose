Class {
	#name : #CSLocalConstantDeclarationNode,
	#superclass : #CSDeclarationNode,
	#instVars : [
		'constToken',
		'type',
		'declarators',
		'commaTokens'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSLocalConstantDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitLocalConstantDeclaration: self
]

{ #category : #generated }
CSLocalConstantDeclarationNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CSLocalConstantDeclarationNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CSLocalConstantDeclarationNode >> compositeNodeVariables [
	^ #(#declarators)
]

{ #category : #generated }
CSLocalConstantDeclarationNode >> constToken [
	^ constToken
]

{ #category : #generated }
CSLocalConstantDeclarationNode >> constToken: aSmaCCToken [
	constToken := aSmaCCToken
]

{ #category : #generated }
CSLocalConstantDeclarationNode >> declarators [
	^ declarators
]

{ #category : #generated }
CSLocalConstantDeclarationNode >> declarators: anOrderedCollection [
	self setParents: self declarators to: nil.
	declarators := anOrderedCollection.
	self setParents: self declarators to: self
]

{ #category : #generated }
CSLocalConstantDeclarationNode >> ignoredCompositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #'generated-initialize-release' }
CSLocalConstantDeclarationNode >> initialize [
	super initialize.
	declarators := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CSLocalConstantDeclarationNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
CSLocalConstantDeclarationNode >> tokenVariables [
	^ #(#constToken)
]

{ #category : #generated }
CSLocalConstantDeclarationNode >> type [
	^ type
]

{ #category : #generated }
CSLocalConstantDeclarationNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
