Class {
	#name : #DelphiExceptNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'exceptToken',
		'exceptionCases',
		'else',
		'statements',
		'semicolons'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiExceptNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitExcept: self
]

{ #category : #generated }
DelphiExceptNode >> compositeNodeVariables [
	^ #(#exceptionCases #statements)
]

{ #category : #generated }
DelphiExceptNode >> else [
	^ else
]

{ #category : #generated }
DelphiExceptNode >> else: aDelphiExceptElseNode [
	self else notNil
		ifTrue: [ self else parent: nil ].
	else := aDelphiExceptElseNode.
	self else notNil
		ifTrue: [ self else parent: self ]
]

{ #category : #generated }
DelphiExceptNode >> exceptToken [
	^ exceptToken
]

{ #category : #generated }
DelphiExceptNode >> exceptToken: aSmaCCToken [
	exceptToken := aSmaCCToken
]

{ #category : #generated }
DelphiExceptNode >> exceptionCases [
	^ exceptionCases
]

{ #category : #generated }
DelphiExceptNode >> exceptionCases: anOrderedCollection [
	self setParents: self exceptionCases to: nil.
	exceptionCases := anOrderedCollection.
	self setParents: self exceptionCases to: self
]

{ #category : #generated }
DelphiExceptNode >> ignoredCompositeTokenVariables [
	^ #(#semicolons)
]

{ #category : #'generated-initialize-release' }
DelphiExceptNode >> initialize [
	super initialize.
	exceptionCases := OrderedCollection new: 2.
	statements := OrderedCollection new: 2.
	semicolons := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiExceptNode >> nodeVariables [
	^ #(#else)
]

{ #category : #generated }
DelphiExceptNode >> semicolons [
	^ semicolons
]

{ #category : #generated }
DelphiExceptNode >> semicolons: anOrderedCollection [
	semicolons := anOrderedCollection
]

{ #category : #generated }
DelphiExceptNode >> statements [
	^ statements
]

{ #category : #generated }
DelphiExceptNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
DelphiExceptNode >> tokenVariables [
	^ #(#exceptToken)
]
