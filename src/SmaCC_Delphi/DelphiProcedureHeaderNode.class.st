Class {
	#name : #DelphiProcedureHeaderNode,
	#superclass : #DelphiMethodHeaderNode,
	#instVars : [
		'procedureToken',
		'arguments',
		'semicolons'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiProcedureHeaderNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitProcedureHeader: self
]

{ #category : #generated }
DelphiProcedureHeaderNode >> arguments [
	^ arguments
]

{ #category : #generated }
DelphiProcedureHeaderNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
DelphiProcedureHeaderNode >> compositeNodeVariables [
	^ #(#arguments #modifiers)
]

{ #category : #generated }
DelphiProcedureHeaderNode >> ignoredCompositeTokenVariables [
	^ #(#semicolons)
]

{ #category : #'generated-initialize-release' }
DelphiProcedureHeaderNode >> initialize [
	super initialize.
	arguments := OrderedCollection new: 2.
	semicolons := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiProcedureHeaderNode >> procedureToken [
	^ procedureToken
]

{ #category : #generated }
DelphiProcedureHeaderNode >> procedureToken: aSmaCCToken [
	procedureToken := aSmaCCToken
]

{ #category : #generated }
DelphiProcedureHeaderNode >> semicolons [
	^ semicolons
]

{ #category : #generated }
DelphiProcedureHeaderNode >> semicolons: anOrderedCollection [
	semicolons := anOrderedCollection
]

{ #category : #generated }
DelphiProcedureHeaderNode >> tokenVariables [
	^ #(#procedureToken #left #right)
]
