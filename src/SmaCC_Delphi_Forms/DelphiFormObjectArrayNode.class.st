Class {
	#name : #DelphiFormObjectArrayNode,
	#superclass : #DelphiFormParseNode,
	#instVars : [
		'left',
		'items',
		'right'
	],
	#category : #'SmaCC_Delphi_Forms'
}

{ #category : #generated }
DelphiFormObjectArrayNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitObjectArray: self
]

{ #category : #generated }
DelphiFormObjectArrayNode >> compositeNodeVariables [
	^ #(#items)
]

{ #category : #'generated-initialize-release' }
DelphiFormObjectArrayNode >> initialize [
	super initialize.
	items := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiFormObjectArrayNode >> items [
	^ items
]

{ #category : #generated }
DelphiFormObjectArrayNode >> items: anOrderedCollection [
	self setParents: self items to: nil.
	items := anOrderedCollection.
	self setParents: self items to: self
]

{ #category : #generated }
DelphiFormObjectArrayNode >> left [
	^ left
]

{ #category : #generated }
DelphiFormObjectArrayNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiFormObjectArrayNode >> right [
	^ right
]

{ #category : #generated }
DelphiFormObjectArrayNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiFormObjectArrayNode >> tokenVariables [
	^ #(#left #right)
]
