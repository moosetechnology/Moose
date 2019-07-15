Class {
	#name : #JSVariablePatternDeclarationNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'pattern',
		'equalToken',
		'value'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSVariablePatternDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitVariablePatternDeclaration: self
]

{ #category : #generated }
JSVariablePatternDeclarationNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
JSVariablePatternDeclarationNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
JSVariablePatternDeclarationNode >> nodeVariables [
	^ #(#pattern #value)
]

{ #category : #generated }
JSVariablePatternDeclarationNode >> pattern [
	^ pattern
]

{ #category : #generated }
JSVariablePatternDeclarationNode >> pattern: aJSProgramNode [
	self pattern notNil
		ifTrue: [ self pattern parent: nil ].
	pattern := aJSProgramNode.
	self pattern notNil
		ifTrue: [ self pattern parent: self ]
]

{ #category : #generated }
JSVariablePatternDeclarationNode >> tokenVariables [
	^ #(#equalToken)
]

{ #category : #generated }
JSVariablePatternDeclarationNode >> value [
	^ value
]

{ #category : #generated }
JSVariablePatternDeclarationNode >> value: aJSExpressionNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aJSExpressionNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]
