"
A parser accepts a sequence of literal objects, such as a String. This is an optimization to avoid having to compose longer sequences from PPSequenceParser.
"
Class {
	#name : #PPLiteralSequenceParser,
	#superclass : #PPLiteralParser,
	#instVars : [
		'size'
	],
	#category : #'PetitParser-Parsers'
}

{ #category : #operators }
PPLiteralSequenceParser >> caseInsensitive [
	"Answer a parser that can parse the receiver case-insensitive."
	
	literal asUppercase = literal asLowercase ifTrue: [ ^ self ].
	^ PPPredicateSequenceParser on: [ :value | literal sameAs: value ] message: message size: size
]

{ #category : #initialization }
PPLiteralSequenceParser >> initializeOn: anObject message: aString [
	super initializeOn: anObject message: aString.
	size := literal size
]

{ #category : #parsing }
PPLiteralSequenceParser >> parseOn: aPPContext [
	| memento result |
	memento := aPPContext remember.
	result := aPPContext next: size.
	literal = result ifTrue: [ ^ result ].
	aPPContext restore: memento.
	^ PPFailure message: message context: aPPContext
]

{ #category : #accessing }
PPLiteralSequenceParser >> size [
	"Answer the sequence size of the receiver."

	^ size
]
