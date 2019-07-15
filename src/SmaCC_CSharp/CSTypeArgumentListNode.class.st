Class {
	#name : #CSTypeArgumentListNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'lessThanToken',
		'types',
		'commaTokens',
		'greaterThanToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSTypeArgumentListNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitTypeArgumentList: self
]

{ #category : #generated }
CSTypeArgumentListNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CSTypeArgumentListNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CSTypeArgumentListNode >> compositeNodeVariables [
	^ #(#types)
]

{ #category : #generated }
CSTypeArgumentListNode >> greaterThanToken [
	^ greaterThanToken
]

{ #category : #generated }
CSTypeArgumentListNode >> greaterThanToken: aSmaCCToken [
	greaterThanToken := aSmaCCToken
]

{ #category : #generated }
CSTypeArgumentListNode >> ignoredCompositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #'generated-initialize-release' }
CSTypeArgumentListNode >> initialize [
	super initialize.
	types := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CSTypeArgumentListNode >> lessThanToken [
	^ lessThanToken
]

{ #category : #generated }
CSTypeArgumentListNode >> lessThanToken: aSmaCCToken [
	lessThanToken := aSmaCCToken
]

{ #category : #generated }
CSTypeArgumentListNode >> tokenVariables [
	^ #(#lessThanToken #greaterThanToken)
]

{ #category : #generated }
CSTypeArgumentListNode >> types [
	^ types
]

{ #category : #generated }
CSTypeArgumentListNode >> types: anOrderedCollection [
	self setParents: self types to: nil.
	types := anOrderedCollection.
	self setParents: self types to: self
]
