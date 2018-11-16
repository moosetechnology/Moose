Class {
	#name : #DelphiMethodAttributeNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'left',
		'expression',
		'right'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiMethodAttributeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMethodAttribute: self
]

{ #category : #generated }
DelphiMethodAttributeNode >> expression [
	^ expression
]

{ #category : #generated }
DelphiMethodAttributeNode >> expression: aDelphiExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aDelphiExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
DelphiMethodAttributeNode >> left [
	^ left
]

{ #category : #generated }
DelphiMethodAttributeNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiMethodAttributeNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
DelphiMethodAttributeNode >> right [
	^ right
]

{ #category : #generated }
DelphiMethodAttributeNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiMethodAttributeNode >> tokenVariables [
	^ #(#left #right)
]
