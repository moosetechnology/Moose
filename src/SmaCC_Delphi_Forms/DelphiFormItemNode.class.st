Class {
	#name : #DelphiFormItemNode,
	#superclass : #DelphiFormParseNode,
	#instVars : [
		'itemToken',
		'properties',
		'endToken'
	],
	#category : #'SmaCC_Delphi_Forms'
}

{ #category : #generated }
DelphiFormItemNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitItem: self
]

{ #category : #generated }
DelphiFormItemNode >> compositeNodeVariables [
	^ #(#properties)
]

{ #category : #generated }
DelphiFormItemNode >> endToken [
	^ endToken
]

{ #category : #generated }
DelphiFormItemNode >> endToken: aSmaCCToken [
	endToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
DelphiFormItemNode >> initialize [
	super initialize.
	properties := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiFormItemNode >> itemToken [
	^ itemToken
]

{ #category : #generated }
DelphiFormItemNode >> itemToken: aSmaCCToken [
	itemToken := aSmaCCToken
]

{ #category : #generated }
DelphiFormItemNode >> properties [
	^ properties
]

{ #category : #generated }
DelphiFormItemNode >> properties: anOrderedCollection [
	self setParents: self properties to: nil.
	properties := anOrderedCollection.
	self setParents: self properties to: self
]

{ #category : #generated }
DelphiFormItemNode >> tokenVariables [
	^ #(#itemToken #endToken)
]
