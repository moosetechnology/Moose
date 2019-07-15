"
A parser that consumes nothing and always succeeds.
"
Class {
	#name : #PPEpsilonParser,
	#superclass : #PPParser,
	#category : #'PetitParser-Parsers'
}

{ #category : #parsing }
PPEpsilonParser >> parseOn: aStream [
	^ nil
]
