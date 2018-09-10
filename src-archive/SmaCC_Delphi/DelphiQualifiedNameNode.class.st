Class {
	#name : #DelphiQualifiedNameNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'name',
		'left',
		'genericTypeArguments',
		'commas',
		'right',
		'namespace',
		'period'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiQualifiedNameNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitQualifiedName: self
]

{ #category : #generated }
DelphiQualifiedNameNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiQualifiedNameNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiQualifiedNameNode >> compositeTokenVariables [
	^ #(#genericTypeArguments)
]

{ #category : #generated }
DelphiQualifiedNameNode >> genericTypeArguments [
	^ genericTypeArguments
]

{ #category : #generated }
DelphiQualifiedNameNode >> genericTypeArguments: anOrderedCollection [
	genericTypeArguments := anOrderedCollection
]

{ #category : #generated }
DelphiQualifiedNameNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #'generated-initialize-release' }
DelphiQualifiedNameNode >> initialize [
	super initialize.
	genericTypeArguments := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiQualifiedNameNode >> left [
	^ left
]

{ #category : #generated }
DelphiQualifiedNameNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiQualifiedNameNode >> name [
	^ name
]

{ #category : #generated }
DelphiQualifiedNameNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
DelphiQualifiedNameNode >> namespace [
	^ namespace
]

{ #category : #generated }
DelphiQualifiedNameNode >> namespace: aSmaCCToken [
	namespace := aSmaCCToken
]

{ #category : #generated }
DelphiQualifiedNameNode >> period [
	^ period
]

{ #category : #generated }
DelphiQualifiedNameNode >> period: aSmaCCToken [
	period := aSmaCCToken
]

{ #category : #generated }
DelphiQualifiedNameNode >> right [
	^ right
]

{ #category : #generated }
DelphiQualifiedNameNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiQualifiedNameNode >> tokenVariables [
	^ #(#name #left #right #namespace #period)
]
