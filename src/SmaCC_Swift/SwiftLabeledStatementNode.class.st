Class {
	#name : #SwiftLabeledStatementNode,
	#superclass : #SwiftStatementNode,
	#instVars : [
		'name',
		'colonToken',
		'statement',
		'semicolonToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftLabeledStatementNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitLabeledStatement: self
]

{ #category : #generated }
SwiftLabeledStatementNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
SwiftLabeledStatementNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
SwiftLabeledStatementNode >> name [
	^ name
]

{ #category : #generated }
SwiftLabeledStatementNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
SwiftLabeledStatementNode >> nodeVariables [
	^ #(#statement)
]

{ #category : #generated }
SwiftLabeledStatementNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
SwiftLabeledStatementNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
SwiftLabeledStatementNode >> statement [
	^ statement
]

{ #category : #generated }
SwiftLabeledStatementNode >> statement: aSwiftStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aSwiftStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
SwiftLabeledStatementNode >> tokenVariables [
	^ #(#name #colonToken #semicolonToken)
]
