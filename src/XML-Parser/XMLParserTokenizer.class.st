"
This is a base class for parser tokenizers that read tokens from a stream using an XMLNestedStreamReader and state objects. Sending #nextToken causes a token to be read and handler messages to be sent to a driver.

Be careful changing the code in this class or subclasses because it's optimized.
"
Class {
	#name : #XMLParserTokenizer,
	#superclass : #Object,
	#instVars : [
		'state',
		'driver',
		'elementNester',
		'streamReader',
		'nameStream',
		'xmlDeclarationStream',
		'characterStream'
	],
	#classVars : [
		'PredefinedEntities'
	],
	#category : #'XML-Parser-Drivers'
}

{ #category : #'instance creation' }
XMLParserTokenizer class >> driver: aDriver on: aStringOrStream [
	^self
		driver: aDriver
		on: aStringOrStream
		readLimit: nil
]

{ #category : #'instance creation' }
XMLParserTokenizer class >> driver: aDriver on: aStringOrStream readLimit: anInteger [
	^self new
		setDriver: aDriver
		stream:
			(aStringOrStream isStream
				ifTrue: [aStringOrStream]
				ifFalse: [aStringOrStream readStream])
		readLimit: anInteger
]

{ #category : #'class initialization' }
XMLParserTokenizer class >> initialize [
	"self initialize"

	"assign after with #yourself to avoid possible race
	conditions when reinitializing the class"
	PredefinedEntities :=
		Dictionary new
			at: 'lt' put: $<;
			at: 'gt' put: $>;
			at: 'amp' put: $&;
			at: 'apos' put: $';
			at: 'quot' put: $";
			yourself
]

{ #category : #accessing }
XMLParserTokenizer class >> predefinedEntities [
	^ PredefinedEntities
]

{ #category : #testing }
XMLParserTokenizer >> atEnd [
	^ state isTerminatedState
]

{ #category : #decoding }
XMLParserTokenizer >> characterFromCodePoint: aCodePoint [
	(aCodePoint notNil
		and: [aCodePoint > 0
			and: [aCodePoint <= 16r10FFFF]])
		ifTrue: [
			^ [Character value: aCodePoint]
				on: Error
				do: [:error | nil]]
		ifFalse: [^ nil]
]

{ #category : #closing }
XMLParserTokenizer >> closeStreams [
	streamReader closeStreams
]

{ #category : #decoding }
XMLParserTokenizer >> convertFromEncoding: anEncodingName [
	driver decodesCharacters
		ifTrue: [streamReader convertFromEncoding: anEncodingName]
]

{ #category : #accessing }
XMLParserTokenizer >> currentColumnNumber [
	^ streamReader currentColumnNumber
]

{ #category : #accessing }
XMLParserTokenizer >> currentLineNumber [
	^ streamReader currentLineNumber
]

{ #category : #accessing }
XMLParserTokenizer >> currentPosition [
	^ streamReader currentPosition
]

{ #category : #accessing }
XMLParserTokenizer >> driver [
	^ driver
]

{ #category : #accessing }
XMLParserTokenizer >> elementNester [
	^ elementNester
]

{ #category : #errors }
XMLParserTokenizer >> errorExpected: aDescription [
	self parseError: 'Expected ', aDescription
]

{ #category : #errors }
XMLParserTokenizer >> errorExpected: aDescription butGot: aCharacterOrString [
	self
		formatParseError: 'Expected {1} but got "{2}" instead'
		with: aDescription
		with: aCharacterOrString
]

{ #category : #errors }
XMLParserTokenizer >> errorExpectedLiteral: aCharacterOrString [
	self
		errorExpectedLiteral: aCharacterOrString
		butGot: nil
]

{ #category : #errors }
XMLParserTokenizer >> errorExpectedLiteral: anExpectedCharacterOrString butGot: aReceivedCharacterOrString [
	self
		formatParseError: 'Expected "{1}" but got "{2}" instead' 
		with: anExpectedCharacterOrString
		with: aReceivedCharacterOrString
]

{ #category : #'tokenizing - expecting' }
XMLParserTokenizer >> expectNext: aCharacter [
	self subclassResponsibility
]

{ #category : #'tokenizing - expecting' }
XMLParserTokenizer >> expectNextAll: aString [
	self subclassResponsibility
]

{ #category : #errors }
XMLParserTokenizer >> formatParseError: aString with: aFirstValue [
	self
		formatParseError: aString
		withArguments: (Array with: aFirstValue)
]

{ #category : #errors }
XMLParserTokenizer >> formatParseError: aString with: aFirstValue with: aSecondValue [
	self
		formatParseError: aString
		withArguments:
			(Array
				with: aFirstValue
				with: aSecondValue)
]

{ #category : #errors }
XMLParserTokenizer >> formatParseError: aString with: aFirstValue with: aSecondValue with: aThirdValue [
	self
		formatParseError: aString
		withArguments:
			(Array
				with: aFirstValue
				with: aSecondValue
				with: aThirdValue)
]

{ #category : #errors }
XMLParserTokenizer >> formatParseError: aString with: aFirstValue with: aSecondValue with: aThirdValue with: aFourthValue [
	self
		formatParseError: aString
		withArguments:
			(Array
				with: aFirstValue
				with: aSecondValue
				with: aThirdValue
				with: aFourthValue)
]

{ #category : #errors }
XMLParserTokenizer >> formatParseError: aString withArguments: aValueCollection [
	self parseError:
		(aString format:
			"convert nils to empty strings, so nil values are
			not printed as 'nil' in error messsages"
			(aValueCollection collect: [:each |
				each ifNil: ['']]))
]

{ #category : #defaults }
XMLParserTokenizer >> hexCharacterValueLiteralPrefixes [
	^ 'x'
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextCDataSection [
	self subclassResponsibility

]

{ #category : #decoding }
XMLParserTokenizer >> nextCharacterValueLiteral [
	^ self nextCharacterValueLiteralPrintedOn: nil
]

{ #category : #decoding }
XMLParserTokenizer >> nextCharacterValueLiteralPrintedOn: aStream [
	"do not limit the number of chars read, because char values can
	have an arbitrary number of leading zeros"
	^ (XMLSmallIntegerReader on: streamReader)
		printStream: aStream;
		nextIntegerWithBase: 16
			andPrefixes: self hexCharacterValueLiteralPrefixes
			orBase: 10
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextContentMarkupToken [
	self subclassResponsibility
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextContentToken [
	streamReader peek == $<
		ifTrue: [
			streamReader next.
			^ self nextContentMarkupToken].
	elementNester isInElement
		ifTrue: [^ self nextPCDataToken].
	self nextNonElementWhitespace.
]

{ #category : #'tokenizing - dtd' }
XMLParserTokenizer >> nextDoctypeDeclaration [
	| root publicID systemID |

	state := state doctypeDeclarationState.
	self
		expectNextAll: 'DOCTYPE';
		nextSeparators.

	root := self nextElementName.
	(streamReader peek == $[
		or: [streamReader peek == $>])
		ifFalse: [
			self nextSeparators.
			streamReader peek == $P
				ifTrue: [
					publicID := self nextPublicID.
					self nextSeparators.
					systemID := self nextSystemIDLiteral]
				ifFalse: [
					streamReader peek == $S
						ifTrue: [systemID := self nextSystemID]]].
	driver
		handleStartDTD: root
		publicID: (publicID ifNil: [''])
		systemID: (systemID ifNil: ['']).

	streamReader skipSeparators.
	streamReader peek == $[
		ifTrue: [self nextStartInternalSubset]
		ifFalse: [self nextEndDoctypeDeclaration].
]

{ #category : #'tokenizing - dtd' }
XMLParserTokenizer >> nextDoctypeDeclarationTerminator [
	self expectNext: $>
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextElementName [
	self subclassResponsibility
]

{ #category : #'tokenizing - dtd' }
XMLParserTokenizer >> nextEndDoctypeDeclaration [
	self nextDoctypeDeclarationTerminator.
	state := state postDoctypeDeclarationState.

	driver handleEndDTD.
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextEndDocument [
	state isTerminatedState
		ifFalse: [
			self closeStreams.
			state := state terminatedState.
			driver handleEndDocument]
]

{ #category : #'tokenizing - dtd' }
XMLParserTokenizer >> nextEndInternalSubset [
	"skip ]"
	streamReader
		next;
		skipSeparators.
	self nextEndDoctypeDeclaration.
]

{ #category : #'tokenizing - dtd' }
XMLParserTokenizer >> nextInternalSubsetToken [
	streamReader skipSeparators.
	streamReader peek == $%
		ifTrue: [
			streamReader next.
			^ self nextParameterEntityReference].
	streamReader peek == $]
		ifTrue: [^ self nextEndInternalSubset].
	self nextSubsetMarkupToken.
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextNonElementWhitespace [
	self subclassResponsibility
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextNonPIPrologOrContentMarkupToken [
	self subclassResponsibility
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextPCDataToken [
	self subclassResponsibility
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextPI [
	"skip ?"
	streamReader next.
	self nextPIWithTarget: self nextPITarget.
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextPIData [
	self subclassResponsibility
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextPITarget [
	"should return a PI target string or nil if it's the start of
	an '<?xml ...?>' declaration"
	self subclassResponsibility
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextPITerminator [
	self expectNext: $>
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextPIWithTarget: aTarget [
	streamReader peek == $?
		ifTrue: [
			streamReader next.
			self nextPITerminator.
			driver
				handlePI: aTarget
				data: '']
		ifFalse: [
			self nextSeparators.
			driver
				handlePI: aTarget
				data: self nextPIData].
]

{ #category : #'tokenizing - dtd' }
XMLParserTokenizer >> nextParameterEntityReference [
	self subclassResponsibility
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextPrologToken [
	self subclassResponsibility
]

{ #category : #'tokenizing - dtd' }
XMLParserTokenizer >> nextPublicID [
	^ self
		expectNextAll: 'PUBLIC';
		nextSeparators;
		nextPublicIDLiteral
]

{ #category : #'tokenizing - dtd' }
XMLParserTokenizer >> nextPublicIDLiteral [
	self subclassResponsibility
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextSeparators [
	self subclassResponsibility
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextStartContent [
	state := state contentState.
	elementNester := driver elementNester.
	driver handleStartContent.
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextStartDocument [
	self state: driver newInitialState.
	driver handleStartDocument.
]

{ #category : #'tokenizing - dtd' }
XMLParserTokenizer >> nextStartInternalSubset [
	"skip ["
	streamReader next.
	state := state internalSubsetState.
]

{ #category : #'tokenizing - dtd' }
XMLParserTokenizer >> nextSubsetMarkupToken [
	self subclassResponsibility
]

{ #category : #'tokenizing - dtd' }
XMLParserTokenizer >> nextSystemID [
	^ self
		expectNextAll: 'SYSTEM';
		nextSeparators;
		nextSystemIDLiteral
]

{ #category : #'tokenizing - dtd' }
XMLParserTokenizer >> nextSystemIDLiteral [
	self subclassResponsibility
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextToken [
	streamReader atEnd
		ifTrue: [
			state isInitializedState
				ifTrue: [^ self nextEndDocument]].
	^ state nextTokenFrom: self.
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextXMLAttributeEqualsSeparator [
	streamReader skipSeparators.
	self expectNext: $=.
	streamReader skipSeparators.
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextXMLAttributeName: aName [
	self expectNextAll: aName
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextXMLDeclaration [
	| version encoding |

	self nextSeparators.
	version := self nextXMLVersionAttributeRequired: true.
	streamReader peek == $?
		ifFalse: [self nextSeparators].
	(encoding := self nextXMLEncodingAttributeRequired: false) isEmpty
		ifFalse: [
			self convertFromEncoding: encoding.
			streamReader peek == $?
				ifFalse: [self nextSeparators]].
	driver
		handleXMLVersion: version
		encoding: encoding
		standalone: self nextXMLStandaloneAttribute.
	streamReader skipSeparators.
	self nextXMLDeclarationTerminator.

	state := state prologState.
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextXMLDeclarationOrPrologToken [
	streamReader peek == $<
		ifTrue: [
			streamReader next.
			streamReader peek == $?
				ifTrue: [
					streamReader next.
					self nextPITarget
						ifNil: [^ self nextXMLDeclaration]
						ifNotNil: [:target |
							state := state prologState.
							^ self nextPIWithTarget: target]].
			state := state prologState.
			^ self nextNonPIPrologOrContentMarkupToken].

	"other prolog tokens can have whitespace before them, so the doc
	does not need to start with an '<' for them"
	state := state prologState.
	self nextPrologToken.
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextXMLDeclarationTerminator [
	self expectNextAll: '?>'
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextXMLEncodingAttributeRequired: aBoolean [
	(aBoolean
		or: [streamReader peek == $e])
		ifTrue: [	
			^ self
				nextXMLAttributeName: 'encoding';
				nextXMLAttributeEqualsSeparator;
				nextXMLEncodingAttributeValue]
		ifFalse: [^ '']
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextXMLEncodingAttributeValue [
	self subclassResponsibility
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextXMLStandaloneAttribute [
	"always optional"
	(streamReader peek == $s)
		ifTrue: [
			^ self
				nextXMLAttributeName: 'standalone';
				nextXMLAttributeEqualsSeparator;
				nextXMLStandaloneAttributeValue]
		ifFalse: [^ '']
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextXMLStandaloneAttributeValue [
	self subclassResponsibility
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextXMLVersionAttributeRequired: aBoolean [
	(aBoolean
		or: [streamReader peek == $v])
		ifTrue: [
			^ self
				nextXMLAttributeName: 'version';
				nextXMLAttributeEqualsSeparator;
				nextXMLVersionAttributeValue]
		ifFalse: [^ '']
]

{ #category : #tokenizing }
XMLParserTokenizer >> nextXMLVersionAttributeValue [
	self subclassResponsibility
]

{ #category : #accessing }
XMLParserTokenizer >> normalizedLineEndingChar [
	^ streamReader normalizedLineEndingChar
]

{ #category : #accessing }
XMLParserTokenizer >> normalizedLineEndingChar: aCharacter [
	streamReader normalizedLineEndingChar: aCharacter
]

{ #category : #errors }
XMLParserTokenizer >> parseError: aString [
	driver handleParseError: aString
]

{ #category : #printing }
XMLParserTokenizer >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		print: state;
		nextPutAll: '; ';
		print: streamReader;
		nextPut: $).
]

{ #category : #initialization }
XMLParserTokenizer >> setDriver: aDriver stream: aStream readLimit: anInteger [
	state := XMLUninitializedState new.
	driver := aDriver.
	streamReader :=
		self streamReaderClass
			on: aStream
			readLimit: anInteger.

	"must use #writeStream instead of 'WriteStream on:' to get 0-based
	streams on Gemstone"
	nameStream := (String new: 16) writeStream.
	"this separate stream is needed because XML text delcarations can occur
	in the replacement of external general entity references in PCDATA and
	external parameter entity references within declarations in the external
	subset or external entities, and characterStream would already be in use
	in both cases"
	xmlDeclarationStream := (String new: 8) writeStream.
	characterStream := (String new: 128) writeStream.
]

{ #category : #accessing }
XMLParserTokenizer >> state [
	^ state
]

{ #category : #accessing }
XMLParserTokenizer >> state: aTokenState [
	(state := aTokenState) isContentState
		ifTrue: [elementNester := driver elementNester].
	(driver decodesCharacters
		and: [state supportsEncodingDetection])
		ifTrue: [streamReader detectEncoding].
]

{ #category : #accessing }
XMLParserTokenizer >> streamReader [
	^ streamReader
]

{ #category : #defaults }
XMLParserTokenizer >> streamReaderClass [
	^ XMLNestedStreamReader
]
