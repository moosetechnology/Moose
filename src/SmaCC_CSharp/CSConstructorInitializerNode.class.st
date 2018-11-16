Class {
	#name : #CSConstructorInitializerNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'colonToken',
		'baseToken',
		'leftParenToken',
		'arguments',
		'commaTokens',
		'rightParenToken',
		'thisToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSConstructorInitializerNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitConstructorInitializer: self
]

{ #category : #generated }
CSConstructorInitializerNode >> arguments [
	^ arguments
]

{ #category : #generated }
CSConstructorInitializerNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
CSConstructorInitializerNode >> baseToken [
	^ baseToken
]

{ #category : #generated }
CSConstructorInitializerNode >> baseToken: aSmaCCToken [
	baseToken := aSmaCCToken
]

{ #category : #generated }
CSConstructorInitializerNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
CSConstructorInitializerNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
CSConstructorInitializerNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CSConstructorInitializerNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CSConstructorInitializerNode >> compositeNodeVariables [
	^ #(#arguments)
]

{ #category : #generated }
CSConstructorInitializerNode >> ignoredCompositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #'generated-initialize-release' }
CSConstructorInitializerNode >> initialize [
	super initialize.
	arguments := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CSConstructorInitializerNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSConstructorInitializerNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSConstructorInitializerNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSConstructorInitializerNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSConstructorInitializerNode >> thisToken [
	^ thisToken
]

{ #category : #generated }
CSConstructorInitializerNode >> thisToken: aSmaCCToken [
	thisToken := aSmaCCToken
]

{ #category : #generated }
CSConstructorInitializerNode >> tokenVariables [
	^ #(#colonToken #baseToken #leftParenToken #rightParenToken #thisToken)
]
