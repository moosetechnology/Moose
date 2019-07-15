Class {
	#name : #DelphiFormArrayNode,
	#superclass : #DelphiFormParseNode,
	#instVars : [
		'left',
		'values',
		'right'
	],
	#category : #'SmaCC_Delphi_Forms'
}

{ #category : #generated }
DelphiFormArrayNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitArray: self
]

{ #category : #generated }
DelphiFormArrayNode >> compositeNodeVariables [
	^ #(#values)
]

{ #category : #'generated-initialize-release' }
DelphiFormArrayNode >> initialize [
	super initialize.
	values := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiFormArrayNode >> left [
	^ left
]

{ #category : #generated }
DelphiFormArrayNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiFormArrayNode >> right [
	^ right
]

{ #category : #generated }
DelphiFormArrayNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiFormArrayNode >> tokenVariables [
	^ #(#left #right)
]

{ #category : #generated }
DelphiFormArrayNode >> values [
	^ values
]

{ #category : #generated }
DelphiFormArrayNode >> values: anOrderedCollection [
	self setParents: self values to: nil.
	values := anOrderedCollection.
	self setParents: self values to: self
]
