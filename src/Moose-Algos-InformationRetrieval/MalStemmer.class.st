"
Stemmer reduces words to their morphological root.

example: string
	^PorterStemmer new stem: string

Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalStemmer,
	#superclass : #Object,
	#instVars : [
		'cache'
	],
	#classVars : [
		'English'
	],
	#category : #'Moose-Algos-InformationRetrieval'
}

{ #category : #stemming }
MalStemmer class >> English [

	^ English ifNil: [English := MalPorterStemmer new].
]

{ #category : #stemming }
MalStemmer class >> stem: aString [
	
	^self English stem: aString
]

{ #category : #'private-algorithm' }
MalStemmer >> cache [
	"Answer the cache of stemmed words."
	
	^cache isNil
		ifTrue: [cache := Dictionary new]
		ifFalse: [cache]
]

{ #category : #'private-algorithm' }
MalStemmer >> performStemming: aString [
	"Perform the stemming of a string."
	
	^self subclassResponsibility
]

{ #category : #accessing }
MalStemmer >> purgeCache [
	"Clear the recievers cache of stemmed words."
	
	cache := nil
]

{ #category : #accessing }
MalStemmer >> stem: aString [
	"Answer the the morphological root of a word, ie removes its suffix."
	
	^self cache
		at: aString
		ifAbsentPut: [self performStemming: aString]
]
