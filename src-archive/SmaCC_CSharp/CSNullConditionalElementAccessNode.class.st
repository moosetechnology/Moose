Class {
	#name : #CSNullConditionalElementAccessNode,
	#superclass : #CSElementAccessNode,
	#instVars : [
		'baseOperations',
		'questionMarkToken',
		'arguments'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSNullConditionalElementAccessNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNullConditionalElementAccess: self
]

{ #category : #generated }
CSNullConditionalElementAccessNode >> arguments [
	^ arguments
]

{ #category : #generated }
CSNullConditionalElementAccessNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
CSNullConditionalElementAccessNode >> baseOperations [
	^ baseOperations
]

{ #category : #generated }
CSNullConditionalElementAccessNode >> baseOperations: aCSExpressionNode [
	self baseOperations notNil
		ifTrue: [ self baseOperations parent: nil ].
	baseOperations := aCSExpressionNode.
	self baseOperations notNil
		ifTrue: [ self baseOperations parent: self ]
]

{ #category : #generated }
CSNullConditionalElementAccessNode >> compositeNodeVariables [
	^ #(#arguments #expressions)
]

{ #category : #'generated-initialize-release' }
CSNullConditionalElementAccessNode >> initialize [
	super initialize.
	arguments := OrderedCollection new: 2.
]

{ #category : #generated }
CSNullConditionalElementAccessNode >> nodeVariables [
	^ #(#baseOperations #baseExpression)
]

{ #category : #generated }
CSNullConditionalElementAccessNode >> questionMarkToken [
	^ questionMarkToken
]

{ #category : #generated }
CSNullConditionalElementAccessNode >> questionMarkToken: aSmaCCToken [
	questionMarkToken := aSmaCCToken
]

{ #category : #generated }
CSNullConditionalElementAccessNode >> tokenVariables [
	^ #(#questionMarkToken #leftBracketToken #rightBracketToken)
]
