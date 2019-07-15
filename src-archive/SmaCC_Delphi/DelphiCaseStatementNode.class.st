Class {
	#name : #DelphiCaseStatementNode,
	#superclass : #DelphiMultiStatementNode,
	#instVars : [
		'caseToken',
		'expression',
		'ofToken',
		'options',
		'elseToken',
		'endToken'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiCaseStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitCaseStatement: self
]

{ #category : #generated }
DelphiCaseStatementNode >> caseToken [
	^ caseToken
]

{ #category : #generated }
DelphiCaseStatementNode >> caseToken: aSmaCCToken [
	caseToken := aSmaCCToken
]

{ #category : #generated }
DelphiCaseStatementNode >> compositeNodeVariables [
	^ #(#options #statements)
]

{ #category : #generated }
DelphiCaseStatementNode >> elseToken [
	^ elseToken
]

{ #category : #generated }
DelphiCaseStatementNode >> elseToken: aSmaCCToken [
	elseToken := aSmaCCToken
]

{ #category : #generated }
DelphiCaseStatementNode >> endToken [
	^ endToken
]

{ #category : #generated }
DelphiCaseStatementNode >> endToken: aSmaCCToken [
	endToken := aSmaCCToken
]

{ #category : #generated }
DelphiCaseStatementNode >> expression [
	^ expression
]

{ #category : #generated }
DelphiCaseStatementNode >> expression: aDelphiExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aDelphiExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #'generated-initialize-release' }
DelphiCaseStatementNode >> initialize [
	super initialize.
	options := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiCaseStatementNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
DelphiCaseStatementNode >> ofToken [
	^ ofToken
]

{ #category : #generated }
DelphiCaseStatementNode >> ofToken: aSmaCCToken [
	ofToken := aSmaCCToken
]

{ #category : #generated }
DelphiCaseStatementNode >> options [
	^ options
]

{ #category : #generated }
DelphiCaseStatementNode >> options: anOrderedCollection [
	self setParents: self options to: nil.
	options := anOrderedCollection.
	self setParents: self options to: self
]

{ #category : #generated }
DelphiCaseStatementNode >> tokenVariables [
	^ #(#caseToken #ofToken #elseToken #endToken)
]
