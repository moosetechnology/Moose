Class {
	#name : #CSArrayTypeNode,
	#superclass : #CSTypeNode,
	#instVars : [
		'type',
		'rankSpecifiers'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSArrayTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitArrayType: self
]

{ #category : #generated }
CSArrayTypeNode >> compositeNodeVariables [
	^ #(#rankSpecifiers)
]

{ #category : #'generated-initialize-release' }
CSArrayTypeNode >> initialize [
	super initialize.
	rankSpecifiers := OrderedCollection new: 2.
]

{ #category : #generated }
CSArrayTypeNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
CSArrayTypeNode >> rankSpecifiers [
	^ rankSpecifiers
]

{ #category : #generated }
CSArrayTypeNode >> rankSpecifiers: anOrderedCollection [
	self setParents: self rankSpecifiers to: nil.
	rankSpecifiers := anOrderedCollection.
	self setParents: self rankSpecifiers to: self
]

{ #category : #generated }
CSArrayTypeNode >> type [
	^ type
]

{ #category : #generated }
CSArrayTypeNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
