"
A handler for number parsers  that returns signed floating point numbers, including possibly nan and +/- infinity.
"
Class {
	#name : #XPathFloatNumberParserHandler,
	#superclass : #XPathNumberParserHandler,
	#instVars : [
		'sign',
		'integer',
		'fraction'
	],
	#category : #'XPath-Core-Parsers'
}

{ #category : #handling }
XPathFloatNumberParserHandler >> handleEndParsing [
	self parsingResult: ((integer + fraction) asFloat sign: sign)
]

{ #category : #handling }
XPathFloatNumberParserHandler >> handleFractionPart: aFraction [
	fraction := aFraction
]

{ #category : #handling }
XPathFloatNumberParserHandler >> handleIntegerPart: anInteger [
	integer := anInteger
]

{ #category : #handling }
XPathFloatNumberParserHandler >> handleNegativeSign [
	sign := -1
]

{ #category : #handling }
XPathFloatNumberParserHandler >> handlePositiveSign [
	sign := 1
]
