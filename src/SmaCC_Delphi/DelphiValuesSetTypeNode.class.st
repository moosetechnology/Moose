Class {
	#name : #DelphiValuesSetTypeNode,
	#superclass : #DelphiSetTypeNode,
	#instVars : [
		'left',
		'names',
		'commas',
		'right'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiValuesSetTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitValuesSetType: self
]

{ #category : #generated }
DelphiValuesSetTypeNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiValuesSetTypeNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiValuesSetTypeNode >> compositeTokenVariables [
	^ #(#names)
]

{ #category : #generated }
DelphiValuesSetTypeNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #'generated-initialize-release' }
DelphiValuesSetTypeNode >> initialize [
	super initialize.
	names := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiValuesSetTypeNode >> left [
	^ left
]

{ #category : #generated }
DelphiValuesSetTypeNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiValuesSetTypeNode >> names [
	^ names
]

{ #category : #generated }
DelphiValuesSetTypeNode >> names: anOrderedCollection [
	names := anOrderedCollection
]

{ #category : #generated }
DelphiValuesSetTypeNode >> right [
	^ right
]

{ #category : #generated }
DelphiValuesSetTypeNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiValuesSetTypeNode >> tokenVariables [
	^ #(#left #right #setToken #ofToken)
]
