Class {
	#name : #SwiftTypeIdentifierNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'identifierTokens',
		'lessThanTokens',
		'commaTokens',
		'greaterThanTokens',
		'periodTokens'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftTypeIdentifierNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitTypeIdentifier: self
]

{ #category : #generated }
SwiftTypeIdentifierNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftTypeIdentifierNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypeIdentifierNode >> compositeTokenVariables [
	^ #(#identifierTokens #lessThanTokens #commaTokens #greaterThanTokens #periodTokens)
]

{ #category : #generated }
SwiftTypeIdentifierNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftTypeIdentifierNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypeIdentifierNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftTypeIdentifierNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftTypeIdentifierNode >> initialize [
	super initialize.
	identifierTokens := OrderedCollection new: 2.
	lessThanTokens := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	greaterThanTokens := OrderedCollection new: 2.
	periodTokens := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftTypeIdentifierNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftTypeIdentifierNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftTypeIdentifierNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftTypeIdentifierNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]
