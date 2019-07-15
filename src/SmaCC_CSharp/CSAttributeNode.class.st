Class {
	#name : #CSAttributeNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'leftBracket',
		'target',
		'colon',
		'attributeValues',
		'commas',
		'rightBracket'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSAttributeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAttribute: self
]

{ #category : #generated }
CSAttributeNode >> attributeValues [
	^ attributeValues
]

{ #category : #generated }
CSAttributeNode >> attributeValues: anOrderedCollection [
	self setParents: self attributeValues to: nil.
	attributeValues := anOrderedCollection.
	self setParents: self attributeValues to: self
]

{ #category : #generated }
CSAttributeNode >> colon [
	^ colon
]

{ #category : #generated }
CSAttributeNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
CSAttributeNode >> commas [
	^ commas
]

{ #category : #generated }
CSAttributeNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
CSAttributeNode >> compositeNodeVariables [
	^ #(#attributeValues)
]

{ #category : #generated }
CSAttributeNode >> compositeTokenVariables [
	^ #(#commas)
]

{ #category : #'generated-initialize-release' }
CSAttributeNode >> initialize [
	super initialize.
	attributeValues := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
CSAttributeNode >> leftBracket [
	^ leftBracket
]

{ #category : #generated }
CSAttributeNode >> leftBracket: aSmaCCToken [
	leftBracket := aSmaCCToken
]

{ #category : #generated }
CSAttributeNode >> rightBracket [
	^ rightBracket
]

{ #category : #generated }
CSAttributeNode >> rightBracket: aSmaCCToken [
	rightBracket := aSmaCCToken
]

{ #category : #generated }
CSAttributeNode >> target [
	^ target
]

{ #category : #generated }
CSAttributeNode >> target: aSmaCCToken [
	target := aSmaCCToken
]

{ #category : #generated }
CSAttributeNode >> tokenVariables [
	^ #(#leftBracket #target #colon #rightBracket)
]
