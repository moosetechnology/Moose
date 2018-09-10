"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalStopwordsTest,
	#superclass : #TestCase,
	#instVars : [
		'sw'
	],
	#category : #'Moose-Tests-Algos-InformationRetrieval'
}

{ #category : #running }
MalStopwordsTest >> testFewWords [
	sw := MalStopwords fromString: 'and the super of a'.
	self assert: sw size equals: 5.
	^ sw
]

{ #category : #running }
MalStopwordsTest >> testIncludesFalse [
	
	sw := MalStopwords fromString: 'and the super of a'.
	self assert: (sw includes: 'A') not.
	self assert: (sw includes: 'offer') not.
	self assert: (sw includes: '') not.
	self assert: (sw includes: 'object') not.
	self assert: (sw includes: nil) not.
	^sw
]

{ #category : #running }
MalStopwordsTest >> testIncludesTrue [
	
	sw := MalStopwords fromString: 'and the super of a'.
	self assert: (sw includes: 'a').
	self assert: (sw includes: 'of').
	self assert: (sw includes: 'and').
	self assert: (sw includes: 'the').
	self assert: (sw includes: 'super').
	^sw
]
