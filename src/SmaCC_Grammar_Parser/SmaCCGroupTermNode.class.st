Class {
	#name : #SmaCCGroupTermNode,
	#superclass : #SmaCCDefinitionNode,
	#instVars : [
		'leftParen',
		'barTokens',
		'expressions',
		'rightParen'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCGroupTermNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitGroupTerm: self
]

{ #category : #accessing }
SmaCCGroupTermNode >> allPossibilities [
	^ self hasReductionExpression
		ifTrue: [ 1 ]
		ifFalse: [ (expressions inject: 0 into: [ :sum :each | sum + each allPossibilities ]) max: 1 ]
]

{ #category : #iterating }
SmaCCGroupTermNode >> alternativesDo: aBlock [
	expressions do: [ :each | aBlock value: each terms ]
]

{ #category : #generated }
SmaCCGroupTermNode >> barTokens [
	^ barTokens
]

{ #category : #generated }
SmaCCGroupTermNode >> barTokens: anOrderedCollection [
	barTokens := anOrderedCollection
]

{ #category : #generated }
SmaCCGroupTermNode >> compositeNodeVariables [
	^ #(#expressions)
]

{ #category : #generated }
SmaCCGroupTermNode >> compositeTokenVariables [
	^ #(#barTokens)
]

{ #category : #generated }
SmaCCGroupTermNode >> expressions [
	^ expressions
]

{ #category : #generated }
SmaCCGroupTermNode >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #testing }
SmaCCGroupTermNode >> hasReductionExpression [
	^ expressions anySatisfy: [ :each | each hasReductionExpression ]
]

{ #category : #'generated-initialize-release' }
SmaCCGroupTermNode >> initialize [
	super initialize.
	barTokens := OrderedCollection new: 2.
	expressions := OrderedCollection new: 2.
]

{ #category : #testing }
SmaCCGroupTermNode >> isGroup [
	^ true
]

{ #category : #generated }
SmaCCGroupTermNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
SmaCCGroupTermNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #accessing }
SmaCCGroupTermNode >> possibilities [
	^ self hasReductionExpression
		ifTrue: [ 1 ]
		ifFalse: [ expressions size ]
]

{ #category : #generated }
SmaCCGroupTermNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
SmaCCGroupTermNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
SmaCCGroupTermNode >> tokenVariables [
	^ #(#leftParen #rightParen)
]

{ #category : #accessing }
SmaCCGroupTermNode >> variableNameToken [
	^ nil
]
