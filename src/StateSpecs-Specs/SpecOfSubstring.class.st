"
I describe strings which include particular substring.

	'some test string' should includeSubstring: 'test'.
	'some test string' should includeSubstring: 'Test' caseSensitive: true
"
Class {
	#name : #SpecOfSubstring,
	#superclass : #SpecOfString,
	#category : 'StateSpecs-Specs'
}

{ #category : #testing }
SpecOfSubstring >> basicMatches: aString [
	^aString includesSubstring: requiredValue caseSensitive: caseSensitive 
]

{ #category : #displaying }
SpecOfSubstring >> clauseKeyword [
	^'include substring'
]
