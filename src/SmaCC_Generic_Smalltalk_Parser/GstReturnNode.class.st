Class {
	#name : #GstReturnNode,
	#superclass : #GstProgramNode,
	#instVars : [
		'upArrow',
		'value'
	],
	#category : #'SmaCC_Generic_Smalltalk_Parser'
}

{ #category : #generated }
GstReturnNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitReturn: self
]

{ #category : #generated }
GstReturnNode >> nodeVariables [
	^ #(#value)
]

{ #category : #generated }
GstReturnNode >> tokenVariables [
	^ #(#upArrow)
]

{ #category : #generated }
GstReturnNode >> upArrow [
	^ upArrow
]

{ #category : #generated }
GstReturnNode >> upArrow: aSmaCCToken [
	upArrow := aSmaCCToken
]

{ #category : #generated }
GstReturnNode >> value [
	^ value
]

{ #category : #generated }
GstReturnNode >> value: aGstValueNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aGstValueNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]
