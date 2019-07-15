Class {
	#name : #CSUnboundTypeNameNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'identifierTokens',
		'lessThanTokens',
		'commas',
		'gtTokens',
		'colonColonToken',
		'periodTokens'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSUnboundTypeNameNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitUnboundTypeName: self
]

{ #category : #generated }
CSUnboundTypeNameNode >> colonColonToken [
	^ colonColonToken
]

{ #category : #generated }
CSUnboundTypeNameNode >> colonColonToken: aSmaCCToken [
	colonColonToken := aSmaCCToken
]

{ #category : #generated }
CSUnboundTypeNameNode >> commas [
	^ commas
]

{ #category : #generated }
CSUnboundTypeNameNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
CSUnboundTypeNameNode >> compositeTokenVariables [
	^ #(#identifierTokens #lessThanTokens #commas #gtTokens #periodTokens)
]

{ #category : #generated }
CSUnboundTypeNameNode >> gtTokens [
	^ gtTokens
]

{ #category : #generated }
CSUnboundTypeNameNode >> gtTokens: anOrderedCollection [
	gtTokens := anOrderedCollection
]

{ #category : #generated }
CSUnboundTypeNameNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
CSUnboundTypeNameNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
CSUnboundTypeNameNode >> initialize [
	super initialize.
	identifierTokens := OrderedCollection new: 2.
	lessThanTokens := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
	gtTokens := OrderedCollection new: 2.
	periodTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CSUnboundTypeNameNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
CSUnboundTypeNameNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
CSUnboundTypeNameNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
CSUnboundTypeNameNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
CSUnboundTypeNameNode >> tokenVariables [
	^ #(#colonColonToken)
]
