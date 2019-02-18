Class {
	#name : #JavaOuterThisNode,
	#superclass : #JavaExpressionNode,
	#instVars : [
		'name',
		'period',
		'thisToken'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaOuterThisNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitOuterThis: self
]

{ #category : #generated }
JavaOuterThisNode >> name [
	^ name
]

{ #category : #generated }
JavaOuterThisNode >> name: aJavaNameNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aJavaNameNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
JavaOuterThisNode >> nodeVariables [
	^ #(#name)
]

{ #category : #generated }
JavaOuterThisNode >> period [
	^ period
]

{ #category : #generated }
JavaOuterThisNode >> period: aSmaCCToken [
	period := aSmaCCToken
]

{ #category : #generated }
JavaOuterThisNode >> thisToken [
	^ thisToken
]

{ #category : #generated }
JavaOuterThisNode >> thisToken: aSmaCCToken [
	thisToken := aSmaCCToken
]

{ #category : #generated }
JavaOuterThisNode >> tokenVariables [
	^ #(#period #thisToken)
]
