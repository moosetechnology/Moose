Class {
	#name : #JavaProgramFileNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'packageDeclaration',
		'imports',
		'typeDeclarations'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaProgramFileNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitProgramFile: self
]

{ #category : #generated }
JavaProgramFileNode >> compositeNodeVariables [
	^ #(#imports #typeDeclarations)
]

{ #category : #generated }
JavaProgramFileNode >> imports [
	^ imports
]

{ #category : #generated }
JavaProgramFileNode >> imports: anOrderedCollection [
	self setParents: self imports to: nil.
	imports := anOrderedCollection.
	self setParents: self imports to: self
]

{ #category : #'generated-initialize-release' }
JavaProgramFileNode >> initialize [
	super initialize.
	imports := OrderedCollection new: 2.
	typeDeclarations := OrderedCollection new: 2.
]

{ #category : #generated }
JavaProgramFileNode >> nodeVariables [
	^ #(#packageDeclaration)
]

{ #category : #generated }
JavaProgramFileNode >> packageDeclaration [
	^ packageDeclaration
]

{ #category : #generated }
JavaProgramFileNode >> packageDeclaration: aJavaPackageDeclarationNode [
	self packageDeclaration notNil
		ifTrue: [ self packageDeclaration parent: nil ].
	packageDeclaration := aJavaPackageDeclarationNode.
	self packageDeclaration notNil
		ifTrue: [ self packageDeclaration parent: self ]
]

{ #category : #generated }
JavaProgramFileNode >> typeDeclarations [
	^ typeDeclarations
]

{ #category : #generated }
JavaProgramFileNode >> typeDeclarations: anOrderedCollection [
	self setParents: self typeDeclarations to: nil.
	typeDeclarations := anOrderedCollection.
	self setParents: self typeDeclarations to: self
]
