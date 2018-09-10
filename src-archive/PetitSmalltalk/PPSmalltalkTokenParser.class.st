"
A parser that knows how to skip comments and whitespace in Smalltalk and how to instantiate tokens
"
Class {
	#name : #PPSmalltalkTokenParser,
	#superclass : #PPTokenParser,
	#classVars : [
		'SeparatorPredicate'
	],
	#category : #'PetitSmalltalk-Core'
}

{ #category : #initialization }
PPSmalltalkTokenParser class >> initialize [
	SeparatorPredicate := PPCharSetPredicate on: [ :char | char isSeparator ]
]

{ #category : #private }
PPSmalltalkTokenParser >> defaultTokenClass [
	^ PPSmalltalkToken
]

{ #category : #parsing }
PPSmalltalkTokenParser >> parseComments: anArray on: aPPContext [
	| start comments |
	comments := anArray.
	[ [ aPPContext atEnd not and: [ SeparatorPredicate value: aPPContext uncheckedPeek ] ]
		whileTrue: [ aPPContext next ].
	 aPPContext atEnd not and: [ aPPContext uncheckedPeek = $" ] ] whileTrue: [
		aPPContext next.
		start := aPPContext position.
		aPPContext upTo: $".
		comments := comments copyWith: (start to: aPPContext position) ].
	^ comments
]

{ #category : #parsing }
PPSmalltalkTokenParser >> parseOn: aPPContext [
	| memento comments token |
	memento := aPPContext remember.
	comments := self
		parseComments: #()
		on: aPPContext.
	token := super parseOn: aPPContext.
	token isPetitFailure ifTrue: [
		aPPContext restore: memento.
		^ token ].
	comments := self
		parseComments: comments
		on: aPPContext.
	^ token comments: comments
]
