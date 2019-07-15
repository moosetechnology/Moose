Class {
	#name : #DelphiFormSetNode,
	#superclass : #DelphiFormParseNode,
	#instVars : [
		'left',
		'items',
		'commas',
		'right'
	],
	#category : #'SmaCC_Delphi_Forms'
}

{ #category : #generated }
DelphiFormSetNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitSet: self
]

{ #category : #generated }
DelphiFormSetNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiFormSetNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiFormSetNode >> compositeTokenVariables [
	^ #(#items #commas)
]

{ #category : #'generated-initialize-release' }
DelphiFormSetNode >> initialize [
	super initialize.
	items := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiFormSetNode >> items [
	^ items
]

{ #category : #generated }
DelphiFormSetNode >> items: anOrderedCollection [
	items := anOrderedCollection
]

{ #category : #generated }
DelphiFormSetNode >> left [
	^ left
]

{ #category : #generated }
DelphiFormSetNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiFormSetNode >> right [
	^ right
]

{ #category : #generated }
DelphiFormSetNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiFormSetNode >> tokenVariables [
	^ #(#left #right)
]
