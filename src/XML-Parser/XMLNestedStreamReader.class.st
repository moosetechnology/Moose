"
This class represents a stream reader that implements pushBack: using nested streams. This enables subsitution/replacement to be performed without modifying the underlying collections streamed-over or having to copy them. It also performs line-ending normalization, transforming a CR or a CRLF sequence into a single LF character.

(The code in this class is optimized; refactor with care.)
"
Class {
	#name : #XMLNestedStreamReader,
	#superclass : #Object,
	#instVars : [
		'stream',
		'whenPoppedDo',
		'isExternal',
		'currentPosition',
		'currentLineNumber',
		'currentLineStartPosition',
		'peekChar',
		'nestedStreams',
		'normalizedLineEndingChar',
		'readLimit'
	],
	#classVars : [
		'CRCharacter',
		'LFCharacter',
		'NullReadStream'
	],
	#category : #'XML-Parser-Streams'
}

{ #category : #'class initialization' }
XMLNestedStreamReader class >> initialize [
	"self initialize"

	"stored in class vars for faster access"
	CRCharacter := Character cr.
	LFCharacter := Character lf.

	"a null stream that is already #atEnd and can safely be sent
	#close repeatedly and #atEnd after"
	NullReadStream := XMLNullReadStream new.
]

{ #category : #'instance creation' }
XMLNestedStreamReader class >> on: aStream [
	^ self
		on: aStream
		readLimit: nil
]

{ #category : #'instance creation' }
XMLNestedStreamReader class >> on: aStream readLimit: anInteger [
	^ self new
		setStream: aStream
		readLimit: anInteger
]

{ #category : #testing }
XMLNestedStreamReader >> atEnd [
	peekChar
		ifNotNil: [^ false].
	stream atEnd
		ifFalse: [^ false].
	"use #to:do: for speed"
	1 to: nestedStreams size do: [:i |
		(nestedStreams at: i) stream atEnd
			ifFalse: [^ false]].
	^ true.
]

{ #category : #testing }
XMLNestedStreamReader >> atQuote [
	^ self peek == $"
		or: [peekChar == $']
]

{ #category : #private }
XMLNestedStreamReader >> closeStream: aStream [
	"must use respondsTo: to support streams only implementing the basic protocol"
	(aStream respondsTo: #close)
		ifTrue: [aStream close].
]

{ #category : #closing }
XMLNestedStreamReader >> closeStreams [
	"close the streams but do not evaluate their callbacks and
	set the current stream to the null stream sending #closeStreams
	again won't raise an error"
	self
		closeStream: stream;
		setStreamToNull.
	[nestedStreams size > 0]
		whileTrue: [self closeStream: nestedStreams removeLast stream].
]

{ #category : #decoding }
XMLNestedStreamReader >> convertFromEncoding: anEncodingName [
	"Encoding attributes are ignored unless the stream is a converting adapter
	that has a null/implicit converter.
	
	This is the safest approach, because the encoding of a file can be easily
	changed by a text editor or utility without automatically updating the
	<?xml ...?> encoding attribute.
	
	The BOM and out-of-band info (like HTTP headers) should be given precedence."

	(stream isXMLConvertingStreamAdapter
		and: [stream hasNullStreamConverter
			or: [stream hasImplicitStreamConverter]])
		ifTrue: [| streamConverter |
			(streamConverter := anEncodingName asXMLStreamConverter) isNull
				ifTrue: [self errorUnsupportedEncoding: anEncodingName].
			self decodeStreamWithConverter: streamConverter]
]

{ #category : #accessing }
XMLNestedStreamReader >> currentColumnNumber [
	"recording the start pos. of the line and subtracting it from the current
	pos. is faster than an explicit column var that would need to be incremented
	each time through #next/#skipSeparators"
	^ currentLineStartPosition
		ifNotNil: [currentPosition - currentLineStartPosition]
]

{ #category : #accessing }
XMLNestedStreamReader >> currentLineNumber [
	^ currentLineNumber
]

{ #category : #accessing }
XMLNestedStreamReader >> currentPosition [
	^ currentPosition
]

{ #category : #decoding }
XMLNestedStreamReader >> decodeStreamWithConverter: aStreamConverter [
	stream isXMLConvertingStreamAdapter
		ifTrue: [stream streamConverter: aStreamConverter]
		ifFalse: [
			stream :=
				XMLDecodingReadStreamAdapter
					on: stream
					streamConverter: aStreamConverter]
]

{ #category : #decoding }
XMLNestedStreamReader >> detectEncoding [
	stream isXMLConvertingStreamAdapter
		ifTrue: [stream detectEncoding]
		ifFalse: [
			"if it's not already an XMLDecodingReadStreamAdapter, just look
			for an obvious leading byte-order mark and convert it if found,
			and otherwise just leave it alone"
			(XMLEncodingDetector on: stream) streamConverterForEncoding
				ifNotNil: [:converter |
					self decodeStreamWithConverter: converter]]
]

{ #category : #private }
XMLNestedStreamReader >> errorNestingLimitExceeded [
	XMLLimitException signal: 'Cannot further nest input streams'
]

{ #category : #private }
XMLNestedStreamReader >> errorReadLimitExceeded [
	XMLLimitException signal:
		'Security input read limit exceeded; ',
		'use #documentReadLimit: and #externalSubsetReadLimit: ',
		'to change/disable it, or #defaultReadLimit: ',
		'to persistently change/disable it'
]

{ #category : #private }
XMLNestedStreamReader >> errorUnsupportedEncoding: anEncodingName [
	XMLEncodingException
		formatSignal: 'Encoding "{1}" is unsupported'
		with: anEncodingName
]

{ #category : #private }
XMLNestedStreamReader >> hasNextAfterPoppingStreamsAtEnd [
	"always pop at least one stream, which makes the new current stream
	the null stream if there aren't any nested streams"
	self popCurrentStream.
	[stream atEnd]
		whileTrue: [
			nestedStreams size > 0
				ifFalse: [^ false].
			self popCurrentStream].
	^ true.
]

{ #category : #testing }
XMLNestedStreamReader >> hasPushedBackStreams [
	^ nestedStreams size > 0
]

{ #category : #testing }
XMLNestedStreamReader >> isBinary [
	^ false
]

{ #category : #testing }
XMLNestedStreamReader >> isStream [
	^ true
]

{ #category : #testing }
XMLNestedStreamReader >> isXMLBinaryOrExternalStream [
	^ self isBinary
]

{ #category : #private }
XMLNestedStreamReader >> maxNestedStreams [
	^ 32
]

{ #category : #private }
XMLNestedStreamReader >> nestedStreamsAddLast: aPushedBackStream [
	nestedStreams size >= self maxNestedStreams
		ifTrue: [self errorNestingLimitExceeded].
	nestedStreams addLast: aPushedBackStream.
]

{ #category : #private }
XMLNestedStreamReader >> newWriteStream [
	^ (self writeStreamCollectionClass new: 128) writeStream
]

{ #category : #accessing }
XMLNestedStreamReader >> next [
	| nextChar |

	peekChar
		ifNil: [
			stream atEnd
				ifTrue: [
					self hasNextAfterPoppingStreamsAtEnd
						ifFalse: [^ nil]].
			nextChar := stream next.
			isExternal
				ifTrue: [
					currentPosition := currentPosition + 1.
					nextChar == LFCharacter
						ifTrue: [
							nextChar := normalizedLineEndingChar.
							currentLineNumber := currentLineNumber + 1.
							currentLineStartPosition := currentPosition]
						ifFalse: [
							nextChar == CRCharacter
								ifTrue: [
									stream atEnd
										ifFalse: [
											stream peek == LFCharacter
												ifTrue: [stream next]].
									nextChar := normalizedLineEndingChar.
									currentLineNumber := currentLineNumber + 1.
									currentLineStartPosition := currentPosition]]]]
		ifNotNil: [
			nextChar := peekChar.
			peekChar := nil.
			isExternal
				ifTrue: [
					currentPosition := currentPosition + 1.
					nextChar == normalizedLineEndingChar
						ifTrue: [
							currentLineNumber := currentLineNumber + 1.
							currentLineStartPosition := currentPosition]]].

	readLimit
		ifNotNil: [
			(readLimit := readLimit - 1) >= 0
				ifFalse: [self errorReadLimitExceeded]].

	^ nextChar.
]

{ #category : #accessing }
XMLNestedStreamReader >> next: anInteger [
	| writeStream i |

	writeStream := self newWriteStream.
	i := 0.
	[self atEnd
		or: [i >= anInteger]]
		whileFalse: [
			writeStream nextPut: self next.
			i := i + 1].
	^ writeStream contents.
]

{ #category : #accessing }
XMLNestedStreamReader >> normalizedLineEndingChar [
	^ normalizedLineEndingChar
]

{ #category : #accessing }
XMLNestedStreamReader >> normalizedLineEndingChar: aCharacter [
	normalizedLineEndingChar := aCharacter
]

{ #category : #accessing }
XMLNestedStreamReader >> peek [
	peekChar
		ifNotNil: [^ peekChar].

	stream atEnd
		ifTrue: [
			self hasNextAfterPoppingStreamsAtEnd
				ifFalse: [^ nil]].
	peekChar := stream next.
	isExternal
		ifTrue: [
			peekChar == LFCharacter
				ifTrue: [^ peekChar := normalizedLineEndingChar].
			peekChar == CRCharacter
				ifTrue: [
					stream atEnd
						ifFalse: [
							stream peek == LFCharacter
								ifTrue: [stream next]].
					^ peekChar := normalizedLineEndingChar]].
	^ peekChar.
]

{ #category : #accessing }
XMLNestedStreamReader >> peekFor: aCharacter [
	(self atEnd not
		and: [self peek = aCharacter])
		ifTrue: [
			self next.
			^ true]
		ifFalse: [^ false]
]

{ #category : #private }
XMLNestedStreamReader >> popCurrentStream [
	| callbackOfPoppedStream |

	"close the stream first and pop it before evaluating the callback so any
	exception it raises won't cause us to leak file streams or double close a
	stream when XMLParser>>#handleParserError: sends #closeStreams"
	self closeStream: stream.
	callbackOfPoppedStream := whenPoppedDo.
	nestedStreams size > 0
		ifTrue: [| pushedBackStream |
			pushedBackStream := nestedStreams removeLast.
			stream := pushedBackStream stream.
			whenPoppedDo := pushedBackStream whenPoppedDo.
			isExternal := pushedBackStream isExternal.
			currentPosition := pushedBackStream currentPosition.
			currentLineNumber := pushedBackStream currentLineNumber.
			currentLineStartPosition := pushedBackStream currentLineStartPosition]
		ifFalse: [self setStreamToNull].

	"now it's safe to evaluate the callback"
	callbackOfPoppedStream
		ifNotNil: [callbackOfPoppedStream value].
]

{ #category : #printing }
XMLNestedStreamReader >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		print: peekChar; "can be nil"
		nextPutAll: '; ';
		print: stream;
		space;
		print: nestedStreams;
		nextPut: $).
]

{ #category : #positioning }
XMLNestedStreamReader >> pushBack: aString [
	aString size > 1
		ifTrue: [^ self pushBackStream: aString readStream].
	aString size = 1
		ifTrue: [self pushBackCharacter: (aString at: 1)]
]

{ #category : #positioning }
XMLNestedStreamReader >> pushBackCharacter: aCharacter [
	self
		pushBackStream: (XMLSingleCharacterReadStream on: aCharacter)
		whenPoppedDo: nil
		isExternal: false
]

{ #category : #positioning }
XMLNestedStreamReader >> pushBackStream: aStream [
	self
		pushBackStream: aStream
		whenPoppedDo: nil
		isExternal: false
]

{ #category : #positioning }
XMLNestedStreamReader >> pushBackStream: aStream whenPoppedDo: aBlock isExternal: aBoolean [
	self nestedStreamsAddLast:
		((isExternal
			ifTrue: [XMLPushedBackExternalStream]
			ifFalse: [XMLPushedBackInternalStream])
				stream: stream
				whenPoppedDo: whenPoppedDo
				currentPosition: currentPosition
				currentLineNumber: currentLineNumber
				currentLineStartPosition: currentLineStartPosition).

	peekChar
		ifNotNil: [
			self nestedStreamsAddLast:
				(XMLPushedBackInternalStream
					stream: (XMLSingleCharacterReadStream on: peekChar)
					whenPoppedDo: nil
					currentPosition: currentPosition
					currentLineNumber: currentLineNumber
					currentLineStartPosition: currentLineStartPosition).
			peekChar := nil].

	self stream: aStream.
	whenPoppedDo := aBlock.
	(isExternal := aBoolean)
		ifTrue: [
			currentPosition := 0.
			currentLineNumber := 1.
			currentLineStartPosition := 0].
]

{ #category : #accessing }
XMLNestedStreamReader >> readLimit [
	^ readLimit
]

{ #category : #initialization }
XMLNestedStreamReader >> setStream: aStream readLimit: anInteger [
	self stream: aStream.
	isExternal := true.
	currentPosition := 0.
	currentLineNumber := 1.
	currentLineStartPosition := 0.
	nestedStreams := OrderedCollection new: 5.
	readLimit := anInteger.
	normalizedLineEndingChar := LFCharacter.
]

{ #category : #private }
XMLNestedStreamReader >> setStreamToNull [
	stream := NullReadStream.
	whenPoppedDo := nil.
	"do not reset the other stream properties, including position
	and line number, so error messages will be accurate"
]

{ #category : #positioning }
XMLNestedStreamReader >> skip: anInteger [
	1 to: anInteger do: [:i |
		self atEnd
			ifTrue: [^ self].
		self next]
]

{ #category : #positioning }
XMLNestedStreamReader >> skipSeparators [
	"This code is heavily optimized."

	| isExternalNormalizedLineEnding |

	[peekChar
		ifNil: [
			stream atEnd
				ifTrue: [
					self hasNextAfterPoppingStreamsAtEnd
						ifFalse: [^ self]].
			peekChar := stream next.
			isExternal
				ifTrue: [
					peekChar == LFCharacter
						ifTrue: [isExternalNormalizedLineEnding := true]
						ifFalse: [
							peekChar == CRCharacter
								ifTrue: [
									stream atEnd
										ifFalse: [
											stream peek == LFCharacter
												ifTrue: [stream next]].
									isExternalNormalizedLineEnding := true]
								ifFalse: [
									isExternalNormalizedLineEnding := false.
									"nil understands #isXMLSeparator, so it
									isn't tested for first"
									peekChar isXMLSeparator]]]
				ifFalse: [
					"nil understands #isXMLSeparator, so it isn't tested for first"
					peekChar isXMLSeparator]]
			ifNotNil: [
				isExternal
					ifTrue: [
						isExternalNormalizedLineEnding :=
							peekChar == normalizedLineEndingChar].
				peekChar isXMLSeparator]]
		whileTrue: [
			"inlined from #next"
			peekChar := nil.
			isExternal
				ifTrue: [
					currentPosition := currentPosition + 1.
					isExternalNormalizedLineEnding
						ifTrue: [
							currentLineNumber := currentLineNumber + 1.
							currentLineStartPosition := currentPosition].
			readLimit
				ifNotNil: [
					(readLimit := readLimit - 1) >= 0
						ifFalse: [self errorReadLimitExceeded]]]]
]

{ #category : #positioning }
XMLNestedStreamReader >> skipTo: aCharacter [
	[self atEnd]
		whileFalse: [
			self next = aCharacter
				ifTrue: [^ true]].
	^ false.
]

{ #category : #accessing }
XMLNestedStreamReader >> stream [
	^ stream
]

{ #category : #accessing }
XMLNestedStreamReader >> stream: aStream [
	"if the stream is not already a decoding adapter,
	then only assume it needs one if it's binary"
	stream := 
		aStream isXMLConvertingStreamAdapter
			ifTrue: [aStream]
			ifFalse: [
				(XMLDecodingReadStreamAdapter nonDecodingOnIfBinaryOrExternal: aStream)
					ifNil: [aStream]]
]

{ #category : #accessing }
XMLNestedStreamReader >> upTo: aCharacter [
	| writeStream nextChar |

	writeStream := self newWriteStream.
	[self atEnd
		or: [(nextChar := self next) = aCharacter]]
		whileFalse: [writeStream nextPut: nextChar].
	^ writeStream contents.
]

{ #category : #accessing }
XMLNestedStreamReader >> upToEnd [
	| writeStream |

	writeStream := self newWriteStream.
	[self atEnd]
		whileFalse: [writeStream nextPut: self next].
	^ writeStream contents.
]

{ #category : #defaults }
XMLNestedStreamReader >> writeStreamCollectionClass [
	^ String
]
