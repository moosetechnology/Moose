"
Corpus maps document (which may be any kind of object) to Terms.
For convenience, there is special support for file documents.

Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalCorpus,
	#superclass : #Object,
	#instVars : [
		'documents'
	],
	#category : #'Moose-Algos-InformationRetrieval'
}

{ #category : #example }
MalCorpus class >> deer90 [
	"self deer90"
	
	| data corpus |
	data := #(#(#c1 'Human machine interface for Lab ABC computer applications') #(#c2 'A survey of user opinion of computer system response time') #(#c3 'The EPS user interface management system') #(#c4 'System and human system engineering testing of EPS') #(#c5 'Relation of user-perceived response time to error measurement') #(#m1 'The generation of random, binary, unordered trees') #(#m2 'The intersection graph of paths in trees') #(#m3 'Graph minors IV: Widths of trees and well-quasi-ordering') #(#m4 'Graph minors: A survey')).

	corpus := MalCorpus new.
	data do: [:each |
		corpus addDocument: each first with: (MalTerms fromString: each last)].
	^corpus
]

{ #category : #'instance creation' }
MalCorpus class >> new [
	
	^self basicNew initialize
]

{ #category : #adding }
MalCorpus >> addDocument: anObject [

	documents at: anObject ifAbsentPut: [MalTerms new]
]

{ #category : #adding }
MalCorpus >> addDocument: anObject with: terms [
		
	self addDocument: anObject.
	self atDocument: anObject add: terms
]

{ #category : #adding }
MalCorpus >> addDocument: aString withContent: contentString [
	
	self
		addDocument: aString
		with: (MalTerms new
				addString: contentString using: MalCamelcaseScanner;
				yourself)
]

{ #category : #adding }
MalCorpus >> addFile: aFilename [
	
	self
		addDocument: aFilename asString
		withContent: aFilename contentsOfEntireFile
]

{ #category : #adding }
MalCorpus >> addFolder: aFoldername [
	
	aFoldername asFileReference files do: [:each | self addFile: each]
]

{ #category : #adding }
MalCorpus >> addSimpleDocument: aSimpleDocument [
	
	| terms |
	terms := MalTerms new.
	aSimpleDocument termBag
		valuesAndCountsDo:
			[:value :count | terms add: value withOccurrences: count].
	self addDocument: aSimpleDocument with: terms
]

{ #category : #adding }
MalCorpus >> atDocument: anObject [
	
	^documents at: anObject
]

{ #category : #adding }
MalCorpus >> atDocument: anObject add: terms [
	
	(documents at: anObject) addAll: terms
]

{ #category : #enumerating }
MalCorpus >> documentTermCountDo: aBlock [
	
	documents
		keysAndValuesDo:
			[:document :terms | 
			terms
				withCountDo:
					[:term :count | aBlock value: document value: term value: count]]
]

{ #category : #accessing }
MalCorpus >> documents [
	
	^documents keys
]

{ #category : #'initialize-release' }
MalCorpus >> initialize [
	
	documents := Dictionary new
]

{ #category : #removing }
MalCorpus >> removeStopwords [

	documents do: [:each | each removeStopwords]
]

{ #category : #removing }
MalCorpus >> stemAll [
	
	documents do: [:each | each stemAll]
]

{ #category : #accessing }
MalCorpus >> terms [
	
	| all |
	all := MalTerms new.
	documents do: [:each | all addAll: each].
	^all
]
