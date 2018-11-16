Class {
	#name : #CSInterfacePropertyAccessorNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'_attributes',
		'accessorType',
		'semicolon'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSInterfacePropertyAccessorNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSInterfacePropertyAccessorNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSInterfacePropertyAccessorNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitInterfacePropertyAccessor: self
]

{ #category : #generated }
CSInterfacePropertyAccessorNode >> accessorType [
	^ accessorType
]

{ #category : #generated }
CSInterfacePropertyAccessorNode >> accessorType: aSmaCCToken [
	accessorType := aSmaCCToken
]

{ #category : #generated }
CSInterfacePropertyAccessorNode >> compositeNodeVariables [
	^ #(#_attributes)
]

{ #category : #'generated-initialize-release' }
CSInterfacePropertyAccessorNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
]

{ #category : #generated }
CSInterfacePropertyAccessorNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
CSInterfacePropertyAccessorNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
CSInterfacePropertyAccessorNode >> tokenVariables [
	^ #(#accessorType #semicolon)
]
