Class {
	#name : #DelphiMessageMethodModifierNode,
	#superclass : #DelphiMethodModifierNode,
	#instVars : [
		'expression'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiMessageMethodModifierNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMessageMethodModifier: self
]

{ #category : #generated }
DelphiMessageMethodModifierNode >> expression [
	^ expression
]

{ #category : #generated }
DelphiMessageMethodModifierNode >> expression: aDelphiExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aDelphiExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
DelphiMessageMethodModifierNode >> nodeVariables [
	^ #(#expression)
]
