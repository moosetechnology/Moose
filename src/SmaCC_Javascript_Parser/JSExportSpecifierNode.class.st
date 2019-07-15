Class {
	#name : #JSExportSpecifierNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'name',
		'asToken',
		'_as'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSExportSpecifierNode >> _as [
	^ _as
]

{ #category : #generated }
JSExportSpecifierNode >> _as: aSmaCCToken [
	_as := aSmaCCToken
]

{ #category : #generated }
JSExportSpecifierNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitExportSpecifier: self
]

{ #category : #generated }
JSExportSpecifierNode >> asToken [
	^ asToken
]

{ #category : #generated }
JSExportSpecifierNode >> asToken: aSmaCCToken [
	asToken := aSmaCCToken
]

{ #category : #generated }
JSExportSpecifierNode >> name [
	^ name
]

{ #category : #generated }
JSExportSpecifierNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
JSExportSpecifierNode >> tokenVariables [
	^ #(#name #asToken #_as)
]
