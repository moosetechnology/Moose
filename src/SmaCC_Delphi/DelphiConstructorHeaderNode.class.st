Class {
	#name : #DelphiConstructorHeaderNode,
	#superclass : #DelphiMethodHeaderNode,
	#instVars : [
		'constructorToken',
		'arguments',
		'semicolons'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiConstructorHeaderNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitConstructorHeader: self
]

{ #category : #generated }
DelphiConstructorHeaderNode >> arguments [
	^ arguments
]

{ #category : #generated }
DelphiConstructorHeaderNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
DelphiConstructorHeaderNode >> compositeNodeVariables [
	^ #(#arguments #modifiers)
]

{ #category : #generated }
DelphiConstructorHeaderNode >> constructorToken [
	^ constructorToken
]

{ #category : #generated }
DelphiConstructorHeaderNode >> constructorToken: aSmaCCToken [
	constructorToken := aSmaCCToken
]

{ #category : #generated }
DelphiConstructorHeaderNode >> ignoredCompositeTokenVariables [
	^ #(#semicolons)
]

{ #category : #'generated-initialize-release' }
DelphiConstructorHeaderNode >> initialize [
	super initialize.
	arguments := OrderedCollection new: 2.
	semicolons := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiConstructorHeaderNode >> semicolons [
	^ semicolons
]

{ #category : #generated }
DelphiConstructorHeaderNode >> semicolons: anOrderedCollection [
	semicolons := anOrderedCollection
]

{ #category : #generated }
DelphiConstructorHeaderNode >> tokenVariables [
	^ #(#constructorToken #left #right)
]
