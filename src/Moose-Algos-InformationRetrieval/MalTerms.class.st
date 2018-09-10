"
Terms subclasses Bag with support for handling stopwords etc.

example: string
	| terms |
	terms := Terms new.
	terms addString: string using: CamelCaseScanner new.
	terms withCoundDo: [ :term :count |
		term -> count ].

Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalTerms,
	#superclass : #Bag,
	#instVars : [
		'size'
	],
	#category : #'Moose-Algos-InformationRetrieval'
}

{ #category : #examples }
MalTerms class >> bible [
	
	^(MalTermScanner new)
		onFile: 'bible10.txt';
		allTerms
]

{ #category : #'instance creation' }
MalTerms class >> fromCamelcaseString: aString [
	
	^((MalCamelcaseScanner new onString: aString) allTerms)
		stemAll;
		removeStopwords
]

{ #category : #'instance creation' }
MalTerms class >> fromFile: aFile [
	
	^(MalTermScanner new)
		onFile: aFile;
		allTerms
]

{ #category : #'instance creation' }
MalTerms class >> fromString: aString [

	| scanner |
	scanner := (MalTermScanner new)	..
	scanner onString: aString.	
	^ scanner allTerms.
			
		
]

{ #category : #examples }
MalTerms class >> sample [
	
	^self fromString:
			'I think that I shall never see
		a graph more lovely than a tree.
		A tree whose crucial property
		is loop-free connectivity.
		A tree that must be sure to span
		so packet can reach every LAN.
		First, the root must be selected.
		By ID, it is elected.
		Least-cost paths from root are traced.
		In the tree, these paths are placed.
		A mesh is made by folks like me,
		then bridges find a spanning tree.'
]

{ #category : #adding }
MalTerms >> addString: string [
	
	^self addString: string using: MalTermScanner
]

{ #category : #adding }
MalTerms >> addString: string using: scannerClass [
	
	| scanner |
	scanner := scannerClass new.
	scanner onString: string.
	[scanner atEnd] whileFalse: [self add: scanner next]
]

{ #category : #adding }
MalTerms >> addTerms: aTerms [
	
	aTerms withCountDo: [:each :count | self add: each withOccurrences: count]
]

{ #category : #accessing }
MalTerms >> distinctSize [
	
	^contents associations size
]

{ #category : #accessing }
MalTerms >> fastSize [
	
	^size ifNil: [size := super size]
]

{ #category : #converting }
MalTerms >> normalized [
	
	| newTerms sum length |
	newTerms := MalTerms new: contents size.
	sum := 0.
	contents do: [:count | sum := sum + (count * count)].
	length := sum sqrt.
	self withCountDo: [:each :count | 
		newTerms add: each withOccurrences: count asFloat / length].
	^newTerms
]

{ #category : #removing }
MalTerms >> prune [
	
	self removeStopwords.
	self stemAll.
	self removeHapaxes.
]

{ #category : #removing }
MalTerms >> removeHapaxes [
	
	self removeRareTerms: 1
]

{ #category : #removing }
MalTerms >> removeRareTerms: occurrence [
	
	| newTerms |
	newTerms := MalTerms new: contents capacity.
	self withCountDo: [:term :count | 
		count > occurrence
			ifTrue: [newTerms add: (MalStemmer stem: term) withOccurrences: count]].
	self become: newTerms
]

{ #category : #removing }
MalTerms >> removeStopwords [

	^self removeStopwords:  MalStopwords English
]

{ #category : #removing }
MalTerms >> removeStopwords: stopwords [

	stopwords do: [:each | 
		contents removeKey: each ifAbsent: nil]
]

{ #category : #removing }
MalTerms >> stemAll [
	
	| newTerms |
	newTerms := MalTerms new: contents capacity.
	self
		withCountDo:
			[:term :count | 
			newTerms
				add: (MalStemmer stem: term) 
				withOccurrences: count].
	self become: newTerms
]

{ #category : #enumerating }
MalTerms >> termsDo: aBlock [
	
	contents associationsDo: [:each | aBlock value: each key]	"!!! value -> count !!!"
]

{ #category : #converting }
MalTerms >> top: topTenSize [
	
	^(self sortedCounts first: topTenSize) collect: #key
]

{ #category : #converting }
MalTerms >> topTen [
	
	^(self sortedCounts first: 10) collect: #value
]

{ #category : #enumerating }
MalTerms >> withCountDo: aBlock [
	
	contents
		associationsDo:
			[:each | 
			aBlock
				value: each key
				value: each value]
]
