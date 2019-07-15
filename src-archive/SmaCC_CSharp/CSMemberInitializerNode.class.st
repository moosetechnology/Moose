Class {
	#name : #CSMemberInitializerNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'identifier',
		'leftBracketToken',
		'arguments',
		'commaTokens',
		'rightBracketToken',
		'equalToken',
		'value'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSMemberInitializerNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMemberInitializer: self
]

{ #category : #generated }
CSMemberInitializerNode >> arguments [
	^ arguments
]

{ #category : #generated }
CSMemberInitializerNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
CSMemberInitializerNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CSMemberInitializerNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CSMemberInitializerNode >> compositeNodeVariables [
	^ #(#arguments)
]

{ #category : #generated }
CSMemberInitializerNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
CSMemberInitializerNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
CSMemberInitializerNode >> identifier [
	^ identifier
]

{ #category : #generated }
CSMemberInitializerNode >> identifier: aSmaCCToken [
	identifier := aSmaCCToken
]

{ #category : #generated }
CSMemberInitializerNode >> ignoredCompositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #'generated-initialize-release' }
CSMemberInitializerNode >> initialize [
	super initialize.
	arguments := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CSMemberInitializerNode >> leftBracketToken [
	^ leftBracketToken
]

{ #category : #generated }
CSMemberInitializerNode >> leftBracketToken: aSmaCCToken [
	leftBracketToken := aSmaCCToken
]

{ #category : #generated }
CSMemberInitializerNode >> nodeVariables [
	^ #(#value)
]

{ #category : #generated }
CSMemberInitializerNode >> rightBracketToken [
	^ rightBracketToken
]

{ #category : #generated }
CSMemberInitializerNode >> rightBracketToken: aSmaCCToken [
	rightBracketToken := aSmaCCToken
]

{ #category : #generated }
CSMemberInitializerNode >> tokenVariables [
	^ #(#identifier #leftBracketToken #rightBracketToken #equalToken)
]

{ #category : #generated }
CSMemberInitializerNode >> value [
	^ value
]

{ #category : #generated }
CSMemberInitializerNode >> value: aCSProgramNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aCSProgramNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]
