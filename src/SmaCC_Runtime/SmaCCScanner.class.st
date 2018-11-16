"
SmaCCScanner is an abstract class that represents a scanner for the parser. The scanner converts its string input into SmaCCToken objects that the parser then uses for its parsing.

Subclasses must implement the following messages:
	accessing
		emptySymbolTokenId
		errorTokenId
		scanForToken

Instance Variables:
	comments	<OrderedCollection>	a collection of comment intervals (array of start position & stop position)
	currentCharacter	<Character>	the current character we are scanning
	lastMatchWasEmpty	<Boolean>	was our last scanning match an empty string -- don't allow two empty matches in a row
	lastOutputStreamMatchPosition	<Integer>	the position in the outputStream of the last match
	matchActions	<Array | Symbol>	the actions for the last match (a symbol means that the action should be performed on the scanner)
	matchEnd	<Integer>	the position of the last match in the stream (our input stream)
	outputStream	<PositionableStream>	the matched characters go in this stream. After a match is made, we take this stream's contents and create a token object.
	returnMatchBlock	<BlockClosure>	when we match a token evaluate this block with the token (hack to return from multiple levels)
	start	<Integer>	the starting position of a match in the stream
	state	<Symbol>	the state of the scanner
	stream	<Stream>	our input



"
Class {
	#name : #SmaCCScanner,
	#superclass : #Object,
	#instVars : [
		'stream',
		'start',
		'matchActions',
		'matchEnd',
		'currentCharacter',
		'outputStream',
		'lastOutputStreamMatchPosition',
		'lastMatchWasEmpty',
		'returnMatchBlock',
		'scope',
		'comments'
	],
	#classInstVars : [
		'keywordMap'
	],
	#category : #'SmaCC_Runtime'
}

