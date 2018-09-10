"
An abstract class for XPath parser handlers. Subclasses implement ""handling"" messages sent by parsers.
"
Class {
	#name : #XPathParserHandler,
	#superclass : #Object,
	#instVars : [
		'parsingResult'
	],
	#category : #'XPath-Core-Parsers'
}

{ #category : #handling }
XPathParserHandler >> handleEndParsing [
]

{ #category : #handling }
XPathParserHandler >> handleStartParsing [
]

{ #category : #testing }
XPathParserHandler >> mustBeAtEndAfterParsing [
	^ true
]

{ #category : #accessing }
XPathParserHandler >> parsingResult [
	^ parsingResult
]

{ #category : #accessing }
XPathParserHandler >> parsingResult: aParsingResult [
	"set value to be returned by #parse"

	parsingResult := aParsingResult
]
