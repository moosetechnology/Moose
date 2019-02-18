Class {
	#name : #JavaElementValuePairNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'name',
		'equals',
		'value'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaElementValuePairNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitElementValuePair: self
]

{ #category : #generated }
JavaElementValuePairNode >> equals [
	^ equals
]

{ #category : #generated }
JavaElementValuePairNode >> equals: aSmaCCToken [
	equals := aSmaCCToken
]

{ #category : #generated }
JavaElementValuePairNode >> name [
	^ name
]

{ #category : #generated }
JavaElementValuePairNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
JavaElementValuePairNode >> nodeVariables [
	^ #(#value)
]

{ #category : #generated }
JavaElementValuePairNode >> tokenVariables [
	^ #(#name #equals)
]

{ #category : #generated }
JavaElementValuePairNode >> value [
	^ value
]

{ #category : #generated }
JavaElementValuePairNode >> value: aJavaProgramNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aJavaProgramNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]
