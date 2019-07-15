"
PPRule is the abstract superclass of all of the grammar search rules. A rule is the first class representation of a particular pattern to search for. The owner of the rule is the algorithms that actually executes the search. This arrangement allows multiple searches to be conducted by a single processor.

Instance Variables:
	owner	<PPProcessor>	The processor that is actually performing the search.
	search	<PPParser>	The parse pattern to be searched.

"
Class {
	#name : #PPRule,
	#superclass : #Object,
	#instVars : [
		'owner',
		'search'
	],
	#category : #'PetitAnalyzer-Core'
}

{ #category : #'instance creation' }
PPRule class >> new [
	^ self basicNew initialize
]

{ #category : #'instance creation' }
PPRule class >> searchFor: aParser [
	^ self new setSearch: aParser
]

{ #category : #matching }
PPRule >> canMatch: aParser [ 
	^ true
]

{ #category : #matching }
PPRule >> foundMatchFor: aParser [ 
	self subclassResponsibility
]

{ #category : #initialization }
PPRule >> initialize [
]

{ #category : #matching }
PPRule >> performOn: aParser [
	(search match: aParser inContext: owner context)
		ifFalse: [ ^ nil ].
	(self canMatch: aParser)
		ifFalse: [ ^ nil ].
	^ self foundMatchFor: aParser
]

{ #category : #initialization }
PPRule >> setOwner: aGrammarSearcher [
	owner := aGrammarSearcher
]

{ #category : #initialization }
PPRule >> setSearch: aParser [
	search := aParser
]
