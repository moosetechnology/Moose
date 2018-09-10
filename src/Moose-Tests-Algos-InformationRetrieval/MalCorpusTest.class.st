"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalCorpusTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Algos-InformationRetrieval'
}

{ #category : #running }
MalCorpusTest >> testDeer90 [
	| deer |
	deer := MalCorpus deer90.
	self assert: deer documents size equals: 9.
	self assert: deer terms distinctSize equals: 42.
	^ deer
]

{ #category : #running }
MalCorpusTest >> testRemoveStopwords [
	| deer |
	deer := self testDeer90.
	self assert: (deer terms includes: 'the').
	deer removeStopwords.
	self assert: (deer terms includes: 'the') not.
	self assert: deer documents size equals: 9.
	self assert: deer terms distinctSize equals: 34.
	^ deer
]

{ #category : #running }
MalCorpusTest >> testStemDeer90 [
	| deer |
	deer := self testDeer90.
	self assert: (deer terms includes: 'trees').
	self assert: (deer terms includes: 'tree') not.
	deer stemAll.
	self assert: (deer terms includes: 'trees') not.
	self assert: (deer terms includes: 'tree').
	self assert: deer documents size equals: 9.
	self assert: deer terms distinctSize equals: 42.
	^ deer
]
