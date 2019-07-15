Class {
	#name : #DelphiMultiStatementNode,
	#superclass : #DelphiStatementNode,
	#instVars : [
		'semicolons',
		'statements'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiMultiStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMultiStatement: self
]

{ #category : #generated }
DelphiMultiStatementNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
DelphiMultiStatementNode >> ignoredCompositeTokenVariables [
	^ #(#semicolons)
]

{ #category : #'generated-initialize-release' }
DelphiMultiStatementNode >> initialize [
	super initialize.
	semicolons := OrderedCollection new: 2.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiMultiStatementNode >> semicolons [
	^ semicolons
]

{ #category : #generated }
DelphiMultiStatementNode >> semicolons: anOrderedCollection [
	semicolons := anOrderedCollection
]

{ #category : #generated }
DelphiMultiStatementNode >> statements [
	^ statements
]

{ #category : #generated }
DelphiMultiStatementNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]
