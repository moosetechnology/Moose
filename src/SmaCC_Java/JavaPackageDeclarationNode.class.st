Class {
	#name : #JavaPackageDeclarationNode,
	#superclass : #JavaDeclarationNode,
	#instVars : [
		'annotations',
		'packageToken',
		'name',
		'semicolon'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaPackageDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPackageDeclaration: self
]

{ #category : #generated }
JavaPackageDeclarationNode >> annotations [
	^ annotations
]

{ #category : #generated }
JavaPackageDeclarationNode >> annotations: anOrderedCollection [
	self setParents: self annotations to: nil.
	annotations := anOrderedCollection.
	self setParents: self annotations to: self
]

{ #category : #generated }
JavaPackageDeclarationNode >> compositeNodeVariables [
	^ #(#annotations)
]

{ #category : #generated }
JavaPackageDeclarationNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #'generated-initialize-release' }
JavaPackageDeclarationNode >> initialize [
	super initialize.
	annotations := OrderedCollection new: 2.
]

{ #category : #generated }
JavaPackageDeclarationNode >> name [
	^ name
]

{ #category : #generated }
JavaPackageDeclarationNode >> name: aJavaNameNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aJavaNameNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
JavaPackageDeclarationNode >> nodeVariables [
	^ #(#name)
]

{ #category : #generated }
JavaPackageDeclarationNode >> packageToken [
	^ packageToken
]

{ #category : #generated }
JavaPackageDeclarationNode >> packageToken: aSmaCCToken [
	packageToken := aSmaCCToken
]

{ #category : #generated }
JavaPackageDeclarationNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JavaPackageDeclarationNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
JavaPackageDeclarationNode >> tokenVariables [
	^ #(#packageToken)
]
