Class {
	#name : #DelphiFormCombinedStringNode,
	#superclass : #DelphiFormParseNode,
	#instVars : [
		'left',
		'plus',
		'right'
	],
	#category : #'SmaCC_Delphi_Forms'
}

{ #category : #generated }
DelphiFormCombinedStringNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitCombinedString: self
]

{ #category : #generated }
DelphiFormCombinedStringNode >> left [
	^ left
]

{ #category : #generated }
DelphiFormCombinedStringNode >> left: aDelphiFormParseNode [
	self left notNil
		ifTrue: [ self left parent: nil ].
	left := aDelphiFormParseNode.
	self left notNil
		ifTrue: [ self left parent: self ]
]

{ #category : #generated }
DelphiFormCombinedStringNode >> nodeVariables [
	^ #(#left)
]

{ #category : #generated }
DelphiFormCombinedStringNode >> plus [
	^ plus
]

{ #category : #generated }
DelphiFormCombinedStringNode >> plus: aSmaCCToken [
	plus := aSmaCCToken
]

{ #category : #generated }
DelphiFormCombinedStringNode >> right [
	^ right
]

{ #category : #generated }
DelphiFormCombinedStringNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiFormCombinedStringNode >> tokenVariables [
	^ #(#plus #right)
]
