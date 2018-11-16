Class {
	#name : #JSImportSpecifierNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'binding',
		'name',
		'asToken'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSImportSpecifierNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitImportSpecifier: self
]

{ #category : #generated }
JSImportSpecifierNode >> asToken [
	^ asToken
]

{ #category : #generated }
JSImportSpecifierNode >> asToken: aSmaCCToken [
	asToken := aSmaCCToken
]

{ #category : #generated }
JSImportSpecifierNode >> binding [
	^ binding
]

{ #category : #generated }
JSImportSpecifierNode >> binding: aJSNameExpressionNode [
	self binding notNil
		ifTrue: [ self binding parent: nil ].
	binding := aJSNameExpressionNode.
	self binding notNil
		ifTrue: [ self binding parent: self ]
]

{ #category : #generated }
JSImportSpecifierNode >> name [
	^ name
]

{ #category : #generated }
JSImportSpecifierNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
JSImportSpecifierNode >> nodeVariables [
	^ #(#binding)
]

{ #category : #generated }
JSImportSpecifierNode >> tokenVariables [
	^ #(#name #asToken)
]
