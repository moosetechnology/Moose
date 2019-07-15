Class {
	#name : #JSSuperNamedPropertyExpressionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'superToken',
		'periodToken',
		'name'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSSuperNamedPropertyExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSuperNamedPropertyExpression: self
]

{ #category : #generated }
JSSuperNamedPropertyExpressionNode >> name [
	^ name
]

{ #category : #generated }
JSSuperNamedPropertyExpressionNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
JSSuperNamedPropertyExpressionNode >> periodToken [
	^ periodToken
]

{ #category : #generated }
JSSuperNamedPropertyExpressionNode >> periodToken: aSmaCCToken [
	periodToken := aSmaCCToken
]

{ #category : #generated }
JSSuperNamedPropertyExpressionNode >> superToken [
	^ superToken
]

{ #category : #generated }
JSSuperNamedPropertyExpressionNode >> superToken: aSmaCCToken [
	superToken := aSmaCCToken
]

{ #category : #generated }
JSSuperNamedPropertyExpressionNode >> tokenVariables [
	^ #(#superToken #periodToken #name)
]
