Class {
	#name : #CSTypeParameterConstraintsClauseNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'whereToken',
		'parameter',
		'colon',
		'constraints',
		'commaTokens'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSTypeParameterConstraintsClauseNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitTypeParameterConstraintsClause: self
]

{ #category : #generated }
CSTypeParameterConstraintsClauseNode >> colon [
	^ colon
]

{ #category : #generated }
CSTypeParameterConstraintsClauseNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
CSTypeParameterConstraintsClauseNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CSTypeParameterConstraintsClauseNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CSTypeParameterConstraintsClauseNode >> compositeNodeVariables [
	^ #(#constraints)
]

{ #category : #generated }
CSTypeParameterConstraintsClauseNode >> constraints [
	^ constraints
]

{ #category : #generated }
CSTypeParameterConstraintsClauseNode >> constraints: anOrderedCollection [
	self setParents: self constraints to: nil.
	constraints := anOrderedCollection.
	self setParents: self constraints to: self
]

{ #category : #generated }
CSTypeParameterConstraintsClauseNode >> ignoredCompositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #'generated-initialize-release' }
CSTypeParameterConstraintsClauseNode >> initialize [
	super initialize.
	constraints := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CSTypeParameterConstraintsClauseNode >> nodeVariables [
	^ #(#parameter)
]

{ #category : #generated }
CSTypeParameterConstraintsClauseNode >> parameter [
	^ parameter
]

{ #category : #generated }
CSTypeParameterConstraintsClauseNode >> parameter: aCSTypeNameNode [
	self parameter notNil
		ifTrue: [ self parameter parent: nil ].
	parameter := aCSTypeNameNode.
	self parameter notNil
		ifTrue: [ self parameter parent: self ]
]

{ #category : #generated }
CSTypeParameterConstraintsClauseNode >> tokenVariables [
	^ #(#whereToken #colon)
]

{ #category : #generated }
CSTypeParameterConstraintsClauseNode >> whereToken [
	^ whereToken
]

{ #category : #generated }
CSTypeParameterConstraintsClauseNode >> whereToken: aSmaCCToken [
	whereToken := aSmaCCToken
]
