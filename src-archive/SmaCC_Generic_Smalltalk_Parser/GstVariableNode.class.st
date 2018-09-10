Class {
	#name : #GstVariableNode,
	#superclass : #GstValueNode,
	#instVars : [
		'name'
	],
	#category : #'SmaCC_Generic_Smalltalk_Parser'
}

{ #category : #generated }
GstVariableNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitVariable: self
]

{ #category : #generated }
GstVariableNode >> name [
	^ name
]

{ #category : #generated }
GstVariableNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
GstVariableNode >> tokenVariables [
	^ #(#name)
]
