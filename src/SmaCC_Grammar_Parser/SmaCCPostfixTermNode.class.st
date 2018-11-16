Class {
	#name : #SmaCCPostfixTermNode,
	#superclass : #SmaCCDefinitionNode,
	#instVars : [
		'term',
		'operator'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCPostfixTermNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitPostfixTerm: self
]

{ #category : #accessing }
SmaCCPostfixTermNode >> allPossibilities [
	self isOptional
		ifTrue: [ ^ term allPossibilities + 1 ].
	^ 1
]

{ #category : #iterating }
SmaCCPostfixTermNode >> alternativesDo: aBlock [
	self isOptional
		ifTrue: [ aBlock value: #().
			aBlock value: (Array with: term) ]
		ifFalse: [ aBlock value: (Array with: self) ]
]

{ #category : #testing }
SmaCCPostfixTermNode >> isOptional [
	^ operator value = '?'
]

{ #category : #generated }
SmaCCPostfixTermNode >> nodeVariables [
	^ #(#term)
]

{ #category : #generated }
SmaCCPostfixTermNode >> operator [
	^ operator
]

{ #category : #generated }
SmaCCPostfixTermNode >> operator: aSmaCCToken [
	operator := aSmaCCToken
]

{ #category : #accessing }
SmaCCPostfixTermNode >> possibilities [
	^ self isOptional
		ifTrue: [ 2 ]
		ifFalse: [ 1 ]
]

{ #category : #generated }
SmaCCPostfixTermNode >> term [
	^ term
]

{ #category : #generated }
SmaCCPostfixTermNode >> term: aSmaCCDefinitionNode [
	self term notNil
		ifTrue: [ self term parent: nil ].
	term := aSmaCCDefinitionNode.
	self term notNil
		ifTrue: [ self term parent: self ]
]

{ #category : #generated }
SmaCCPostfixTermNode >> tokenVariables [
	^ #(#operator)
]

{ #category : #accessing }
SmaCCPostfixTermNode >> variableNameToken [
	^ nil
]
