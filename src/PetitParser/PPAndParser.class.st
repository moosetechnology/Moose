"
The and-predicate, a parser that succeeds whenever its delegate does, but does not consume the input stream [Parr 1994, 1995].
"
Class {
	#name : #PPAndParser,
	#superclass : #PPDelegateParser,
	#category : #'PetitParser-Parsers'
}

{ #category : #operators }
PPAndParser >> and [
	^ self
]

{ #category : #parsing }
PPAndParser >> parseOn: aPPContext [
	| element memento |
	memento := aPPContext remember.
	element := parser parseOn: aPPContext.
	aPPContext restore: memento.
	^ element
]
