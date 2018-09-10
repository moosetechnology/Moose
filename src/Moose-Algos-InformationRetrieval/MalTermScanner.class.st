"
TermScanner breaks an input stream into tokens. 

example: stream
	| scanner |
	scanner := TermScanner new.
	scanner onStream: stream.
	[ scanner atEnd ] 
		whileFalse: 
			[ scanner next ]		

Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalTermScanner,
	#superclass : #Object,
	#instVars : [
		'stream',
		'buffer',
		'term'
	],
	#classVars : [
		'Void'
	],
	#category : #'Moose-Algos-InformationRetrieval'
}

{ #category : #'instance creation' }
MalTermScanner class >> new [
	
	^self basicNew initialize
]

{ #category : #running }
MalTermScanner class >> scan: input [

	| scanner |
	scanner := self new onStream: input readStream.
	^ scanner allTerms.
]

{ #category : #running }
MalTermScanner >> allTerms [

	| bag |	
	bag := MalTerms new.
	[self atEnd] whileFalse: [bag add: self next].
	^bag
]

{ #category : #scanning }
MalTermScanner >> atEnd [

	term == Void ifTrue: [term := self privateNext].	
	^term isNil
]

{ #category : #'initialize-release' }
MalTermScanner >> initialize [
	
	buffer := String new writeStream
]

{ #category : #scanning }
MalTermScanner >> next [
	
	^term == Void
		ifTrue: [self privateNext]
		ifFalse:
			[ |result|
			result := term.
			term := Void.
			result]
]

{ #category : #running }
MalTermScanner >> onFile: filename [
	
	self onStream: filename asFileReference readStream
]

{ #category : #running }
MalTermScanner >> onStream: input [
	
	stream := input.
	term := Void
]

{ #category : #running }
MalTermScanner >> onString: text [
	
	self onStream: text readStream
]

{ #category : #private }
MalTermScanner >> privateNext [

	| next |	
	buffer reset.

	[	[(next := stream informationRetrievalNext) isLetter ] whileFalse.
		[buffer nextPut: next asLowercase.
		 (next := stream informationRetrievalNext) isLetter] whileTrue.
		[(next := stream informationRetrievalNext) isLetter ] whileFalse.
		stream skip: -1.
	] on: Stream endOfStreamSignal do: [:ex | "-- do nothing" ].
	
	^buffer contents isEmpty
		ifTrue: [nil]
		ifFalse: [buffer contents]
]

{ #category : #accessing }
MalTermScanner >> stream [
	
	^stream
]
