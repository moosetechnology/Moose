"
A parser that silently consumes spaces before and after the delegate parser.
"
Class {
	#name : #PPTrimmingParser,
	#superclass : #PPDelegateParser,
	#instVars : [
		'trimmer'
	],
	#category : #'PetitParser-Parsers'
}

{ #category : #'instance creation' }
PPTrimmingParser class >> on: aParser trimmer: aTrimParser [
	^ self new
		setParser: aParser;
		setTrimmer: aTrimParser;
		yourself
]

{ #category : #parsing }
PPTrimmingParser >> parseOn: aPPContext [
	| memento element trimContext |
	memento := aPPContext remember.
	trimContext := aPPContext copy.
	[ (trimmer parseOn: trimContext) isPetitFailure ]
		whileFalse.
	element := parser parseOn: aPPContext.
	element isPetitFailure ifTrue: [
		aPPContext restore: memento.
		^ element ].
	[ (trimmer parseOn: trimContext) isPetitFailure ]
		whileFalse.
	^ element
]

{ #category : #initialization }
PPTrimmingParser >> setTrimmer: aParser [
	trimmer := aParser
]
