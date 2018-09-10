"
AbstractStemmer is an abstract superclass for Porter-like stemmers.

Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalAbstractStemmer,
	#superclass : #MalStemmer,
	#instVars : [
		'string',
		'r1',
		'r2',
		'cursor'
	],
	#category : #'Moose-Algos-InformationRetrieval'
}

{ #category : #'private-algorithm' }
MalAbstractStemmer >> endsWith: aSuffix [
	"comment stating purpose of message"
	
	| position |
	position := string size - aSuffix size.
	position < 0 ifTrue: [^false].
	1
		to: aSuffix size
		do:
			[:index | (aSuffix at: index) ~~ (string at: position + index) ifTrue: [^false]].
	cursor := position.
	^true
]

{ #category : #'private-algorithm' }
MalAbstractStemmer >> endsWith: aSuffix in: aMark [
	
	^(self endsWith: aSuffix) and: [cursor >= aMark]
]

{ #category : #'private-algorithm' }
MalAbstractStemmer >> isConsonantAt: anIndex [
	
	^(self isVowelAt: anIndex) not
]

{ #category : #'private-algorithm' }
MalAbstractStemmer >> isVowelAt: anIndex [
	
	self subclassResponsibility
]

{ #category : #'private-algorithm' }
MalAbstractStemmer >> removeSuffix [
	"comment stating purpose of message"
	
	string := string copyFrom: 1 to: cursor
]

{ #category : #'private-algorithm' }
MalAbstractStemmer >> setMarks [
	"All the stemmers make use of at least one of the region definitions R1 and R2. They are defined as follows: 
		R1 is the region after the first non-vowel following a vowel, or is the null region at the end of the word if there is no such non-vowel. 
		R2 is the region after the first non-vowel following a vowel in R1, or is the null region at the end of the word if there is no such non-vowel. 
	The definition of vowel varies from language to language."
	
	| n last |
	string size = 1 ifTrue: [^r1 := r2 := 1].
	last := self isVowelAt: 1.
	n := 2.
	[n <= string size and: [last not | (last := self isVowelAt: n)]]
		whileTrue: [n := n + 1].
	r1 := n.
	n := n + 1.
	[n <= string size and: [last not | (last := self isVowelAt: n)]]
		whileTrue: [n := n + 1].
	r2 := n
]

{ #category : #'private-algorithm' }
MalAbstractStemmer >> setSuffix: newSuffix [
	"comment stating purpose of message"
	
	string := (string copyFrom: 1 to: cursor) , newSuffix
]