{ #category : #'class initialization' }
SmaCCScanner class >> initialize [
	self initializeKeywordMap
]

{ #category : #'class initialization' }
SmaCCScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new
]

{ #category : #accessing }
SmaCCScanner class >> keywordMap [
	keywordMap isNil
		ifTrue: [ self initializeKeywordMap ].
	^ keywordMap
]

{ #category : #testing }
SmaCCScanner class >> needsLineNumbers [
	"Redefine to return true, if you need line number information"

	^ false
]

{ #category : #'instance creation' }
SmaCCScanner class >> on: aStream [
	^ self new
		on:
			(self needsLineNumbers
				ifTrue: [ SmaCCLineNumberStream on: aStream ]
				ifFalse: [ aStream ]);
		yourself
]

{ #category : #testing }
SmaCCScanner >> atEnd [
	^ stream atEnd
]

{ #category : #private }
SmaCCScanner >> checkForKeyword: aString [
	| stateMap action oldActions entry |
	action := matchActions isSymbol
		ifTrue: [ matchActions ]
		ifFalse: [ matchActions first ].
	stateMap := self class keywordMap at: action ifAbsent: [ nil ].
	stateMap isNil
		ifTrue: [ ^ self ].
	oldActions := matchActions.
	entry := stateMap at: (self keywordFor: aString) ifAbsent: [ nil ].
	entry isNil
		ifTrue: [ ^ self ].
	entry isInteger
		ifTrue: [ matchActions := entry ]
		ifFalse:
			[ (entry last includes: scope)
				ifFalse: [ ^ self ].
			matchActions := entry first ].
	matchActions isInteger
		ifTrue: [ matchActions := (Array with: matchActions) , oldActions ]
]

{ #category : #private }
SmaCCScanner >> checkForValidMatch [
	matchActions isNil
		ifTrue: [ self scannerError ]
]

{ #category : #'default token handling' }
SmaCCScanner >> comment [
	comments add: (Array with: start + 1 with: matchEnd).
	^ self whitespace
]

{ #category : #accessing }
SmaCCScanner >> comments [
	^ comments
]

{ #category : #accessing }
SmaCCScanner >> contents [
	| writeStream token |
	writeStream := WriteStream with: Array new.
	[ self atEnd ]
		whileFalse:
			[ token := self next.
			token notNil
				ifTrue: [ writeStream nextPut: token ] ].
	^ writeStream contents
]

{ #category : #private }
SmaCCScanner >> createTokenFor: string [
	| token |
	token := self tokenClass
		value: string
		start: start + 1
		ids: matchActions.
	outputStream reset.
	^ token
]

{ #category : #private }
SmaCCScanner >> currentCharacter [
	^ currentCharacter
]

{ #category : #private }
SmaCCScanner >> debugStart [
	^ start
]

{ #category : #accessing }
SmaCCScanner >> emptySymbolTokenId [
	^ self subclassResponsibility
]

{ #category : #accessing }
SmaCCScanner >> eofTokenId [
	^ Array with: self emptySymbolTokenId
]

{ #category : #accessing }
SmaCCScanner >> errorTokenId [
	^ self subclassResponsibility
]

{ #category : #'initialize-release' }
SmaCCScanner >> initialize [
	super initialize.
	outputStream := WriteStream with: String new.
	lastMatchWasEmpty := true.
	scope := #default.
	comments := OrderedCollection new
]

{ #category : #utility }
SmaCCScanner >> keywordFor: aString [
	"Subclasses can override this to ignore case"

	^ aString
]

{ #category : #private }
SmaCCScanner >> lastOutputStreamMatchPosition [
	^ lastOutputStreamMatchPosition
]

{ #category : #accessing }
SmaCCScanner >> lineNumber [
	"This requires the stream to be a line number stream (see the #needsLineNumbers class method)."

	^ stream lineNumber
]

{ #category : #private }
SmaCCScanner >> matchActions [
	^ matchActions
]

{ #category : #accessing }
SmaCCScanner >> next [
	self resetScanner.
	returnMatchBlock := [ :match | ^ match ].
	^ self scanForToken
]

{ #category : #'initialize-release' }
SmaCCScanner >> on: aStream [
	stream := aStream.
	start := stream position
]

{ #category : #private }
SmaCCScanner >> outputStream [
	^ outputStream
]

{ #category : #'default token handling' }
SmaCCScanner >> patternToken [
	| token |
	token := SmaCCPatternToken
		value: outputStream contents
		start: start + 1
		ids: matchActions.
	outputStream reset.
	^ token
]

{ #category : #accessing }
SmaCCScanner >> position [
	^ stream position
]

{ #category : #accessing }
SmaCCScanner >> position: anInteger [
	^ stream position: anInteger
]

{ #category : #private }
SmaCCScanner >> recordAndReportMatch: aCollection [
	self recordMatch: aCollection.
	^ self reportLastMatch
]

{ #category : #private }
SmaCCScanner >> recordMatch: aCollection [
	matchActions := aCollection.
	matchEnd := stream position.
	lastOutputStreamMatchPosition := outputStream position
]

{ #category : #private }
SmaCCScanner >> reportLastMatch [
	"The scanner has found the end of a token and must report it"

	| string action |
	self checkForValidMatch.
	self resetOutputToLastMatch.
	stream position: matchEnd.
	string := outputStream contents.
	self checkForKeyword: string.
	action := matchActions isSymbol
		ifTrue:
			[ matchActions ]
		ifFalse: [ self tokenActions
				at: matchActions first
				ifAbsent: [ nil ] ].	"This is only necessary to run version 1 parsers on version 2 SmaCC"
	^ action notNil
		ifTrue: [ self perform: action ]
		ifFalse: [ self createTokenFor: string ]
]

{ #category : #private }
SmaCCScanner >> resetOutputToLastMatch [
	outputStream position: lastOutputStreamMatchPosition.
	lastOutputStreamMatchPosition == 0
		ifTrue:
			[ lastMatchWasEmpty
				ifTrue: [ self scannerError ].
			lastMatchWasEmpty := true ]
		ifFalse: [ lastMatchWasEmpty := false ]
]

{ #category : #private }
SmaCCScanner >> resetScanner [
	matchActions := nil.
	start := stream position.
	outputStream reset.
	lastOutputStreamMatchPosition := 0
]

{ #category : #private }
SmaCCScanner >> scanForString: aString [
	^ aString
		allSatisfy: [ :each | 
			self step.
			currentCharacter == each ]
]

{ #category : #accessing }
SmaCCScanner >> scanForToken [
	^ self subclassResponsibility
]

{ #category : #private }
SmaCCScanner >> scannerError [
	| string |
	(stream atEnd and: [ start == stream position ])
		ifTrue: [ string := ''.
			matchActions := self eofTokenId ]
		ifFalse:
			[ stream position: start.
			string := String with: stream next.
			matchActions := #(0) ].
	returnMatchBlock value: (self createTokenFor: string)
]

{ #category : #accessing }
SmaCCScanner >> scope [
	^ scope
]

{ #category : #accessing }
SmaCCScanner >> scope: aSymbol [
	scope := aSymbol
]

{ #category : #accessing }
SmaCCScanner >> setPosition: anInteger [
	^ stream position: anInteger
]

{ #category : #private }
SmaCCScanner >> step [
	stream atEnd
		ifTrue: [ ^ returnMatchBlock value: self reportLastMatch ].
	currentCharacter := stream next.
	outputStream nextPut: currentCharacter
]

{ #category : #private }
SmaCCScanner >> stream [
	^stream
]

{ #category : #utility }
SmaCCScanner >> tokenActions [
	^ #()
]

{ #category : #private }
SmaCCScanner >> tokenClass [
	^ SmaCCToken
]

{ #category : #'default token handling' }
SmaCCScanner >> whitespace [
	"By default, eat the whitespace"

	self resetScanner.
	^ self scanForToken
]
