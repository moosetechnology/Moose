"
A generic object that allows us to detect commented code. It knows how to clean any noise and how to identify commented code.

I am able to detect commented code lines by using a notation system. If a line contains special characters or keywords I will increase his notation and after a certain limit I consider it as commented code. 
"
Class {
	#name : #FamixCACommentedCodeDetector,
	#superclass : #Object,
	#instVars : [
		'language'
	],
	#category : #'Famix-CommentAnalyzer'
}

{ #category : #'instance creation' }
FamixCACommentedCodeDetector class >> with: aSourceLanguage [
	^ self new language: aSourceLanguage
]

{ #category : #public }
FamixCACommentedCodeDetector >> commentedCodeLinesIn: aFAMIXComment [
	^ aFAMIXComment lines select: [ :each | self isCommentedCodeLine: each ]
]

{ #category : #private }
FamixCACommentedCodeDetector >> isCommentedCodeLine: aLine [
	| sumKeyWords cleanedLine sumSpecialChars |
	"We start by removing comments markers."
	cleanedLine := self removeCommentMarkers: aLine.

	"We match the keywords for the words in the comment and see if the line contain an special characters for the language.
	Every keyword has half the weight and  specicial characters 1/3rd.
	If the sum of the finds is 1 or more, we make it commented line"
	sumKeyWords := ((' ' split: cleanedLine) select: [ :each | each size > 2 ])
		sumNumbers: [ :word | 
			(self languageKeywords includes: word onlyLetters asLowercase)
				ifTrue: [ 0.4 ]
				ifFalse: [ -0.05 ] ].
	sumSpecialChars := cleanedLine
		sumNumbers: [ :each | 
			(self specialChars includes: each asString)
				ifTrue: [ 0.15 ]
				ifFalse: [ 0 ] ].

	^ sumKeyWords + sumSpecialChars >= 1
]

{ #category : #accessing }
FamixCACommentedCodeDetector >> language [
	^ language
]

{ #category : #accessing }
FamixCACommentedCodeDetector >> language: aSourceLanguage [
	language := aSourceLanguage
]

{ #category : #accessing }
FamixCACommentedCodeDetector >> languageKeywords [
	^ self language languageKeywords
]

{ #category : #printing }
FamixCACommentedCodeDetector >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $[;
		nextPutAll: (self language ifNil: [ 'No Language' ]) asString;
		nextPut: $]
]

{ #category : #private }
FamixCACommentedCodeDetector >> removeCommentMarkers: aLine [
	^ self language commentMarkers inject: aLine into: [ :res :marker | res copyReplaceAll: marker with: '' ]
]

{ #category : #private }
FamixCACommentedCodeDetector >> specialChars [
	^ #('(' ')' '=' '+' '-' '#' '$' '%' '&' '\' '|' '[' ']' '{' '}' '"' '_' ';')
]
