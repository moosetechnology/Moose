Class {
	#name : #SwiftProtocolAssociationTypeDeclarationNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'typealiasToken',
		'identifierTokens',
		'colonTokens',
		'lessThanTokens',
		'commaTokens',
		'greaterThanTokens',
		'periodTokens',
		'equalToken',
		'leftBracketTokens',
		'protocolTokens',
		'rightBracketTokens',
		'minusGreaterThanTokens',
		'leftParenTokens',
		'rightParenTokens',
		'questionMarkTokens',
		'bangTokens',
		'typeTokens',
		'periodPeriodPeriodTokens',
		'inoutTokens',
		'_Tokens',
		'leftBraceTokens',
		'rightBraceTokens',
		'integer_literalTokens',
		'floating_point_literalTokens',
		'full_string_literalTokens',
		'operatorTokens'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitProtocolAssociationTypeDeclaration: self
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> bangTokens [
	^ bangTokens
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> bangTokens: anOrderedCollection [
	bangTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> compositeTokenVariables [
	^ #(#identifierTokens #colonTokens #lessThanTokens #greaterThanTokens #periodTokens #commaTokens #leftBracketTokens #rightBracketTokens #minusGreaterThanTokens #leftParenTokens #rightParenTokens #questionMarkTokens #bangTokens #protocolTokens #typeTokens #periodPeriodPeriodTokens #_Tokens #inoutTokens #leftBraceTokens #rightBraceTokens #integer_literalTokens #floating_point_literalTokens #full_string_literalTokens #operatorTokens)
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> floating_point_literalTokens [
	^ floating_point_literalTokens
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> floating_point_literalTokens: anOrderedCollection [
	floating_point_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> full_string_literalTokens [
	^ full_string_literalTokens
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> full_string_literalTokens: anOrderedCollection [
	full_string_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> greaterThanTokens [
	^ greaterThanTokens
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> greaterThanTokens: anOrderedCollection [
	greaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
SwiftProtocolAssociationTypeDeclarationNode >> initialize [
	super initialize.
	identifierTokens := OrderedCollection new: 2.
	colonTokens := OrderedCollection new: 2.
	lessThanTokens := OrderedCollection new: 2.
	greaterThanTokens := OrderedCollection new: 2.
	periodTokens := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	leftBracketTokens := OrderedCollection new: 2.
	rightBracketTokens := OrderedCollection new: 2.
	minusGreaterThanTokens := OrderedCollection new: 2.
	leftParenTokens := OrderedCollection new: 2.
	rightParenTokens := OrderedCollection new: 2.
	questionMarkTokens := OrderedCollection new: 2.
	bangTokens := OrderedCollection new: 2.
	protocolTokens := OrderedCollection new: 2.
	typeTokens := OrderedCollection new: 2.
	periodPeriodPeriodTokens := OrderedCollection new: 2.
	_Tokens := OrderedCollection new: 2.
	inoutTokens := OrderedCollection new: 2.
	leftBraceTokens := OrderedCollection new: 2.
	rightBraceTokens := OrderedCollection new: 2.
	integer_literalTokens := OrderedCollection new: 2.
	floating_point_literalTokens := OrderedCollection new: 2.
	full_string_literalTokens := OrderedCollection new: 2.
	operatorTokens := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> inoutTokens [
	^ inoutTokens
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> inoutTokens: anOrderedCollection [
	inoutTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> integer_literalTokens [
	^ integer_literalTokens
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> integer_literalTokens: anOrderedCollection [
	integer_literalTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> leftBraceTokens [
	^ leftBraceTokens
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> leftBraceTokens: anOrderedCollection [
	leftBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> leftBracketTokens [
	^ leftBracketTokens
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> leftBracketTokens: anOrderedCollection [
	leftBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> leftParenTokens [
	^ leftParenTokens
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> leftParenTokens: anOrderedCollection [
	leftParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> lessThanTokens [
	^ lessThanTokens
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> lessThanTokens: anOrderedCollection [
	lessThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> minusGreaterThanTokens [
	^ minusGreaterThanTokens
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> minusGreaterThanTokens: anOrderedCollection [
	minusGreaterThanTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> operatorTokens [
	^ operatorTokens
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> operatorTokens: anOrderedCollection [
	operatorTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> periodPeriodPeriodTokens [
	^ periodPeriodPeriodTokens
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> periodPeriodPeriodTokens: anOrderedCollection [
	periodPeriodPeriodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> protocolTokens [
	^ protocolTokens
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> protocolTokens: anOrderedCollection [
	protocolTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> questionMarkTokens [
	^ questionMarkTokens
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> questionMarkTokens: anOrderedCollection [
	questionMarkTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> rightBraceTokens [
	^ rightBraceTokens
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> rightBraceTokens: anOrderedCollection [
	rightBraceTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> rightBracketTokens [
	^ rightBracketTokens
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> rightBracketTokens: anOrderedCollection [
	rightBracketTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> rightParenTokens [
	^ rightParenTokens
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> rightParenTokens: anOrderedCollection [
	rightParenTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> tokenVariables [
	^ #(#typealiasToken #equalToken)
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> typeTokens [
	^ typeTokens
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> typeTokens: anOrderedCollection [
	typeTokens := anOrderedCollection
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> typealiasToken [
	^ typealiasToken
]

{ #category : #generated }
SwiftProtocolAssociationTypeDeclarationNode >> typealiasToken: aSmaCCToken [
	typealiasToken := aSmaCCToken
]
