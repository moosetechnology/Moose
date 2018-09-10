Class {
	#name : #CSInterfaceEventDeclarationNode,
	#superclass : #CSDeclarationNode,
	#instVars : [
		'_attributes',
		'modifier',
		'eventToken',
		'type',
		'name',
		'semicolon'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSInterfaceEventDeclarationNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSInterfaceEventDeclarationNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSInterfaceEventDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitInterfaceEventDeclaration: self
]

{ #category : #generated }
CSInterfaceEventDeclarationNode >> compositeNodeVariables [
	^ #(#_attributes)
]

{ #category : #generated }
CSInterfaceEventDeclarationNode >> eventToken [
	^ eventToken
]

{ #category : #generated }
CSInterfaceEventDeclarationNode >> eventToken: aSmaCCToken [
	eventToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
CSInterfaceEventDeclarationNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
]

{ #category : #generated }
CSInterfaceEventDeclarationNode >> modifier [
	^ modifier
]

{ #category : #generated }
CSInterfaceEventDeclarationNode >> modifier: aSmaCCToken [
	modifier := aSmaCCToken
]

{ #category : #generated }
CSInterfaceEventDeclarationNode >> name [
	^ name
]

{ #category : #generated }
CSInterfaceEventDeclarationNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
CSInterfaceEventDeclarationNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
CSInterfaceEventDeclarationNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
CSInterfaceEventDeclarationNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
CSInterfaceEventDeclarationNode >> tokenVariables [
	^ #(#modifier #eventToken #name #semicolon)
]

{ #category : #generated }
CSInterfaceEventDeclarationNode >> type [
	^ type
]

{ #category : #generated }
CSInterfaceEventDeclarationNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
