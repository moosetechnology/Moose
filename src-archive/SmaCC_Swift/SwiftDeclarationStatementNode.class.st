Class {
	#name : #SwiftDeclarationStatementNode,
	#superclass : #SwiftStatementNode,
	#instVars : [
		'declaration',
		'semicolonToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftDeclarationStatementNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitDeclarationStatement: self
]

{ #category : #generated }
SwiftDeclarationStatementNode >> declaration [
	^ declaration
]

{ #category : #generated }
SwiftDeclarationStatementNode >> declaration: aSwiftParseNode [
	self declaration notNil
		ifTrue: [ self declaration parent: nil ].
	declaration := aSwiftParseNode.
	self declaration notNil
		ifTrue: [ self declaration parent: self ]
]

{ #category : #generated }
SwiftDeclarationStatementNode >> nodeVariables [
	^ #(#declaration)
]

{ #category : #generated }
SwiftDeclarationStatementNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
SwiftDeclarationStatementNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
SwiftDeclarationStatementNode >> tokenVariables [
	^ #(#semicolonToken)
]
