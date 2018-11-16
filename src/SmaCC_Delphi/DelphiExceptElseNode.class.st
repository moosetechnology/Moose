Class {
	#name : #DelphiExceptElseNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'elseToken',
		'statements',
		'semicolons'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiExceptElseNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitExceptElse: self
]

{ #category : #generated }
DelphiExceptElseNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
DelphiExceptElseNode >> elseToken [
	^ elseToken
]

{ #category : #generated }
DelphiExceptElseNode >> elseToken: aSmaCCToken [
	elseToken := aSmaCCToken
]

{ #category : #generated }
DelphiExceptElseNode >> ignoredCompositeTokenVariables [
	^ #(#semicolons)
]

{ #category : #'generated-initialize-release' }
DelphiExceptElseNode >> initialize [
	super initialize.
	statements := OrderedCollection new: 2.
	semicolons := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiExceptElseNode >> semicolons [
	^ semicolons
]

{ #category : #generated }
DelphiExceptElseNode >> semicolons: anOrderedCollection [
	semicolons := anOrderedCollection
]

{ #category : #generated }
DelphiExceptElseNode >> statements [
	^ statements
]

{ #category : #generated }
DelphiExceptElseNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
DelphiExceptElseNode >> tokenVariables [
	^ #(#elseToken)
]
