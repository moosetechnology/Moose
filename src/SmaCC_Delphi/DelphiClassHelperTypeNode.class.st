Class {
	#name : #DelphiClassHelperTypeNode,
	#superclass : #DelphiClassTypeNode,
	#instVars : [
		'classToken',
		'classAttributes',
		'helperToken',
		'forToken',
		'_class'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiClassHelperTypeNode >> _class [
	^ _class
]

{ #category : #generated }
DelphiClassHelperTypeNode >> _class: aDelphiQualifiedNameNode [
	self _class notNil
		ifTrue: [ self _class parent: nil ].
	_class := aDelphiQualifiedNameNode.
	self _class notNil
		ifTrue: [ self _class parent: self ]
]

{ #category : #generated }
DelphiClassHelperTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitClassHelperType: self
]

{ #category : #generated }
DelphiClassHelperTypeNode >> classAttributes [
	^ classAttributes
]

{ #category : #generated }
DelphiClassHelperTypeNode >> classAttributes: anOrderedCollection [
	classAttributes := anOrderedCollection
]

{ #category : #generated }
DelphiClassHelperTypeNode >> classToken [
	^ classToken
]

{ #category : #generated }
DelphiClassHelperTypeNode >> classToken: aSmaCCToken [
	classToken := aSmaCCToken
]

{ #category : #generated }
DelphiClassHelperTypeNode >> compositeTokenVariables [
	^ #(#classAttributes)
]

{ #category : #generated }
DelphiClassHelperTypeNode >> forToken [
	^ forToken
]

{ #category : #generated }
DelphiClassHelperTypeNode >> forToken: aSmaCCToken [
	forToken := aSmaCCToken
]

{ #category : #generated }
DelphiClassHelperTypeNode >> helperToken [
	^ helperToken
]

{ #category : #generated }
DelphiClassHelperTypeNode >> helperToken: aSmaCCToken [
	helperToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
DelphiClassHelperTypeNode >> initialize [
	super initialize.
	classAttributes := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiClassHelperTypeNode >> nodeVariables [
	^ #(#_class #implicitClassSection)
]

{ #category : #generated }
DelphiClassHelperTypeNode >> tokenVariables [
	^ #(#classToken #helperToken #forToken #left #right #endToken)
]
