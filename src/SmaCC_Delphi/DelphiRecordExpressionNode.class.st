Class {
	#name : #DelphiRecordExpressionNode,
	#superclass : #DelphiExpressionNode,
	#instVars : [
		'left',
		'fields',
		'semicolons',
		'right'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiRecordExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitRecordExpression: self
]

{ #category : #generated }
DelphiRecordExpressionNode >> compositeNodeVariables [
	^ #(#fields)
]

{ #category : #generated }
DelphiRecordExpressionNode >> fields [
	^ fields
]

{ #category : #generated }
DelphiRecordExpressionNode >> fields: anOrderedCollection [
	self setParents: self fields to: nil.
	fields := anOrderedCollection.
	self setParents: self fields to: self
]

{ #category : #generated }
DelphiRecordExpressionNode >> ignoredCompositeTokenVariables [
	^ #(#semicolons #leftParens #rightParens)
]

{ #category : #'generated-initialize-release' }
DelphiRecordExpressionNode >> initialize [
	super initialize.
	fields := OrderedCollection new: 2.
	semicolons := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiRecordExpressionNode >> left [
	^ left
]

{ #category : #generated }
DelphiRecordExpressionNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiRecordExpressionNode >> right [
	^ right
]

{ #category : #generated }
DelphiRecordExpressionNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiRecordExpressionNode >> semicolons [
	^ semicolons
]

{ #category : #generated }
DelphiRecordExpressionNode >> semicolons: anOrderedCollection [
	semicolons := anOrderedCollection
]

{ #category : #generated }
DelphiRecordExpressionNode >> tokenVariables [
	^ #(#left #right)
]
