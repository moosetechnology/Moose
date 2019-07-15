"
PPProcessor is an abstract superclass to PPRewriter and PPSearcher. It implements common functionality to search and transform grammars.

The implementation of these matching algorithms is inspired from the refactoring engine by Don Roberts and John Brant. Contrary to the original implementation that worked on syntax trees, this implementation was generalized and works on possibly cyclic search patterns and grammar graphs.

Instance Variables:
	searches	<Collection of: PPRule>	The rules to be processed.
	context	<Dictionary>	The current search context.
"
Class {
	#name : #PPProcessor,
	#superclass : #Object,
	#instVars : [
		'searches',
		'context'
	],
	#category : #'PetitAnalyzer-Core'
}

{ #category : #'instance creation' }
PPProcessor class >> new [
	^ self basicNew initialize
]

{ #category : #rules }
PPProcessor >> addRule: aGrammarRule [
	searches add: (aGrammarRule setOwner: self)
]

{ #category : #private }
PPProcessor >> context [
	^ context
]

{ #category : #initialization }
PPProcessor >> initialize [
	super initialize.
	searches := OrderedCollection new.
	context := Dictionary new
]

{ #category : #private }
PPProcessor >> performRule: aRule on: aParser [
	context := Dictionary new.
	^ aRule performOn: aParser
]

{ #category : #private }
PPProcessor >> performRulesOn: aParser [
	| result |
	searches do: [ :rule |
		result := self performRule: rule on: aParser.
		result notNil ifTrue: [ ^ result ] ].
	^ nil
]
