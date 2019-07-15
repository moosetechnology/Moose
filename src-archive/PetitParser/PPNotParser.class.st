"
The not-predicate, a parser that succeeds whenever its delegate does not, but consumes no input [Parr 1994, 1995].
"
Class {
	#name : #PPNotParser,
	#superclass : #PPDelegateParser,
	#category : #'PetitParser-Parsers'
}

{ #category : #parsing }
PPNotParser >> parseOn: aPPContext [
	| element memento |
	memento := aPPContext remember.
	element := parser parseOn: aPPContext.
	aPPContext restore: memento.
	^ element isPetitFailure
		ifFalse: [ PPFailure message: '' context: aPPContext ]
]
