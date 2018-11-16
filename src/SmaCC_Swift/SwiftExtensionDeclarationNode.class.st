Class {
	#name : #SwiftExtensionDeclarationNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'extensionToken',
		'identifierTokens',
		'lessThanTokens',
		'commaTokens',
		'greaterThanTokens',
		'periodTokens',
		'colonToken',
		'leftBraceToken',
		'declarations',
		'rightBraceToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftExtensionDeclarationNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitExtensionDeclaration: self
]

{ #category : #generated }
SwiftExtensionDeclarationNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
SwiftExtensionDeclarationNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
SwiftExtensionDeclarationNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftExtensionDeclarationNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExtensionDeclarationNode >> compositeNodeVariables [
	^ #(#declarations)
]

{ #category : #generated }
SwiftExtensionDeclarationNode >> compositeTokenVariables [
	^ #(#identifierTokens #lessThanTokens #commaTokens #greaterThanTokens #periodTokens)
]

{ #category : #generated }
SwiftExtensionDeclarationNode >> declarations [
	^ declarations
]

{ #category : #generated }
SwiftExtensionDeclarationNode >> declarations: anOrderedCollection [
	self setParents: self declarations to: nil.
	declarations := anOrderedCollection.
	self setParents: self declarations to: self
]

{ #category : #generated }
SwiftExtensionDeclarationNode >> extensionToken [
	^ extensionToken
]

{ #category : #generated }
SwiftExtensionDeclarationNode >> extensionToken: aSmaCCToken [
	extensionToken := aSmaCCToken
]

{ #category : #generated }
SwiftExtensionDeclarationNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftExtensionDeclarationNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExtensionDeclarationNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftExtensionDeclarationNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftExtensionDeclarationNode >> initialize [
	super initialize.
	identifierTokens := OrderedCollection new: 2.
	lessThanTokens := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	greaterThanTokens := OrderedCollection new: 2.
	periodTokens := OrderedCollection new: 2.
	declarations := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftExtensionDeclarationNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
SwiftExtensionDeclarationNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
SwiftExtensionDeclarationNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftExtensionDeclarationNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExtensionDeclarationNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftExtensionDeclarationNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftExtensionDeclarationNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
SwiftExtensionDeclarationNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
SwiftExtensionDeclarationNode >> tokenVariables [
	^ #(#extensionToken #colonToken #leftBraceToken #rightBraceToken)
]
