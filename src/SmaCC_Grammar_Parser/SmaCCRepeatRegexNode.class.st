Class {
	#name : #SmaCCRepeatRegexNode,
	#superclass : #SmaCCRegexNode,
	#instVars : [
		'regex',
		'count'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCRepeatRegexNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitRepeatRegex: self
]

{ #category : #generated }
SmaCCRepeatRegexNode >> count [
	^ count
]

{ #category : #generated }
SmaCCRepeatRegexNode >> count: aSmaCCToken [
	count := aSmaCCToken
]

{ #category : #generated }
SmaCCRepeatRegexNode >> nodeVariables [
	^ #(#regex)
]

{ #category : #generated }
SmaCCRepeatRegexNode >> regex [
	^ regex
]

{ #category : #generated }
SmaCCRepeatRegexNode >> regex: aSmaCCRegexNode [
	self regex notNil
		ifTrue: [ self regex parent: nil ].
	regex := aSmaCCRegexNode.
	self regex notNil
		ifTrue: [ self regex parent: self ]
]

{ #category : #generated }
SmaCCRepeatRegexNode >> tokenVariables [
	^ #(#count)
]
