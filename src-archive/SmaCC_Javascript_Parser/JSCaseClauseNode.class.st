Class {
	#name : #JSCaseClauseNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'caseToken',
		'caseExpression',
		'colonToken',
		'statements'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSCaseClauseNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitCaseClause: self
]

{ #category : #generated }
JSCaseClauseNode >> caseExpression [
	^ caseExpression
]

{ #category : #generated }
JSCaseClauseNode >> caseExpression: aJSExpressionNode [
	self caseExpression notNil
		ifTrue: [ self caseExpression parent: nil ].
	caseExpression := aJSExpressionNode.
	self caseExpression notNil
		ifTrue: [ self caseExpression parent: self ]
]

{ #category : #generated }
JSCaseClauseNode >> caseToken [
	^ caseToken
]

{ #category : #generated }
JSCaseClauseNode >> caseToken: aSmaCCToken [
	caseToken := aSmaCCToken
]

{ #category : #generated }
JSCaseClauseNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
JSCaseClauseNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
JSCaseClauseNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
JSCaseClauseNode >> ignoredTokenVariables [
	^ #(#colonToken)
]

{ #category : #'generated-initialize-release' }
JSCaseClauseNode >> initialize [
	super initialize.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
JSCaseClauseNode >> nodeVariables [
	^ #(#caseExpression)
]

{ #category : #generated }
JSCaseClauseNode >> statements [
	^ statements
]

{ #category : #generated }
JSCaseClauseNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
JSCaseClauseNode >> tokenVariables [
	^ #(#caseToken)
]
