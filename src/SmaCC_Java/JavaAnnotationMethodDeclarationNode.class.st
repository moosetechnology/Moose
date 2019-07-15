Class {
	#name : #JavaAnnotationMethodDeclarationNode,
	#superclass : #JavaAbstractMethodDeclarationNode,
	#instVars : [
		'defaultToken',
		'value'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaAnnotationMethodDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAnnotationMethodDeclaration: self
]

{ #category : #generated }
JavaAnnotationMethodDeclarationNode >> defaultToken [
	^ defaultToken
]

{ #category : #generated }
JavaAnnotationMethodDeclarationNode >> defaultToken: aSmaCCToken [
	defaultToken := aSmaCCToken
]

{ #category : #generated }
JavaAnnotationMethodDeclarationNode >> nodeVariables [
	^ #(#value #typeParameters #type #declarator #throws)
]

{ #category : #generated }
JavaAnnotationMethodDeclarationNode >> tokenVariables [
	^ #(#defaultToken)
]

{ #category : #generated }
JavaAnnotationMethodDeclarationNode >> value [
	^ value
]

{ #category : #generated }
JavaAnnotationMethodDeclarationNode >> value: aJavaProgramNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aJavaProgramNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]
