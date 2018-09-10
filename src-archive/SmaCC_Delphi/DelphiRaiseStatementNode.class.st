Class {
	#name : #DelphiRaiseStatementNode,
	#superclass : #DelphiStatementNode,
	#instVars : [
		'raiseToken',
		'expression',
		'atToken',
		'location'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiRaiseStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitRaiseStatement: self
]

{ #category : #generated }
DelphiRaiseStatementNode >> atToken [
	^ atToken
]

{ #category : #generated }
DelphiRaiseStatementNode >> atToken: aSmaCCToken [
	atToken := aSmaCCToken
]

{ #category : #generated }
DelphiRaiseStatementNode >> expression [
	^ expression
]

{ #category : #generated }
DelphiRaiseStatementNode >> expression: aDelphiExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aDelphiExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
DelphiRaiseStatementNode >> location [
	^ location
]

{ #category : #generated }
DelphiRaiseStatementNode >> location: aDelphiQualifiedNameNode [
	self location notNil
		ifTrue: [ self location parent: nil ].
	location := aDelphiQualifiedNameNode.
	self location notNil
		ifTrue: [ self location parent: self ]
]

{ #category : #generated }
DelphiRaiseStatementNode >> nodeVariables [
	^ #(#expression #location)
]

{ #category : #generated }
DelphiRaiseStatementNode >> raiseToken [
	^ raiseToken
]

{ #category : #generated }
DelphiRaiseStatementNode >> raiseToken: aSmaCCToken [
	raiseToken := aSmaCCToken
]

{ #category : #generated }
DelphiRaiseStatementNode >> tokenVariables [
	^ #(#raiseToken #atToken)
]
