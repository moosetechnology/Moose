Class {
	#name : #JSLabelledStatementNode,
	#superclass : #JSStatementNode,
	#instVars : [
		'label',
		'colonToken',
		'statement'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSLabelledStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitLabelledStatement: self
]

{ #category : #generated }
JSLabelledStatementNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
JSLabelledStatementNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
JSLabelledStatementNode >> ignoredTokenVariables [
	^ #(#colonToken)
]

{ #category : #generated }
JSLabelledStatementNode >> label [
	^ label
]

{ #category : #generated }
JSLabelledStatementNode >> label: aSmaCCToken [
	label := aSmaCCToken
]

{ #category : #generated }
JSLabelledStatementNode >> nodeVariables [
	^ #(#statement)
]

{ #category : #generated }
JSLabelledStatementNode >> statement [
	^ statement
]

{ #category : #generated }
JSLabelledStatementNode >> statement: aJSStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aJSStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
JSLabelledStatementNode >> tokenVariables [
	^ #(#label)
]
