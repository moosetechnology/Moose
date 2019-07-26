Class {
	#name : #CSQueryExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'fromTokens',
		'types',
		'identifierTokens',
		'inTokens',
		'expressions',
		'letTokens',
		'equalTokens',
		'whereTokens',
		'joinTokens',
		'joinInExpressions',
		'onTokens',
		'joinOnExpressions',
		'equalsTokens',
		'joinEqualsExpressions',
		'intoTokens',
		'orderbyTokens',
		'ascendingTokens',
		'descendingTokens',
		'commaTokens',
		'selectTokens',
		'groupTokens',
		'groupExpressions',
		'byTokens',
		'groupByExpressions'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSQueryExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitQueryExpression: self
]

{ #category : #generated }
CSQueryExpressionNode >> ascendingTokens [
	^ ascendingTokens
]

{ #category : #generated }
CSQueryExpressionNode >> ascendingTokens: anOrderedCollection [
	ascendingTokens := anOrderedCollection
]

{ #category : #generated }
CSQueryExpressionNode >> byTokens [
	^ byTokens
]

{ #category : #generated }
CSQueryExpressionNode >> byTokens: anOrderedCollection [
	byTokens := anOrderedCollection
]

{ #category : #generated }
CSQueryExpressionNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CSQueryExpressionNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CSQueryExpressionNode >> compositeNodeVariables [
	^ #(#types #expressions #joinInExpressions #joinOnExpressions #joinEqualsExpressions #groupExpressions #groupByExpressions)
]

{ #category : #generated }
CSQueryExpressionNode >> compositeTokenVariables [
	^ #(#fromTokens #identifierTokens #inTokens #letTokens #equalTokens #whereTokens #joinTokens #onTokens #equalsTokens #intoTokens #orderbyTokens #ascendingTokens #descendingTokens #selectTokens #groupTokens #byTokens)
]

{ #category : #generated }
CSQueryExpressionNode >> descendingTokens [
	^ descendingTokens
]

{ #category : #generated }
CSQueryExpressionNode >> descendingTokens: anOrderedCollection [
	descendingTokens := anOrderedCollection
]

{ #category : #generated }
CSQueryExpressionNode >> equalTokens [
	^ equalTokens
]

{ #category : #generated }
CSQueryExpressionNode >> equalTokens: anOrderedCollection [
	equalTokens := anOrderedCollection
]

{ #category : #generated }
CSQueryExpressionNode >> equalsTokens [
	^ equalsTokens
]

{ #category : #generated }
CSQueryExpressionNode >> equalsTokens: anOrderedCollection [
	equalsTokens := anOrderedCollection
]

{ #category : #generated }
CSQueryExpressionNode >> expressions [
	^ expressions
]

{ #category : #generated }
CSQueryExpressionNode >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #generated }
CSQueryExpressionNode >> fromTokens [
	^ fromTokens
]

{ #category : #generated }
CSQueryExpressionNode >> fromTokens: anOrderedCollection [
	fromTokens := anOrderedCollection
]

{ #category : #generated }
CSQueryExpressionNode >> groupByExpressions [
	^ groupByExpressions
]

{ #category : #generated }
CSQueryExpressionNode >> groupByExpressions: anOrderedCollection [
	self setParents: self groupByExpressions to: nil.
	groupByExpressions := anOrderedCollection.
	self setParents: self groupByExpressions to: self
]

{ #category : #generated }
CSQueryExpressionNode >> groupExpressions [
	^ groupExpressions
]

{ #category : #generated }
CSQueryExpressionNode >> groupExpressions: anOrderedCollection [
	self setParents: self groupExpressions to: nil.
	groupExpressions := anOrderedCollection.
	self setParents: self groupExpressions to: self
]

{ #category : #generated }
CSQueryExpressionNode >> groupTokens [
	^ groupTokens
]

{ #category : #generated }
CSQueryExpressionNode >> groupTokens: anOrderedCollection [
	groupTokens := anOrderedCollection
]

{ #category : #generated }
CSQueryExpressionNode >> identifierTokens [
	^ identifierTokens
]

{ #category : #generated }
CSQueryExpressionNode >> identifierTokens: anOrderedCollection [
	identifierTokens := anOrderedCollection
]

{ #category : #generated }
CSQueryExpressionNode >> ignoredCompositeTokenVariables [
	^ #(#commaTokens #_leftParens #_rightParens)
]

{ #category : #generated }
CSQueryExpressionNode >> inTokens [
	^ inTokens
]

{ #category : #generated }
CSQueryExpressionNode >> inTokens: anOrderedCollection [
	inTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
CSQueryExpressionNode >> initialize [
	super initialize.
	fromTokens := OrderedCollection new: 2.
	types := OrderedCollection new: 2.
	identifierTokens := OrderedCollection new: 2.
	inTokens := OrderedCollection new: 2.
	expressions := OrderedCollection new: 2.
	letTokens := OrderedCollection new: 2.
	equalTokens := OrderedCollection new: 2.
	whereTokens := OrderedCollection new: 2.
	joinTokens := OrderedCollection new: 2.
	joinInExpressions := OrderedCollection new: 2.
	onTokens := OrderedCollection new: 2.
	joinOnExpressions := OrderedCollection new: 2.
	equalsTokens := OrderedCollection new: 2.
	joinEqualsExpressions := OrderedCollection new: 2.
	intoTokens := OrderedCollection new: 2.
	orderbyTokens := OrderedCollection new: 2.
	ascendingTokens := OrderedCollection new: 2.
	descendingTokens := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	selectTokens := OrderedCollection new: 2.
	groupTokens := OrderedCollection new: 2.
	groupExpressions := OrderedCollection new: 2.
	byTokens := OrderedCollection new: 2.
	groupByExpressions := OrderedCollection new: 2.
]

{ #category : #generated }
CSQueryExpressionNode >> intoTokens [
	^ intoTokens
]

{ #category : #generated }
CSQueryExpressionNode >> intoTokens: anOrderedCollection [
	intoTokens := anOrderedCollection
]

{ #category : #generated }
CSQueryExpressionNode >> joinEqualsExpressions [
	^ joinEqualsExpressions
]

{ #category : #generated }
CSQueryExpressionNode >> joinEqualsExpressions: anOrderedCollection [
	self setParents: self joinEqualsExpressions to: nil.
	joinEqualsExpressions := anOrderedCollection.
	self setParents: self joinEqualsExpressions to: self
]

{ #category : #generated }
CSQueryExpressionNode >> joinInExpressions [
	^ joinInExpressions
]

{ #category : #generated }
CSQueryExpressionNode >> joinInExpressions: anOrderedCollection [
	self setParents: self joinInExpressions to: nil.
	joinInExpressions := anOrderedCollection.
	self setParents: self joinInExpressions to: self
]

{ #category : #generated }
CSQueryExpressionNode >> joinOnExpressions [
	^ joinOnExpressions
]

{ #category : #generated }
CSQueryExpressionNode >> joinOnExpressions: anOrderedCollection [
	self setParents: self joinOnExpressions to: nil.
	joinOnExpressions := anOrderedCollection.
	self setParents: self joinOnExpressions to: self
]

{ #category : #generated }
CSQueryExpressionNode >> joinTokens [
	^ joinTokens
]

{ #category : #generated }
CSQueryExpressionNode >> joinTokens: anOrderedCollection [
	joinTokens := anOrderedCollection
]

{ #category : #generated }
CSQueryExpressionNode >> letTokens [
	^ letTokens
]

{ #category : #generated }
CSQueryExpressionNode >> letTokens: anOrderedCollection [
	letTokens := anOrderedCollection
]

{ #category : #generated }
CSQueryExpressionNode >> onTokens [
	^ onTokens
]

{ #category : #generated }
CSQueryExpressionNode >> onTokens: anOrderedCollection [
	onTokens := anOrderedCollection
]

{ #category : #generated }
CSQueryExpressionNode >> orderbyTokens [
	^ orderbyTokens
]

{ #category : #generated }
CSQueryExpressionNode >> orderbyTokens: anOrderedCollection [
	orderbyTokens := anOrderedCollection
]

{ #category : #generated }
CSQueryExpressionNode >> selectTokens [
	^ selectTokens
]

{ #category : #generated }
CSQueryExpressionNode >> selectTokens: anOrderedCollection [
	selectTokens := anOrderedCollection
]

{ #category : #generated }
CSQueryExpressionNode >> types [
	^ types
]

{ #category : #generated }
CSQueryExpressionNode >> types: anOrderedCollection [
	self setParents: self types to: nil.
	types := anOrderedCollection.
	self setParents: self types to: self
]

{ #category : #generated }
CSQueryExpressionNode >> whereTokens [
	^ whereTokens
]

{ #category : #generated }
CSQueryExpressionNode >> whereTokens: anOrderedCollection [
	whereTokens := anOrderedCollection
]
