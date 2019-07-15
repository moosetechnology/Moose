"
I describe strings which end with particular substring.

	'some string for test' should endWith: 'test'.
	'some string for test' should endWith: 'Test' caseSensitive: true
"
Class {
	#name : #SpecOfStringEnding,
	#superclass : #SpecOfString,
	#category : 'StateSpecs-Specs'
}

{ #category : #testing }
SpecOfStringEnding >> basicMatches: aString [
	
	^caseSensitive 
		ifTrue: [ aString endsWith: requiredValue]
		ifFalse: [ aString asLowercase endsWith: requiredValue asLowercase ]
]

{ #category : #displaying }
SpecOfStringEnding >> clauseKeyword [
	^'end with'
]
