"
This is an abstract class for XPath parsers that parse input using injectable parser handlers. It contains support for parsing common constructs like quoted string literals, qualified and non-qualified names, and comma-separted argument lists in parentheses.
"
Class {
	#name : #XPathParser,
	#superclass : #Object,
	#instVars : [
		'handler',
		'readStream',
		'writeStream'
	],
	#category : #'XPath-Core-Parsers'
}

{ #category : #'instance creation' }
XPathParser class >> on: aStringOrStream for: aHandler [
	^ self new
		on: aStringOrStream
		for: aHandler
]

{ #category : #parsing }
XPathParser >> endParsing [
	handler handleEndParsing.
	handler mustBeAtEndAfterParsing
		ifTrue: [	
			readStream skipSeparators.
			readStream atEnd
				ifFalse: [self errorExpectedAtEnd]].
]

{ #category : #private }
XPathParser >> errorExpected: aString [
	XPathSyntaxException
		formatSignal: 'Expected {1}'
		with: aString
]

{ #category : #private }
XPathParser >> errorExpectedAtEnd [
	self errorExpected: 'end of input'
]

{ #category : #private }
XPathParser >> errorExpectedLiteral: anExpectedCharacterOrString butGot: aReceivedCharacterOrString [
	XPathSyntaxException
		formatSignal: 'Expected "{1}" but got "{2}"'
		with: anExpectedCharacterOrString
		with: (aReceivedCharacterOrString ifNil: [''])
]

{ #category : #private }
XPathParser >> errorExpectedName [
	self errorExpected: 'an XPath qualified or non-qualified name'
]

{ #category : #private }
XPathParser >> errorExpectedStringLiteral [
	self errorExpected: 'single or double quoted string literal'
]

{ #category : #private }
XPathParser >> errorExpectedTerminatingQuote: aQuote [
	self errorExpected:
		'string terminating ',
		(aQuote == $'
			ifTrue: ['single']
			ifFalse: ['double']),
		' quote character'
]

{ #category : #private }
XPathParser >> expectNext: aCharacter [
	| nextChar |

	"use #= for pre-SpurVM compatibility where wide chars aren't #=="
	(nextChar := readStream next) = aCharacter
		ifFalse: [
			self
				errorExpectedLiteral: aCharacter
				butGot: nextChar].
	^ aCharacter.
]

{ #category : #accessing }
XPathParser >> handler [
	^ handler
]

{ #category : #parsing }
XPathParser >> nextArgument [
	"override to parse arguments in function argument lists"
]

{ #category : #parsing }
XPathParser >> nextArgumentList [
	"a template method; nextArgument must be overriden to handle arguments"
	self nextStartArgumentList.
	self peekForEndArgumentList
		ifFalse: [
			self nextArgument.
			[self peekForArgumentSeparator]
				whileTrue: [self nextArgument].
			self nextEndArgumentList].
]

{ #category : #parsing }
XPathParser >> nextEmptyArgumentList [
	self
		nextStartArgumentList;
		nextEndArgumentList

]

{ #category : #parsing }
XPathParser >> nextEndArgumentList [
	readStream skipSeparators.
	self expectNext: $).
]

{ #category : #parsing }
XPathParser >> nextNCName [
	^ self nextNCNameOptional: false
]

{ #category : #parsing }
XPathParser >> nextNCNameOptional: aBoolean [
	| ncName |

	(ncName := readStream nextNCName)
		ifNil: [
			aBoolean
				ifFalse: [self errorExpectedName]].
	^ ncName.
]

{ #category : #parsing }
XPathParser >> nextName [
	^ self nextNameOptional: false
]

{ #category : #parsing }
XPathParser >> nextNameOptional: aBoolean [
	| name |

	(name := readStream nextName)
		ifNil: [
			aBoolean
				ifFalse: [self errorExpectedName]].
	^ name.
]

{ #category : #parsing }
XPathParser >> nextStartArgumentList [
	readStream skipSeparators.
	self expectNext: $(.
]

{ #category : #parsing }
XPathParser >> nextStringLiteral [
	^ self nextStringLiteralOptional: false
]

{ #category : #parsing }
XPathParser >> nextStringLiteralOptional: aBoolean [
	| quote |

	((quote := readStream peek) == $"
		or: [quote == $'])
		ifTrue: [| nextChar |
			writeStream reset.
			readStream next.
			[(nextChar := readStream next) == quote
				or: [nextChar == nil]]
				whileFalse: [writeStream nextPut: nextChar].
			nextChar
				ifNil: [self errorExpectedTerminatingQuote: quote].
			^ writeStream contents]
		ifFalse: [
			aBoolean
				ifFalse: [self errorExpectedStringLiteral].
			^ nil]
]

{ #category : #initialization }
XPathParser >> on: aStringOrStream for: aHandler [
	readStream :=
		(aStringOrStream isStream
			ifTrue: [aStringOrStream asXPathReadStreamAdapter]
			ifFalse: [aStringOrStream readStream asXPathReadStreamAdapter]).
	handler := aHandler.
	"must use #writeStream instead of 'WriteStream on:' to get a 0-based
	stream on Gemstone"
	writeStream := (String new: 32) writeStream.
]

{ #category : #parsing }
XPathParser >> parse [
	[self
		startParsing;
		parseInput;
		endParsing]
		on: XPathException
		do: [:error |
			error hasPosition
				ifFalse: [error position: readStream position].
			error pass].
	^ handler parsingResult.
]

{ #category : #parsing }
XPathParser >> parseInput [
	self subclassResponsibility
]

{ #category : #'parsing - peeking' }
XPathParser >> peekForArgumentSeparator [
	readStream skipSeparators.
	^ readStream peekFor: $,.
]

{ #category : #'parsing - peeking' }
XPathParser >> peekForEndArgumentList [
	readStream skipSeparators.
	^ readStream peekFor: $).
]

{ #category : #printing }
XPathParser >> printOn: aStream [
	super printOn: aStream.

	aStream nextPut: $(.
	handler
		ifNotNil: [
			aStream
				print: handler;
				nextPutAll: ', '].
	aStream
		print: readStream;
		nextPut: $).
]

{ #category : #accessing }
XPathParser >> readStream [
	^ readStream
]

{ #category : #parsing }
XPathParser >> startParsing [
	handler handleStartParsing
]
