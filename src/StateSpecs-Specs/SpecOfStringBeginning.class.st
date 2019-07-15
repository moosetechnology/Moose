"
I describe strings which begin with particular substring.

	'some test string' should beginWith: 'some'.
	'some test string' should beginWith: 'Some' caseSensitive: true
"
Class {
	#name : #SpecOfStringBeginning,
	#superclass : #SpecOfString,
	#category : 'StateSpecs-Specs'
}

{ #category : #testing }
SpecOfStringBeginning >> basicMatches: aString [
	
	^caseSensitive 
		ifTrue: [ aString beginsWith: requiredValue]
		ifFalse: [ aString asLowercase beginsWith: requiredValue asLowercase ]
]

{ #category : #displaying }
SpecOfStringBeginning >> clauseKeyword [
	^'begin with'
]
