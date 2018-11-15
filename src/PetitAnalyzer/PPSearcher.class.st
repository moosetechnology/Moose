"
PPSearcher walks over a grammar specification and matches its parsers against the patterns using #match:inContext:.

Instance Variables:
	answer <Object>	The answer propagated between matches.
"
Class {
	#name : #PPSearcher,
	#superclass : #PPProcessor,
	#instVars : [
		'answer'
	],
	#category : #'PetitAnalyzer-Core'
}

{ #category : #private }
PPSearcher >> answer [
	^ answer
]

{ #category : #public }
PPSearcher >> execute: aParser [
	"Perform the search rules of the receiver on aParser. Answer the result of the search."

	^ self execute: aParser initialAnswer: nil
]

{ #category : #public }
PPSearcher >> execute: aParser initialAnswer: anObject [
	"Perform the search rules of the receiver on aParser. Inject anObject into the matches and answer the result."

	| previous |
	previous := context.
	answer := anObject.
	context := Dictionary new.
	aParser allParsersDo: [ :each | 
		self performRulesOn: each ].
	context := previous.
	^ answer
]

{ #category : #rules }
PPSearcher >> matches: aParser do: anAnswerBlock [
	"Add a search expression aParser, evaluate anAnswerBlock with the matched node and the previous answer."

	self addRule: (PPSearchRule searchFor: aParser thenDo: anAnswerBlock)
]

{ #category : #rules }
PPSearcher >> matchesAnyOf: aCollectionOfParsers do: anAnswerBlock [
	"Add a collection of search expressions aCollectionOfParsers, evaluate anAnswerBlock with the matched node and the previous answer."
	
	aCollectionOfParsers
		do: [ :each | self matches: each do: anAnswerBlock ]
]

{ #category : #initialization }
PPSearcher >> setAnswer: anObject [
	answer := anObject
]
