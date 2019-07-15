Class {
	#name : #SmaCCConcatenationRegexNode,
	#superclass : #SmaCCRegexNode,
	#instVars : [
		'items'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCConcatenationRegexNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitConcatenationRegex: self
]

{ #category : #generated }
SmaCCConcatenationRegexNode >> compositeNodeVariables [
	^ #(#items)
]

{ #category : #'generated-initialize-release' }
SmaCCConcatenationRegexNode >> initialize [
	super initialize.
	items := OrderedCollection new: 2.
]

{ #category : #generated }
SmaCCConcatenationRegexNode >> items [
	^ items
]

{ #category : #generated }
SmaCCConcatenationRegexNode >> items: anOrderedCollection [
	self setParents: self items to: nil.
	items := anOrderedCollection.
	self setParents: self items to: self
]
