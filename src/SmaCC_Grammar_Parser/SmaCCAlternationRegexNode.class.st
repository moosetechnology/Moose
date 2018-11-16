Class {
	#name : #SmaCCAlternationRegexNode,
	#superclass : #SmaCCRegexNode,
	#instVars : [
		'items',
		'barTokens'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCAlternationRegexNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitAlternationRegex: self
]

{ #category : #generated }
SmaCCAlternationRegexNode >> barTokens [
	^ barTokens
]

{ #category : #generated }
SmaCCAlternationRegexNode >> barTokens: anOrderedCollection [
	barTokens := anOrderedCollection
]

{ #category : #generated }
SmaCCAlternationRegexNode >> compositeNodeVariables [
	^ #(#items)
]

{ #category : #generated }
SmaCCAlternationRegexNode >> compositeTokenVariables [
	^ #(#barTokens #leftParens #rightParens)
]

{ #category : #'generated-initialize-release' }
SmaCCAlternationRegexNode >> initialize [
	super initialize.
	items := OrderedCollection new: 2.
	barTokens := OrderedCollection new: 2.
]

{ #category : #generated }
SmaCCAlternationRegexNode >> items [
	^ items
]

{ #category : #generated }
SmaCCAlternationRegexNode >> items: anOrderedCollection [
	self setParents: self items to: nil.
	items := anOrderedCollection.
	self setParents: self items to: self
]
