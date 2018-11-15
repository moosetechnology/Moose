"
A parser that succeeds only at the end of the input stream.
"
Class {
	#name : #PPEndOfInputParser,
	#superclass : #PPDelegateParser,
	#category : #'PetitParser-Parsers'
}

{ #category : #operators }
PPEndOfInputParser >> end [
	^ self
]

{ #category : #parsing }
PPEndOfInputParser >> parseOn: aPPContext [
	| memento result |
	memento := aPPContext remember.
	result := parser parseOn: aPPContext.
	(result isPetitFailure or: [ aPPContext stream atEnd ])
		ifTrue: [ ^ result ].
	result := PPFailure
		message: 'end of input expected'
		context: aPPContext.
	aPPContext restore: memento.
	^ result
]
