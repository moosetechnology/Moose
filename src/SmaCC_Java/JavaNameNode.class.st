Class {
	#name : #JavaNameNode,
	#superclass : #JavaExpressionNode,
	#instVars : [
		'name'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaNameNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitName: self
]

{ #category : #generated }
JavaNameNode >> name [
	^ name
]

{ #category : #generated }
JavaNameNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
JavaNameNode >> tokenVariables [
	^ #(#name)
]
