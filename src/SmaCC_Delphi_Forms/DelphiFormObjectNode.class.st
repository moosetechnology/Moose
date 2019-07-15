Class {
	#name : #DelphiFormObjectNode,
	#superclass : #DelphiFormParseNode,
	#instVars : [
		'objectTypeToken',
		'nameToken',
		'colonToken',
		'typeToken',
		'left',
		'indexToken',
		'right',
		'properties',
		'endToken'
	],
	#category : #'SmaCC_Delphi_Forms'
}

{ #category : #generated }
DelphiFormObjectNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitObject: self
]

{ #category : #generated }
DelphiFormObjectNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
DelphiFormObjectNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
DelphiFormObjectNode >> compositeNodeVariables [
	^ #(#properties)
]

{ #category : #generated }
DelphiFormObjectNode >> endToken [
	^ endToken
]

{ #category : #generated }
DelphiFormObjectNode >> endToken: aSmaCCToken [
	endToken := aSmaCCToken
]

{ #category : #generated }
DelphiFormObjectNode >> indexToken [
	^ indexToken
]

{ #category : #generated }
DelphiFormObjectNode >> indexToken: aSmaCCToken [
	indexToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
DelphiFormObjectNode >> initialize [
	super initialize.
	properties := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiFormObjectNode >> left [
	^ left
]

{ #category : #generated }
DelphiFormObjectNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiFormObjectNode >> nameToken [
	^ nameToken
]

{ #category : #generated }
DelphiFormObjectNode >> nameToken: aSmaCCToken [
	nameToken := aSmaCCToken
]

{ #category : #generated }
DelphiFormObjectNode >> objectTypeToken [
	^ objectTypeToken
]

{ #category : #generated }
DelphiFormObjectNode >> objectTypeToken: aSmaCCToken [
	objectTypeToken := aSmaCCToken
]

{ #category : #generated }
DelphiFormObjectNode >> properties [
	^ properties
]

{ #category : #generated }
DelphiFormObjectNode >> properties: anOrderedCollection [
	self setParents: self properties to: nil.
	properties := anOrderedCollection.
	self setParents: self properties to: self
]

{ #category : #generated }
DelphiFormObjectNode >> right [
	^ right
]

{ #category : #generated }
DelphiFormObjectNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiFormObjectNode >> tokenVariables [
	^ #(#objectTypeToken #nameToken #colonToken #typeToken #left #indexToken #right #endToken)
]

{ #category : #generated }
DelphiFormObjectNode >> typeToken [
	^ typeToken
]

{ #category : #generated }
DelphiFormObjectNode >> typeToken: aSmaCCToken [
	typeToken := aSmaCCToken
]
