Class {
	#name : #JSDefaultClauseNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'defaultToken',
		'colonToken',
		'statements'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSDefaultClauseNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitDefaultClause: self
]

{ #category : #generated }
JSDefaultClauseNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
JSDefaultClauseNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
JSDefaultClauseNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
JSDefaultClauseNode >> defaultToken [
	^ defaultToken
]

{ #category : #generated }
JSDefaultClauseNode >> defaultToken: aSmaCCToken [
	defaultToken := aSmaCCToken
]

{ #category : #generated }
JSDefaultClauseNode >> ignoredTokenVariables [
	^ #(#colonToken)
]

{ #category : #'generated-initialize-release' }
JSDefaultClauseNode >> initialize [
	super initialize.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
JSDefaultClauseNode >> statements [
	^ statements
]

{ #category : #generated }
JSDefaultClauseNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
JSDefaultClauseNode >> tokenVariables [
	^ #(#defaultToken)
]
