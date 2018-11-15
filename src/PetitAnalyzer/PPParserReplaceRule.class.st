"
PPParserReplaceRule replaces a matched grammar with another grammar, which may include patterns from the matching grammar.

Instance Variables:
	replaceParser	<PPParser>	The parser to replace the matched parser with.
"
Class {
	#name : #PPParserReplaceRule,
	#superclass : #PPReplaceRule,
	#instVars : [
		'replaceParser'
	],
	#category : #'PetitAnalyzer-Core'
}

{ #category : #'instance creation' }
PPParserReplaceRule class >> searchFor: aSearchParser replaceWith: aReplaceParser when: aVerificationBlock [
	^ (self searchFor: aSearchParser) 
		setReplaceParser: aReplaceParser;
		setVerificationBlock: aVerificationBlock;
		yourself
]

{ #category : #matching }
PPParserReplaceRule >> foundMatchFor: aParser [ 
	^ replaceParser copyInContext: owner context
]

{ #category : #initialization }
PPParserReplaceRule >> setReplaceParser: aParser [
	replaceParser := aParser
]
