Class {
	#name : #JavaSingleTypeImportDeclarationNode,
	#superclass : #JavaDeclarationNode,
	#instVars : [
		'importToken',
		'staticToken',
		'name',
		'semicolon'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaSingleTypeImportDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSingleTypeImportDeclaration: self
]

{ #category : #generated }
JavaSingleTypeImportDeclarationNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
JavaSingleTypeImportDeclarationNode >> importToken [
	^ importToken
]

{ #category : #generated }
JavaSingleTypeImportDeclarationNode >> importToken: aSmaCCToken [
	importToken := aSmaCCToken
]

{ #category : #generated }
JavaSingleTypeImportDeclarationNode >> name [
	^ name
]

{ #category : #generated }
JavaSingleTypeImportDeclarationNode >> name: aJavaNameNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aJavaNameNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
JavaSingleTypeImportDeclarationNode >> nodeVariables [
	^ #(#name)
]

{ #category : #generated }
JavaSingleTypeImportDeclarationNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JavaSingleTypeImportDeclarationNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
JavaSingleTypeImportDeclarationNode >> staticToken [
	^ staticToken
]

{ #category : #generated }
JavaSingleTypeImportDeclarationNode >> staticToken: aSmaCCToken [
	staticToken := aSmaCCToken
]

{ #category : #generated }
JavaSingleTypeImportDeclarationNode >> tokenVariables [
	^ #(#importToken #staticToken)
]
