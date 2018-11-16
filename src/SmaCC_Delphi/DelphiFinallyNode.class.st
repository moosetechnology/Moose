Class {
	#name : #DelphiFinallyNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'finallyToken',
		'statements',
		'semicolons'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiFinallyNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFinally: self
]

{ #category : #generated }
DelphiFinallyNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
DelphiFinallyNode >> finallyToken [
	^ finallyToken
]

{ #category : #generated }
DelphiFinallyNode >> finallyToken: aSmaCCToken [
	finallyToken := aSmaCCToken
]

{ #category : #generated }
DelphiFinallyNode >> ignoredCompositeTokenVariables [
	^ #(#semicolons)
]

{ #category : #'generated-initialize-release' }
DelphiFinallyNode >> initialize [
	super initialize.
	statements := OrderedCollection new: 2.
	semicolons := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiFinallyNode >> semicolons [
	^ semicolons
]

{ #category : #generated }
DelphiFinallyNode >> semicolons: anOrderedCollection [
	semicolons := anOrderedCollection
]

{ #category : #generated }
DelphiFinallyNode >> statements [
	^ statements
]

{ #category : #generated }
DelphiFinallyNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
DelphiFinallyNode >> tokenVariables [
	^ #(#finallyToken)
]
