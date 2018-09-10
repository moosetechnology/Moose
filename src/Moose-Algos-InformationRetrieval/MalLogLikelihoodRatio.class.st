"
Compares term bags.

Copyright (c), 2009 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.


"
Class {
	#name : #MalLogLikelihoodRatio,
	#superclass : #Object,
	#instVars : [
		'terms1',
		'terms2'
	],
	#category : #'Moose-Algos-InformationRetrieval'
}

{ #category : #'instance creation' }
MalLogLikelihoodRatio class >> with: terms1 and: terms2 [
	
	^self new
		setTerms1: terms1;
		setTerms2: terms2;
		yourself
]

{ #category : #accessing }
MalLogLikelihoodRatio >> bottom: ten [
	
	^self computeAll last: ten
]

{ #category : #accessing }
MalLogLikelihoodRatio >> bottomTen [
	
	^self bottom: 10
]

{ #category : #accessing }
MalLogLikelihoodRatio >> computeAll [
	
	| comparison |
	comparison := (terms1 asSet union: terms2 asSet) asArray
		collect: [:each | each -> (self computeLogLR: each)].
	^(comparison sorted: #value asSortBlock) reversed
]

{ #category : #accessing }
MalLogLikelihoodRatio >> computeAllOfTerms1 [
	
	| comparison |
	comparison := terms1 asSet asArray
		collect: [:each | each -> (self computeLogLR: each)].
	^(comparison sorted: #value asSortBlock) reversed
]

{ #category : #computing }
MalLogLikelihoodRatio >> computeLogLR: aString [
	
	| k1 k2 n1 n2 p1 p2 p |
	k1 := terms1 occurrencesOf: aString.
	k2 := terms2 occurrencesOf: aString.
	n1 := terms1 fastSize.
	n2 := terms2 fastSize.
	p1 := k1 / n1 asFloat.
	p2 := k2 / n2 asFloat.
	p := (k1 + k2) / (n1 + n2) asFloat.
	^(p1 - p2) sign * 2
		*
			((self logL: p1 and: k1 and: n1) + (self logL: p2 and: k2 and: n2)
				- (self logL: p and: k1 and: n1) - (self logL: p and: k2 and: n2))
]

{ #category : #computing }
MalLogLikelihoodRatio >> logL: p and: k and: n [
	
	^0 = k
		ifTrue: [0]
		ifFalse:
			[k * p ln
				+
					(0 = (n - k)
						ifTrue: [0]
						ifFalse: [(n - k) * (1 - p) ln])]
]

{ #category : #'initialize-release' }
MalLogLikelihoodRatio >> setTerms1: aHapaxTerms [
	
	terms1 := aHapaxTerms
]

{ #category : #'initialize-release' }
MalLogLikelihoodRatio >> setTerms2: aHapaxTerms [
	
	terms2 := aHapaxTerms
]

{ #category : #accessing }
MalLogLikelihoodRatio >> terms1 [
	
	^terms1
]

{ #category : #accessing }
MalLogLikelihoodRatio >> terms2 [
	
	^terms2
]

{ #category : #accessing }
MalLogLikelihoodRatio >> top: ten [
	
	^self computeAll first: ten
]

{ #category : #accessing }
MalLogLikelihoodRatio >> topTen [
	
	^self top: 10
]
