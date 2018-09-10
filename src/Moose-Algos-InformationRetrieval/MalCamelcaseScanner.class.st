"
CamelcaseScanner breaks an input stream into tokens, with respect to camel case.

Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalCamelcaseScanner,
	#superclass : #MalTermScanner,
	#instVars : [
		'next'
	],
	#category : #'Moose-Algos-InformationRetrieval'
}

{ #category : #example }
MalCamelcaseScanner class >> bible [

	^self new
		onFile: 'bible10.txt';
		allTerms
]

{ #category : #'initialize-release' }
MalCamelcaseScanner >> onStream: input [

	super onStream: input.
	next := Character space
]

{ #category : #private }
MalCamelcaseScanner >> privateNext [

	next isNil ifTrue: [^nil].
	buffer reset.
	[self xWhitespace.
	 next isLowercase
		ifTrue: [self xLowercaseWord]
		ifFalse: [self xCapitalizedWord]
	] on: Stream endOfStreamSignal do: [:ex | next := nil].

	^buffer contents isEmpty
		ifTrue: [nil]
		ifFalse: [buffer contents]
]

{ #category : #private }
MalCamelcaseScanner >> xCapitalizedWord [

	buffer nextPut: next.
	next := stream informationRetrievalNext.
	next isLetter
		ifTrue: [ next isLowercase
				ifTrue: [	buffer collection at: 1put: buffer collection first asLowercase.
						self xLowercaseWord ]
				ifFalse: [self xUppercaseWord]
		]
]

{ #category : #private }
MalCamelcaseScanner >> xLowercaseWord [

	[buffer nextPut: next.
	 next := stream informationRetrievalNext.
	 next isLowercase] whileTrue
]

{ #category : #private }
MalCamelcaseScanner >> xUppercaseWord [

	[	|peek|
		peek := stream peek.
		next isLetter and: [peek == nil or: [peek isLowercase not]]
	] whileTrue: [
		buffer nextPut: next.
		 next := stream informationRetrievalNext ]
]

{ #category : #private }
MalCamelcaseScanner >> xWhitespace [
	
	| previous |
	next isLetter
		ifFalse:
			[[previous := next.
			next := stream informationRetrievalNext.
			($0 == next and: [previous isSeparator]) ifTrue: [self xZeroWord].
			next isLetter] whileFalse]
]

{ #category : #private }
MalCamelcaseScanner >> xZeroWord [
	
	[next isAlphaNumeric] whileTrue: [next := stream informationRetrievalNext]
]
