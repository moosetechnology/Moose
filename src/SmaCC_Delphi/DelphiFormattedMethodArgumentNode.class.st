Class {
	#name : #DelphiFormattedMethodArgumentNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'argument',
		'colon',
		'formatExpression'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiFormattedMethodArgumentNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFormattedMethodArgument: self
]

{ #category : #generated }
DelphiFormattedMethodArgumentNode >> argument [
	^ argument
]

{ #category : #generated }
DelphiFormattedMethodArgumentNode >> argument: aDelphiProgramNode [
	self argument notNil
		ifTrue: [ self argument parent: nil ].
	argument := aDelphiProgramNode.
	self argument notNil
		ifTrue: [ self argument parent: self ]
]

{ #category : #generated }
DelphiFormattedMethodArgumentNode >> colon [
	^ colon
]

{ #category : #generated }
DelphiFormattedMethodArgumentNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
DelphiFormattedMethodArgumentNode >> formatExpression [
	^ formatExpression
]

{ #category : #generated }
DelphiFormattedMethodArgumentNode >> formatExpression: aDelphiExpressionNode [
	self formatExpression notNil
		ifTrue: [ self formatExpression parent: nil ].
	formatExpression := aDelphiExpressionNode.
	self formatExpression notNil
		ifTrue: [ self formatExpression parent: self ]
]

{ #category : #generated }
DelphiFormattedMethodArgumentNode >> nodeVariables [
	^ #(#argument #formatExpression)
]

{ #category : #generated }
DelphiFormattedMethodArgumentNode >> tokenVariables [
	^ #(#colon)
]
