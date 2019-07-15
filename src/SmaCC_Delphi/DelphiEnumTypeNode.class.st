Class {
	#name : #DelphiEnumTypeNode,
	#superclass : #DelphiTypeNode,
	#instVars : [
		'left',
		'names',
		'commas',
		'right'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiEnumTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitEnumType: self
]

{ #category : #generated }
DelphiEnumTypeNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiEnumTypeNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiEnumTypeNode >> compositeNodeVariables [
	^ #(#names)
]

{ #category : #generated }
DelphiEnumTypeNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #'generated-initialize-release' }
DelphiEnumTypeNode >> initialize [
	super initialize.
	names := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiEnumTypeNode >> left [
	^ left
]

{ #category : #generated }
DelphiEnumTypeNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiEnumTypeNode >> names [
	^ names
]

{ #category : #generated }
DelphiEnumTypeNode >> names: anOrderedCollection [
	self setParents: self names to: nil.
	names := anOrderedCollection.
	self setParents: self names to: self
]

{ #category : #generated }
DelphiEnumTypeNode >> right [
	^ right
]

{ #category : #generated }
DelphiEnumTypeNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiEnumTypeNode >> tokenVariables [
	^ #(#left #right)
]
