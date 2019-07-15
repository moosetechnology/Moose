"
An abstract parser that accepts if a given predicate holds.

Instance Variables:
	predicate	<BlockClosure>	The block testing for the predicate.
	predicateMessage	<String>	The error message of the predicate.
	negated	<BlockClosure>	The block testing for the negation of the predicate.
	negatedMessage	<String>	The error message of the negated predicate.
"
Class {
	#name : #PPPredicateParser,
	#superclass : #PPParser,
	#instVars : [
		'predicate',
		'predicateMessage',
		'negated',
		'negatedMessage'
	],
	#category : #'PetitParser-Parsers'
}

{ #category : #accessing }
PPPredicateParser >> block [
	"Answer the predicate block of the receiver."
	
	^ predicate
]

{ #category : #accessing }
PPPredicateParser >> message [
	"Answer the failure message."
	
	^ predicateMessage
]

{ #category : #printing }
PPPredicateParser >> printNameOn: aStream [
	super printNameOn: aStream.
	aStream nextPutAll: ', '; print: predicateMessage
]
