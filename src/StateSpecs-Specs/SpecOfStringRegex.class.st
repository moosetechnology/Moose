"
I describe strings which match particular regex expression.

	'some test string' should matchRegex: '^some'.
	'some test string' should matchRegex: '^Some' caseSensitive: true
"
Class {
	#name : #SpecOfStringRegex,
	#superclass : #SpecOfString,
	#category : 'StateSpecs-Specs'
}

{ #category : #testing }
SpecOfStringRegex >> basicMatches: aString [
	
	^caseSensitive 
		ifTrue: [ requiredValue asRegex search: aString]
		ifFalse: [ requiredValue asRegexIgnoringCase search: aString]
]

{ #category : #displaying }
SpecOfStringRegex >> clauseKeyword [
	^'match regex'
]
