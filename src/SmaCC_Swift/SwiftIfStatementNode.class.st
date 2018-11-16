Class {
	#name : #SwiftIfStatementNode,
	#superclass : #SwiftBranchStatementNode,
	#instVars : [
		'ifToken',
		'expression',
		'then',
		'elseToken',
		'else'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftIfStatementNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitIfStatement: self
]

{ #category : #generated }
SwiftIfStatementNode >> else [
	^ else
]

{ #category : #generated }
SwiftIfStatementNode >> else: aSwiftParseNode [
	self else notNil
		ifTrue: [ self else parent: nil ].
	else := aSwiftParseNode.
	self else notNil
		ifTrue: [ self else parent: self ]
]

{ #category : #generated }
SwiftIfStatementNode >> elseToken [
	^ elseToken
]

{ #category : #generated }
SwiftIfStatementNode >> elseToken: aSmaCCToken [
	elseToken := aSmaCCToken
]

{ #category : #generated }
SwiftIfStatementNode >> expression [
	^ expression
]

{ #category : #generated }
SwiftIfStatementNode >> expression: anObject [
	expression := anObject
]

{ #category : #generated }
SwiftIfStatementNode >> ifToken [
	^ ifToken
]

{ #category : #generated }
SwiftIfStatementNode >> ifToken: aSmaCCToken [
	ifToken := aSmaCCToken
]

{ #category : #generated }
SwiftIfStatementNode >> nodeVariables [
	^ #(#then #else)
]

{ #category : #generated }
SwiftIfStatementNode >> otherVariables [
	^ #(#expression)
]

{ #category : #generated }
SwiftIfStatementNode >> then [
	^ then
]

{ #category : #generated }
SwiftIfStatementNode >> then: aSwiftBlockNode [
	self then notNil
		ifTrue: [ self then parent: nil ].
	then := aSwiftBlockNode.
	self then notNil
		ifTrue: [ self then parent: self ]
]

{ #category : #generated }
SwiftIfStatementNode >> tokenVariables [
	^ #(#ifToken #elseToken #semicolonToken)
]
