Class {
	#name : #JavaCatchClauseNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'catchToken',
		'leftParen',
		'parameter',
		'rightParen',
		'block'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaCatchClauseNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitCatchClause: self
]

{ #category : #generated }
JavaCatchClauseNode >> block [
	^ block
]

{ #category : #generated }
JavaCatchClauseNode >> block: aJavaBlockNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aJavaBlockNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
JavaCatchClauseNode >> catchToken [
	^ catchToken
]

{ #category : #generated }
JavaCatchClauseNode >> catchToken: aSmaCCToken [
	catchToken := aSmaCCToken
]

{ #category : #generated }
JavaCatchClauseNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen)
]

{ #category : #generated }
JavaCatchClauseNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JavaCatchClauseNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JavaCatchClauseNode >> nodeVariables [
	^ #(#parameter #block)
]

{ #category : #generated }
JavaCatchClauseNode >> parameter [
	^ parameter
]

{ #category : #generated }
JavaCatchClauseNode >> parameter: aJavaCatchParameterNode [
	self parameter notNil
		ifTrue: [ self parameter parent: nil ].
	parameter := aJavaCatchParameterNode.
	self parameter notNil
		ifTrue: [ self parameter parent: self ]
]

{ #category : #generated }
JavaCatchClauseNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JavaCatchClauseNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JavaCatchClauseNode >> tokenVariables [
	^ #(#catchToken)
]
