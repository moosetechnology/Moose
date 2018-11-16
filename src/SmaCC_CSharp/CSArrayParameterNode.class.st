Class {
	#name : #CSArrayParameterNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'_attributes',
		'paramsToken',
		'type',
		'name'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSArrayParameterNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSArrayParameterNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSArrayParameterNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitArrayParameter: self
]

{ #category : #generated }
CSArrayParameterNode >> compositeNodeVariables [
	^ #(#_attributes)
]

{ #category : #'generated-initialize-release' }
CSArrayParameterNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
]

{ #category : #generated }
CSArrayParameterNode >> name [
	^ name
]

{ #category : #generated }
CSArrayParameterNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
CSArrayParameterNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
CSArrayParameterNode >> paramsToken [
	^ paramsToken
]

{ #category : #generated }
CSArrayParameterNode >> paramsToken: aSmaCCToken [
	paramsToken := aSmaCCToken
]

{ #category : #generated }
CSArrayParameterNode >> tokenVariables [
	^ #(#paramsToken #name)
]

{ #category : #generated }
CSArrayParameterNode >> type [
	^ type
]

{ #category : #generated }
CSArrayParameterNode >> type: aCSArrayTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSArrayTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
