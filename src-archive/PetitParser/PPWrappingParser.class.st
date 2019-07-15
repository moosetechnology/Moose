"
A parser that performs an action block upon activation with the stream and a continuation block.
"
Class {
	#name : #PPWrappingParser,
	#superclass : #PPActionParser,
	#category : #'PetitParser-Parsers'
}

{ #category : #parsing }
PPWrappingParser >> parseOn: aPPContext [
	^ block value: aPPContext value: [ parser parseOn: aPPContext ]
]
