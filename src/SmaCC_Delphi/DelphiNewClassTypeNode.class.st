Class {
	#name : #DelphiNewClassTypeNode,
	#superclass : #DelphiClassTypeNode,
	#instVars : [
		'classToken',
		'classAttributes'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiNewClassTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNewClassType: self
]

{ #category : #generated }
DelphiNewClassTypeNode >> classAttributes [
	^ classAttributes
]

{ #category : #generated }
DelphiNewClassTypeNode >> classAttributes: anOrderedCollection [
	classAttributes := anOrderedCollection
]

{ #category : #generated }
DelphiNewClassTypeNode >> classToken [
	^ classToken
]

{ #category : #generated }
DelphiNewClassTypeNode >> classToken: aSmaCCToken [
	classToken := aSmaCCToken
]

{ #category : #generated }
DelphiNewClassTypeNode >> compositeTokenVariables [
	^ #(#classAttributes)
]

{ #category : #'generated-initialize-release' }
DelphiNewClassTypeNode >> initialize [
	super initialize.
	classAttributes := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiNewClassTypeNode >> tokenVariables [
	^ #(#classToken #left #right #endToken)
]
