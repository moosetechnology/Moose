Class {
	#name : #XMLNestedStreamReaderTest,
	#superclass : #TestCase,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #asserting }
XMLNestedStreamReaderTest class >> shouldInheritTests [
	^ true
]

{ #category : #accessing }
XMLNestedStreamReaderTest >> absentChar [
	^ $!
]

{ #category : #accessing }
XMLNestedStreamReaderTest >> cr [
	^ Character cr
]

{ #category : #accessing }
XMLNestedStreamReaderTest >> lf [
	^ Character lf
]

{ #category : #'instance creation' }
XMLNestedStreamReaderTest >> newStreamOn: aCollection [
	^ XMLExceptionRaisingReadStream on: aCollection
]

{ #category : #'instance creation' }
XMLNestedStreamReaderTest >> newStreamOnSourceXML [
	^ self newStreamOn: self sourceXML
]

{ #category : #'instance creation' }
XMLNestedStreamReaderTest >> newStreamReaderOn: aStream [
	^ self streamReaderClass on: aStream
]

{ #category : #'instance creation' }
XMLNestedStreamReaderTest >> newStreamReaderOnSourceXML [
	^ self newStreamReaderOn: self newStreamOnSourceXML
]

{ #category : #accessing }
XMLNestedStreamReaderTest >> nonLineEndingSeparators [
	^ self separators reject: [:each |
		each = self cr
			or: [each = self lf]]
]

{ #category : #accessing }
XMLNestedStreamReaderTest >> normalizedLineEnding [
	^ self lf
]

{ #category : #source }
XMLNestedStreamReaderTest >> normalizedSourceXML [
	^ self sourceXMLNormalizedWith: self normalizedLineEnding
]

{ #category : #accessing }
XMLNestedStreamReaderTest >> separators [
	^ Character xmlSeparators
]

{ #category : #source }
XMLNestedStreamReaderTest >> sourceXML [
	^ self sourceXMLTemplate format:
		(Array
			with: self lf
			with: (String with: self cr with: self lf)
			with: (String withAll: self nonLineEndingSeparators)
			with: self cr)
]

{ #category : #source }
XMLNestedStreamReaderTest >> sourceXMLNormalizedWith: aCharacter [
	^ self sourceXMLTemplate format:
		(Array
			with: aCharacter
			with: aCharacter
			with: (String withAll: self nonLineEndingSeparators)
			with: aCharacter)
]

{ #category : #source }
XMLNestedStreamReaderTest >> sourceXMLTemplate [
	^ '{1}	<test>{2}	   test{3}test{4}</test>'
]

{ #category : #accessing }
XMLNestedStreamReaderTest >> streamReaderClass [
	^ XMLNestedStreamReader
]

{ #category : #tests }
XMLNestedStreamReaderTest >> testAtEnd [
	| streamReader |

	streamReader := self newStreamReaderOnSourceXML.
	self normalizedSourceXML size timesRepeat: [
		self deny: streamReader atEnd.
		streamReader next].
	self
		assert: streamReader atEnd;
		assert: streamReader stream atEnd.

	streamReader pushBack: self normalizedSourceXML.
	self normalizedSourceXML size timesRepeat: [
		self deny: streamReader atEnd.
		streamReader next].
	self
		assert: streamReader atEnd;
		assert: streamReader stream atEnd.

	streamReader pushBack: ''.
	self
		assert: streamReader atEnd;
		assert: streamReader stream atEnd.
]

{ #category : #tests }
XMLNestedStreamReaderTest >> testCloseStreams [
	| stream streamReader pushedBackStream evaluated |

	stream := self newStreamOnSourceXML.
	streamReader := self newStreamReaderOn: stream.

	pushedBackStream := self newStreamOnSourceXML.
	evaluated := false.
	streamReader
		pushBackStream: pushedBackStream
		whenPoppedDo: [evaluated := true]
		isExternal: true.
	self
		assert: streamReader stream == pushedBackStream;
		assert: streamReader hasPushedBackStreams;
		deny: stream wasClosed;
		deny: pushedBackStream wasClosed.

	self
		assert: streamReader closeStreams == streamReader;
		assert: streamReader atEnd;
		deny: streamReader stream == stream;
		deny: streamReader stream == pushedBackStream;
		deny: streamReader hasPushedBackStreams;
		assert: stream wasClosed;
		assert: pushedBackStream wasClosed;
		deny: evaluated.

	self
		shouldnt: [streamReader closeStreams]
		raise: Error.
]

{ #category : #tests }
XMLNestedStreamReaderTest >> testHasPushedBackStreams [
	| streamReader |

	streamReader := self newStreamReaderOnSourceXML.
	self deny: streamReader hasPushedBackStreams.

	streamReader pushBackStream: (self newStreamOn: '').
	self assert: streamReader hasPushedBackStreams.

	streamReader next.
	self deny: streamReader hasPushedBackStreams.
]

{ #category : #tests }
XMLNestedStreamReaderTest >> testIsBinary [
	self deny: self newStreamReaderOnSourceXML isBinary
]

{ #category : #tests }
XMLNestedStreamReaderTest >> testIsStream [
	self assert: self newStreamReaderOnSourceXML isStream
]

{ #category : #tests }
XMLNestedStreamReaderTest >> testIsXMLBinaryOrExternalStream [
	| streamReader |

	streamReader := self newStreamReaderOnSourceXML.
	self assert: streamReader isXMLBinaryOrExternalStream = streamReader isBinary.
]

{ #category : #tests }
XMLNestedStreamReaderTest >> testLineEndingNormalizationAcrossStreams [
	| streamReader |

	streamReader :=
		self newStreamReaderOn:
			(self newStreamOn: (String with: self lf)).
	streamReader pushBackCharacter: self cr.
	streamReader
		pushBackStream:
			(self newStreamOn:
				(String with: self cr with: self lf))
		whenPoppedDo: nil
		isExternal: true.
	self
		assert: streamReader next = self normalizedLineEnding;
		deny: streamReader atEnd;
		assert: streamReader next = self cr;
		deny: streamReader atEnd;
		assert: streamReader next = self normalizedLineEnding;
		assert: streamReader atEnd.
]

{ #category : #tests }
XMLNestedStreamReaderTest >> testNext [
	| streamReader currentLineNumber currentColumnNumber currentPosition |

	streamReader := self newStreamReaderOnSourceXML.
	currentLineNumber := 1.
	currentColumnNumber := currentPosition := 0.
	self normalizedSourceXML do: [:each |
		self assert: streamReader next = each.
		each = self normalizedLineEnding
			ifTrue: [
				currentLineNumber := currentLineNumber + 1.
				currentColumnNumber := 0]
			ifFalse: [currentColumnNumber := currentColumnNumber + 1].
		currentPosition := currentPosition + 1.
		self
			assert: streamReader currentLineNumber = currentLineNumber;
			assert: streamReader currentColumnNumber = currentColumnNumber;
			assert: streamReader currentPosition = currentPosition].
	self assert: streamReader next isNil.

	streamReader := self newStreamReaderOnSourceXML.
	self
		assert: (streamReader next: self normalizedSourceXML size) = self normalizedSourceXML;
		assert: streamReader currentLineNumber = currentLineNumber;
		assert: streamReader currentColumnNumber = currentColumnNumber;
		assert: streamReader currentPosition = currentPosition;
		assert: (streamReader next: self normalizedSourceXML size) = ''.
]

{ #category : #tests }
XMLNestedStreamReaderTest >> testNormalizedLineEndingChar [
	| streamReader |

	streamReader := self newStreamReaderOnSourceXML.
	self
		assert: (streamReader normalizedLineEndingChar: $N) == streamReader;
		assert: (streamReader normalizedLineEndingChar) == $N;
		assert: streamReader upToEnd = (self sourceXMLNormalizedWith: $N).
]

{ #category : #tests }
XMLNestedStreamReaderTest >> testPeek [
	| streamReader currentLineNumber currentColumnNumber currentPosition |

	streamReader := self newStreamReaderOnSourceXML.
	currentLineNumber := 1.
	currentColumnNumber := currentPosition := 0.
	self normalizedSourceXML do: [:each |
		self
			assert: streamReader peek = each;
			assert: streamReader currentLineNumber = currentLineNumber;
			assert: streamReader currentColumnNumber = currentColumnNumber.

		streamReader next.
		each = self normalizedLineEnding
			ifTrue: [
				currentLineNumber := currentLineNumber + 1.
				currentColumnNumber := 0]
			ifFalse: [currentColumnNumber := currentColumnNumber + 1].
		currentPosition := currentPosition + 1.
		self
			assert: streamReader currentLineNumber = currentLineNumber;
			assert: streamReader currentColumnNumber = currentColumnNumber;
			assert: streamReader currentPosition = currentPosition].
	self assert: streamReader peek isNil.
]

{ #category : #tests }
XMLNestedStreamReaderTest >> testPeekFor [
	| streamReader |

	streamReader := self newStreamReaderOnSourceXML.
	self normalizedSourceXML do: [:each |
		self
			deny: (streamReader peekFor: #absent);
			deny: (streamReader peekFor: nil);
			assert: (streamReader peekFor: each);
			deny: (streamReader peekFor: #absent);
			deny: (streamReader peekFor: nil)].
	self
		deny: (streamReader peekFor: #absent);
		deny: (streamReader peekFor: nil).
]

{ #category : #tests }
XMLNestedStreamReaderTest >> testPushBackStreamWhenPoppedDoIsExternal [
	| streamReader evaluated |

	streamReader := self newStreamReaderOn: (self newStreamOn: '').
	evaluated := false.
	self assert:
		(streamReader
			pushBackStream: self newStreamReaderOnSourceXML
			whenPoppedDo: [evaluated := true]
			isExternal: true) == streamReader.
	self normalizedSourceXML do: [:each |
		self
			assert: streamReader peek = each;
			assert: streamReader next = each;
			deny: evaluated].
	self
		assert: streamReader next isNil;
		assert: evaluated.
]

{ #category : #tests }
XMLNestedStreamReaderTest >> testPushBackStreamWhenPoppedDoIsExternalException [
	"ensure that throwing an exception from the callback doesn't stop
	the stream from being closed or getting popped"

	| stream streamReader evaluated |

	stream := self newStreamOnSourceXML.
	streamReader := self newStreamReaderOnSourceXML.
	evaluated := false.
	streamReader
		pushBackStream: stream
		whenPoppedDo: [
			evaluated := true.
			Error signal]
		isExternal: true.
	self
		assert: streamReader stream == stream;
		deny: evaluated;
		deny: stream wasClosed.

	self
		should: [streamReader upToEnd]
		raise: Error.
	self
		deny: streamReader stream == stream;
		assert: evaluated;
		assert: stream wasClosed.
]

{ #category : #tests }
XMLNestedStreamReaderTest >> testSkipSeparators [
	| streamReader stream currentLineNumber currentColumnNumber currentPosition |

	streamReader := self newStreamReaderOnSourceXML.
	stream := self newStreamOn: self normalizedSourceXML.
	currentLineNumber := 1.
	currentColumnNumber := currentPosition := 0.
	[stream atEnd]
		whileFalse: [| totalSeparatorsSkipped |
			totalSeparatorsSkipped := 0.
			[self separators includes: stream peek]
				whileTrue: [
					stream next = self normalizedLineEnding
						ifTrue: [
							currentLineNumber := currentLineNumber + 1.
							currentColumnNumber := 0]
						ifFalse: [currentColumnNumber := currentColumnNumber + 1].
					currentPosition := currentPosition + 1.
					totalSeparatorsSkipped := totalSeparatorsSkipped + 1].
			streamReader skipSeparators.
			self
				assert: streamReader currentLineNumber = currentLineNumber;
				assert: streamReader currentColumnNumber = currentColumnNumber;
				assert: streamReader currentPosition = currentPosition.
			totalSeparatorsSkipped > 0
				ifFalse: [
					stream next.
					streamReader next.
					currentColumnNumber := currentColumnNumber + 1.
					currentPosition := currentPosition + 1]].
]

{ #category : #tests }
XMLNestedStreamReaderTest >> testStreamPushbackPortability [
	| streamReader output lastPeek lastNext |

	streamReader := self newStreamReaderOn: (self newStreamOn: '').
	streamReader
		pushBackStream: self newStreamOnSourceXML
		whenPoppedDo: nil
		isExternal: true.
	output := String new writeStream.
	self
		shouldnt: [
			self normalizedSourceXML size timesRepeat: [
				output nextPut:
					(streamReader
						peek;
						next)].
			lastPeek := streamReader peek.
			lastNext := streamReader next]
		raise: Error.
	self
		assert: output contents = self normalizedSourceXML;
		assert: lastPeek isNil;
		assert: lastNext isNil;
		assert: streamReader atEnd.
]

{ #category : #tests }
XMLNestedStreamReaderTest >> testUpTo [
	self normalizedSourceXML do: [:each | | streamReader |
		streamReader := self newStreamReaderOnSourceXML.
		self assert:
			(streamReader upTo: each) =
				(self normalizedSourceXML copyUpTo: each).
		self assert:
			streamReader upToEnd =
				(self normalizedSourceXML copyAfter: each)].
	self assert:
		(self newStreamReaderOnSourceXML upTo: self absentChar) = self normalizedSourceXML.
]

{ #category : #tests }
XMLNestedStreamReaderTest >> testUpToEnd [
	| streamReader |

	self normalizedSourceXML withIndexDo: [:each :i |
		streamReader := self newStreamReaderOnSourceXML.
		streamReader next: i.
		self
			assert: streamReader upToEnd = (self normalizedSourceXML allButFirst: i);
			assert: streamReader upToEnd = ''].
	streamReader := self newStreamReaderOnSourceXML.
	self
		assert: streamReader upToEnd = self normalizedSourceXML;
		assert: streamReader upToEnd = ''.
]
