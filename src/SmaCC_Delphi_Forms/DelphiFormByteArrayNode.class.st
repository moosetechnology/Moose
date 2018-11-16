Class {
	#name : #DelphiFormByteArrayNode,
	#superclass : #DelphiFormParseNode,
	#instVars : [
		'left',
		'lines',
		'right'
	],
	#category : #'SmaCC_Delphi_Forms'
}

{ #category : #generated }
DelphiFormByteArrayNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitByteArray: self
]

{ #category : #generated }
DelphiFormByteArrayNode >> compositeTokenVariables [
	^ #(#lines)
]

{ #category : #'generated-initialize-release' }
DelphiFormByteArrayNode >> initialize [
	super initialize.
	lines := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiFormByteArrayNode >> left [
	^ left
]

{ #category : #generated }
DelphiFormByteArrayNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiFormByteArrayNode >> lines [
	^ lines
]

{ #category : #generated }
DelphiFormByteArrayNode >> lines: anOrderedCollection [
	lines := anOrderedCollection
]

{ #category : #generated }
DelphiFormByteArrayNode >> right [
	^ right
]

{ #category : #generated }
DelphiFormByteArrayNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiFormByteArrayNode >> tokenVariables [
	^ #(#left #right)
]
