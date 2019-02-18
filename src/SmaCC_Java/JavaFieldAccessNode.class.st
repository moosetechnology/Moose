Class {
	#name : #JavaFieldAccessNode,
	#superclass : #JavaExpressionNode,
	#instVars : [
		'receiver',
		'period',
		'name',
		'superToken',
		'superPeriod'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaFieldAccessNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFieldAccess: self
]

{ #category : #generated }
JavaFieldAccessNode >> name [
	^ name
]

{ #category : #generated }
JavaFieldAccessNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
JavaFieldAccessNode >> nodeVariables [
	^ #(#receiver)
]

{ #category : #generated }
JavaFieldAccessNode >> period [
	^ period
]

{ #category : #generated }
JavaFieldAccessNode >> period: aSmaCCToken [
	period := aSmaCCToken
]

{ #category : #generated }
JavaFieldAccessNode >> receiver [
	^ receiver
]

{ #category : #generated }
JavaFieldAccessNode >> receiver: aJavaExpressionNode [
	self receiver notNil
		ifTrue: [ self receiver parent: nil ].
	receiver := aJavaExpressionNode.
	self receiver notNil
		ifTrue: [ self receiver parent: self ]
]

{ #category : #generated }
JavaFieldAccessNode >> superPeriod [
	^ superPeriod
]

{ #category : #generated }
JavaFieldAccessNode >> superPeriod: aSmaCCToken [
	superPeriod := aSmaCCToken
]

{ #category : #generated }
JavaFieldAccessNode >> superToken [
	^ superToken
]

{ #category : #generated }
JavaFieldAccessNode >> superToken: aSmaCCToken [
	superToken := aSmaCCToken
]

{ #category : #generated }
JavaFieldAccessNode >> tokenVariables [
	^ #(#period #name #superToken #superPeriod)
]
