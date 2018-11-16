Class {
	#name : #SmaCCProductionRuleNode,
	#superclass : #SmaCCDefinitionNode,
	#instVars : [
		'name',
		'colon',
		'barTokens',
		'expressions',
		'semicolon'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCProductionRuleNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitProductionRule: self
]

{ #category : #generated }
SmaCCProductionRuleNode >> barTokens [
	^ barTokens
]

{ #category : #generated }
SmaCCProductionRuleNode >> barTokens: anOrderedCollection [
	barTokens := anOrderedCollection
]

{ #category : #generated }
SmaCCProductionRuleNode >> colon [
	^ colon
]

{ #category : #generated }
SmaCCProductionRuleNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
SmaCCProductionRuleNode >> compositeNodeVariables [
	^ #(#expressions)
]

{ #category : #generated }
SmaCCProductionRuleNode >> compositeTokenVariables [
	^ #(#barTokens)
]

{ #category : #generated }
SmaCCProductionRuleNode >> expressions [
	^ expressions
]

{ #category : #generated }
SmaCCProductionRuleNode >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #'generated-initialize-release' }
SmaCCProductionRuleNode >> initialize [
	super initialize.
	barTokens := OrderedCollection new: 2.
	expressions := OrderedCollection new: 2.
]

{ #category : #generated }
SmaCCProductionRuleNode >> name [
	^ name
]

{ #category : #generated }
SmaCCProductionRuleNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
SmaCCProductionRuleNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
SmaCCProductionRuleNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
SmaCCProductionRuleNode >> tokenVariables [
	^ #(#name #colon #semicolon)
]
