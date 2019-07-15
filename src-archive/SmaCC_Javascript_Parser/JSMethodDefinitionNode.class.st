Class {
	#name : #JSMethodDefinitionNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'name',
		'left',
		'restParameter',
		'parameters',
		'commas',
		'right',
		'leftBrace',
		'statements',
		'rightBrace'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSMethodDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMethodDefinition: self
]

{ #category : #generated }
JSMethodDefinitionNode >> commas [
	^ commas
]

{ #category : #generated }
JSMethodDefinitionNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JSMethodDefinitionNode >> compositeNodeVariables [
	^ #(#parameters #statements)
]

{ #category : #generated }
JSMethodDefinitionNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
JSMethodDefinitionNode >> ignoredTokenVariables [
	^ #(#left #right #leftBrace #rightBrace)
]

{ #category : #'generated-initialize-release' }
JSMethodDefinitionNode >> initialize [
	super initialize.
	parameters := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
JSMethodDefinitionNode >> left [
	^ left
]

{ #category : #generated }
JSMethodDefinitionNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
JSMethodDefinitionNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JSMethodDefinitionNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JSMethodDefinitionNode >> name [
	^ name
]

{ #category : #generated }
JSMethodDefinitionNode >> name: aJSProgramNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aJSProgramNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
JSMethodDefinitionNode >> nodeVariables [
	^ #(#name #restParameter)
]

{ #category : #generated }
JSMethodDefinitionNode >> parameters [
	^ parameters
]

{ #category : #generated }
JSMethodDefinitionNode >> parameters: anOrderedCollection [
	self setParents: self parameters to: nil.
	parameters := anOrderedCollection.
	self setParents: self parameters to: self
]

{ #category : #generated }
JSMethodDefinitionNode >> restParameter [
	^ restParameter
]

{ #category : #generated }
JSMethodDefinitionNode >> restParameter: aJSRestVariableDeclarationNode [
	self restParameter notNil
		ifTrue: [ self restParameter parent: nil ].
	restParameter := aJSRestVariableDeclarationNode.
	self restParameter notNil
		ifTrue: [ self restParameter parent: self ]
]

{ #category : #generated }
JSMethodDefinitionNode >> right [
	^ right
]

{ #category : #generated }
JSMethodDefinitionNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
JSMethodDefinitionNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JSMethodDefinitionNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
JSMethodDefinitionNode >> statements [
	^ statements
]

{ #category : #generated }
JSMethodDefinitionNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]
