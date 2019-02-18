Class {
	#name : #JavaAnnotationInterfaceNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'modifiers',
		'atToken',
		'interfaceToken',
		'name',
		'leftBrace',
		'declarations',
		'rightBrace'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaAnnotationInterfaceNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAnnotationInterface: self
]

{ #category : #generated }
JavaAnnotationInterfaceNode >> atToken [
	^ atToken
]

{ #category : #generated }
JavaAnnotationInterfaceNode >> atToken: aSmaCCToken [
	atToken := aSmaCCToken
]

{ #category : #generated }
JavaAnnotationInterfaceNode >> compositeNodeVariables [
	^ #(#modifiers #declarations)
]

{ #category : #generated }
JavaAnnotationInterfaceNode >> declarations [
	^ declarations
]

{ #category : #generated }
JavaAnnotationInterfaceNode >> declarations: anOrderedCollection [
	self setParents: self declarations to: nil.
	declarations := anOrderedCollection.
	self setParents: self declarations to: self
]

{ #category : #generated }
JavaAnnotationInterfaceNode >> ignoredTokenVariables [
	^ #(#leftBrace #rightBrace)
]

{ #category : #'generated-initialize-release' }
JavaAnnotationInterfaceNode >> initialize [
	super initialize.
	modifiers := OrderedCollection new: 2.
	declarations := OrderedCollection new: 2.
]

{ #category : #generated }
JavaAnnotationInterfaceNode >> interfaceToken [
	^ interfaceToken
]

{ #category : #generated }
JavaAnnotationInterfaceNode >> interfaceToken: aSmaCCToken [
	interfaceToken := aSmaCCToken
]

{ #category : #generated }
JavaAnnotationInterfaceNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JavaAnnotationInterfaceNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JavaAnnotationInterfaceNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
JavaAnnotationInterfaceNode >> modifiers: anOrderedCollection [
	self setParents: self modifiers to: nil.
	modifiers := anOrderedCollection.
	self setParents: self modifiers to: self
]

{ #category : #generated }
JavaAnnotationInterfaceNode >> name [
	^ name
]

{ #category : #generated }
JavaAnnotationInterfaceNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
JavaAnnotationInterfaceNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JavaAnnotationInterfaceNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
JavaAnnotationInterfaceNode >> tokenVariables [
	^ #(#atToken #interfaceToken #name)
]
