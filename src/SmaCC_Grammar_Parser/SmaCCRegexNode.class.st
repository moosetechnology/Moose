Class {
	#name : #SmaCCRegexNode,
	#superclass : #SmaCCDefinitionNode,
	#instVars : [
		'leftParens',
		'rightParens'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCRegexNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitRegex: self
]

{ #category : #generated }
SmaCCRegexNode >> compositeTokenVariables [
	^ #(#leftParens #rightParens)
]

{ #category : #'generated-initialize-release' }
SmaCCRegexNode >> initialize [
	super initialize.
	leftParens := OrderedCollection new: 2.
	rightParens := OrderedCollection new: 2.
]

{ #category : #generated }
SmaCCRegexNode >> leftParens [
	^ leftParens
]

{ #category : #generated }
SmaCCRegexNode >> leftParens: anOrderedCollection [
	leftParens := anOrderedCollection
]

{ #category : #generated }
SmaCCRegexNode >> rightParens [
	^ rightParens
]

{ #category : #generated }
SmaCCRegexNode >> rightParens: anOrderedCollection [
	rightParens := anOrderedCollection
]
