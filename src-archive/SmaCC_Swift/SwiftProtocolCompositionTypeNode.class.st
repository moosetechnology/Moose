Class {
	#name : #SwiftProtocolCompositionTypeNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'protocolToken',
		'lessThanTokens',
		'identifierTokens',
		'periodTokens',
		'commaTokens',
		'greaterThanTokens'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftProtocolCompositionTypeNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitProtocolCompositionType: self
]

{ #category : #generated }
SwiftProtocolCompositionTypeNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftProtocolCompositionTypeNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolCompositionTypeNode >> compositeTokenVariables [
	^ #(#lessThanTokens #periodTokens #commaTokens #identifierTokens #greaterThanTokens)
]

{ #category : #generated }
SwiftProtocolCompositionTypeNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftProtocolCompositionTypeNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolCompositionTypeNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftProtocolCompositionTypeNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftProtocolCompositionTypeNode >> initialize [
	super initialize.
	lessThanTokens := OrderedCollection new: 2.
	periodTokens := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	identifierTokens := OrderedCollection new: 2.
	greaterThanTokens := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftProtocolCompositionTypeNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftProtocolCompositionTypeNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolCompositionTypeNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftProtocolCompositionTypeNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolCompositionTypeNode >> protocolToken [
	^ protocolToken
]

{ #category : #generated }
SwiftProtocolCompositionTypeNode >> protocolToken: aSmaCCToken [
	protocolToken := aSmaCCToken
]

{ #category : #generated }
SwiftProtocolCompositionTypeNode >> tokenVariables [
	^ #(#protocolToken)
]
