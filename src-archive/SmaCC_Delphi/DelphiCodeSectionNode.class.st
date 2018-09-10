Class {
	#name : #DelphiCodeSectionNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'statements',
		'semicolons'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiCodeSectionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitCodeSection: self
]

{ #category : #generated }
DelphiCodeSectionNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
DelphiCodeSectionNode >> ignoredCompositeTokenVariables [
	^ #(#semicolons)
]

{ #category : #'generated-initialize-release' }
DelphiCodeSectionNode >> initialize [
	super initialize.
	statements := OrderedCollection new: 2.
	semicolons := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiCodeSectionNode >> semicolons [
	^ semicolons
]

{ #category : #generated }
DelphiCodeSectionNode >> semicolons: anOrderedCollection [
	semicolons := anOrderedCollection
]

{ #category : #generated }
DelphiCodeSectionNode >> statements [
	^ statements
]

{ #category : #generated }
DelphiCodeSectionNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]
