Class {
	#name : #DelphiPropertyArrayAccessorsNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'left',
		'arguments',
		'semicolons',
		'right'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiPropertyArrayAccessorsNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPropertyArrayAccessors: self
]

{ #category : #generated }
DelphiPropertyArrayAccessorsNode >> arguments [
	^ arguments
]

{ #category : #generated }
DelphiPropertyArrayAccessorsNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
DelphiPropertyArrayAccessorsNode >> compositeNodeVariables [
	^ #(#arguments)
]

{ #category : #generated }
DelphiPropertyArrayAccessorsNode >> ignoredCompositeTokenVariables [
	^ #(#semicolons)
]

{ #category : #'generated-initialize-release' }
DelphiPropertyArrayAccessorsNode >> initialize [
	super initialize.
	arguments := OrderedCollection new: 2.
	semicolons := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiPropertyArrayAccessorsNode >> left [
	^ left
]

{ #category : #generated }
DelphiPropertyArrayAccessorsNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiPropertyArrayAccessorsNode >> right [
	^ right
]

{ #category : #generated }
DelphiPropertyArrayAccessorsNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiPropertyArrayAccessorsNode >> semicolons [
	^ semicolons
]

{ #category : #generated }
DelphiPropertyArrayAccessorsNode >> semicolons: anOrderedCollection [
	semicolons := anOrderedCollection
]

{ #category : #generated }
DelphiPropertyArrayAccessorsNode >> tokenVariables [
	^ #(#left #right)
]
