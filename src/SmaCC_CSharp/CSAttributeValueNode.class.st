Class {
	#name : #CSAttributeValueNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'name',
		'leftParen',
		'arguments',
		'commas',
		'rightParen'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSAttributeValueNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAttributeValue: self
]

{ #category : #generated }
CSAttributeValueNode >> arguments [
	^ arguments
]

{ #category : #generated }
CSAttributeValueNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
CSAttributeValueNode >> commas [
	^ commas
]

{ #category : #generated }
CSAttributeValueNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
CSAttributeValueNode >> compositeNodeVariables [
	^ #(#arguments)
]

{ #category : #generated }
CSAttributeValueNode >> compositeTokenVariables [
	^ #(#commas)
]

{ #category : #'generated-initialize-release' }
CSAttributeValueNode >> initialize [
	super initialize.
	arguments := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
CSAttributeValueNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
CSAttributeValueNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
CSAttributeValueNode >> name [
	^ name
]

{ #category : #generated }
CSAttributeValueNode >> name: aCSTypeNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aCSTypeNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
CSAttributeValueNode >> nodeVariables [
	^ #(#name)
]

{ #category : #generated }
CSAttributeValueNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
CSAttributeValueNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
CSAttributeValueNode >> tokenVariables [
	^ #(#leftParen #rightParen)
]
