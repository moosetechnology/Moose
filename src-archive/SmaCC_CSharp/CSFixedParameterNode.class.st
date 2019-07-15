Class {
	#name : #CSFixedParameterNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'_attributes',
		'modifier',
		'type',
		'name',
		'equalToken',
		'expression'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSFixedParameterNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSFixedParameterNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSFixedParameterNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFixedParameter: self
]

{ #category : #generated }
CSFixedParameterNode >> compositeNodeVariables [
	^ #(#_attributes)
]

{ #category : #generated }
CSFixedParameterNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
CSFixedParameterNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
CSFixedParameterNode >> expression [
	^ expression
]

{ #category : #generated }
CSFixedParameterNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #'generated-initialize-release' }
CSFixedParameterNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
]

{ #category : #generated }
CSFixedParameterNode >> modifier [
	^ modifier
]

{ #category : #generated }
CSFixedParameterNode >> modifier: aSmaCCToken [
	modifier := aSmaCCToken
]

{ #category : #generated }
CSFixedParameterNode >> name [
	^ name
]

{ #category : #generated }
CSFixedParameterNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
CSFixedParameterNode >> nodeVariables [
	^ #(#type #expression)
]

{ #category : #generated }
CSFixedParameterNode >> tokenVariables [
	^ #(#modifier #name #equalToken)
]

{ #category : #generated }
CSFixedParameterNode >> type [
	^ type
]

{ #category : #generated }
CSFixedParameterNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
