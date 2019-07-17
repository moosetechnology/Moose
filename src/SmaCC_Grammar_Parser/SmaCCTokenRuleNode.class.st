Class {
	#name : #SmaCCTokenRuleNode,
	#superclass : #SmaCCDefinitionNode,
	#instVars : [
		'name',
		'colon',
		'regex',
		'semicolon',
		'states'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCTokenRuleNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitTokenRule: self
]

{ #category : #generated }
SmaCCTokenRuleNode >> colon [
	^ colon
]

{ #category : #generated }
SmaCCTokenRuleNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
SmaCCTokenRuleNode >> compositeTokenVariables [
	^ #(#states)
]

{ #category : #'generated-initialize-release' }
SmaCCTokenRuleNode >> initialize [
	super initialize.
	states := OrderedCollection new: 2.
]

{ #category : #testing }
SmaCCTokenRuleNode >> isTokenRule [
	^ true
]

{ #category : #generated }
SmaCCTokenRuleNode >> name [
	^ name
]

{ #category : #generated }
SmaCCTokenRuleNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
SmaCCTokenRuleNode >> nodeVariables [
	^ #(#regex)
]

{ #category : #generated }
SmaCCTokenRuleNode >> regex [
	^ regex
]

{ #category : #generated }
SmaCCTokenRuleNode >> regex: aSmaCCRegexNode [
	self regex notNil
		ifTrue: [ self regex parent: nil ].
	regex := aSmaCCRegexNode.
	self regex notNil
		ifTrue: [ self regex parent: self ]
]

{ #category : #generated }
SmaCCTokenRuleNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
SmaCCTokenRuleNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
SmaCCTokenRuleNode >> states [
	^ states
]

{ #category : #generated }
SmaCCTokenRuleNode >> states: anOrderedCollection [
	states := anOrderedCollection
]

{ #category : #generated }
SmaCCTokenRuleNode >> tokenVariables [
	^ #(#name #colon #semicolon)
]
