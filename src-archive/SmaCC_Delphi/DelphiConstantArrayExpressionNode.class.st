Class {
	#name : #DelphiConstantArrayExpressionNode,
	#superclass : #DelphiExpressionNode,
	#instVars : [
		'left',
		'expressions',
		'equalTokens',
		'values',
		'commas',
		'right'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiConstantArrayExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitConstantArrayExpression: self
]

{ #category : #generated }
DelphiConstantArrayExpressionNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiConstantArrayExpressionNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiConstantArrayExpressionNode >> compositeNodeVariables [
	^ #(#expressions #values)
]

{ #category : #generated }
DelphiConstantArrayExpressionNode >> compositeTokenVariables [
	^ #(#equalTokens)
]

{ #category : #generated }
DelphiConstantArrayExpressionNode >> equalTokens [
	^ equalTokens
]

{ #category : #generated }
DelphiConstantArrayExpressionNode >> equalTokens: anOrderedCollection [
	equalTokens := anOrderedCollection
]

{ #category : #generated }
DelphiConstantArrayExpressionNode >> expressions [
	^ expressions
]

{ #category : #generated }
DelphiConstantArrayExpressionNode >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #generated }
DelphiConstantArrayExpressionNode >> ignoredCompositeTokenVariables [
	^ #(#commas #leftParens #rightParens)
]

{ #category : #'generated-initialize-release' }
DelphiConstantArrayExpressionNode >> initialize [
	super initialize.
	expressions := OrderedCollection new: 2.
	equalTokens := OrderedCollection new: 2.
	values := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiConstantArrayExpressionNode >> left [
	^ left
]

{ #category : #generated }
DelphiConstantArrayExpressionNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiConstantArrayExpressionNode >> right [
	^ right
]

{ #category : #generated }
DelphiConstantArrayExpressionNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiConstantArrayExpressionNode >> tokenVariables [
	^ #(#left #right)
]

{ #category : #generated }
DelphiConstantArrayExpressionNode >> values [
	^ values
]

{ #category : #generated }
DelphiConstantArrayExpressionNode >> values: anOrderedCollection [
	self setParents: self values to: nil.
	values := anOrderedCollection.
	self setParents: self values to: self
]
