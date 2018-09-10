Class {
	#name : #DelphiInstantiatedGenericVariableExpressionNode,
	#superclass : #DelphiVariableExpressionNode,
	#instVars : [
		'left',
		'typeArguments',
		'commas',
		'right'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiInstantiatedGenericVariableExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitInstantiatedGenericVariableExpression: self
]

{ #category : #generated }
DelphiInstantiatedGenericVariableExpressionNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiInstantiatedGenericVariableExpressionNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiInstantiatedGenericVariableExpressionNode >> compositeNodeVariables [
	^ #(#typeArguments)
]

{ #category : #generated }
DelphiInstantiatedGenericVariableExpressionNode >> ignoredCompositeTokenVariables [
	^ #(#commas #leftParens #rightParens)
]

{ #category : #'generated-initialize-release' }
DelphiInstantiatedGenericVariableExpressionNode >> initialize [
	super initialize.
	typeArguments := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiInstantiatedGenericVariableExpressionNode >> left [
	^ left
]

{ #category : #generated }
DelphiInstantiatedGenericVariableExpressionNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiInstantiatedGenericVariableExpressionNode >> right [
	^ right
]

{ #category : #generated }
DelphiInstantiatedGenericVariableExpressionNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiInstantiatedGenericVariableExpressionNode >> tokenVariables [
	^ #(#left #right #name)
]

{ #category : #generated }
DelphiInstantiatedGenericVariableExpressionNode >> typeArguments [
	^ typeArguments
]

{ #category : #generated }
DelphiInstantiatedGenericVariableExpressionNode >> typeArguments: anOrderedCollection [
	self setParents: self typeArguments to: nil.
	typeArguments := anOrderedCollection.
	self setParents: self typeArguments to: self
]
