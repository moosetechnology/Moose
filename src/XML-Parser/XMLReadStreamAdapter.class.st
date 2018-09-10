"
A base class for read stream adapters for basic streams that support #next, #peek, #atEnd, #position, #position:, and #reset. It adds support for skipping and reading upto a character or the end of the stream, and ensures #next and #peek return nil when the stream is #atEnd instead of raising an error.
"
Class {
	#name : #XMLReadStreamAdapter,
	#superclass : #XMLStreamAdapter,
	#category : #'XML-Parser-Streams'
}

{ #category : #'instance creation' }
XMLReadStreamAdapter class >> onIfBinaryOrExternal: aStream [
	^ aStream isXMLBinaryOrExternalStream
		ifTrue: [self on: aStream]
		ifFalse: [nil]
]

{ #category : #testing }
XMLReadStreamAdapter >> atEnd [
	^ stream atEnd
]

{ #category : #accessing }
XMLReadStreamAdapter >> contents [
	| oldPosition contents |

	oldPosition := self position.
	self reset.
	contents := self upToEnd.
	self position: oldPosition.
	^ contents.
]

{ #category : #private }
XMLReadStreamAdapter >> newWriteStream [
	^ (self writeStreamCollectionClass new: 128) writeStream
]

{ #category : #accessing }
XMLReadStreamAdapter >> next [
	stream atEnd
		ifTrue: [^ nil]
		ifFalse: [^ stream next]
]

{ #category : #accessing }
XMLReadStreamAdapter >> next: anInteger [
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
XMLReadStreamAdapter >> peek [
	stream atEnd
		ifTrue: [^ nil]
		ifFalse: [^ stream peek]
]

{ #category : #accessing }
XMLReadStreamAdapter >> peekFor: anObject [
	(self atEnd not
		and: [self peek = anObject])
		ifTrue: [
			self next.
			^ true]
		ifFalse: [^ false]
]

{ #category : #positioning }
XMLReadStreamAdapter >> position [
	^ stream position
]

{ #category : #positioning }
XMLReadStreamAdapter >> position: anInteger [
	stream position: anInteger
]

{ #category : #positioning }
XMLReadStreamAdapter >> reset [
	stream reset
]

{ #category : #positioning }
XMLReadStreamAdapter >> skip: anInteger [
	"only supports skipping forwards"
	1 to: anInteger do: [:i |
		self atEnd
			ifTrue: [^ self].
		self next]
]

{ #category : #positioning }
XMLReadStreamAdapter >> skipSeparators [
	"we use #isXMLWhitespace instead of the narrower, XML-specific
	#isXMLSeparator, because this class supports non-XML input too"
	[self atEnd not
		and: [self peek isXMLWhitespace]]
		whileTrue: [self next]
]

{ #category : #positioning }
XMLReadStreamAdapter >> skipTo: anObject [
	[self atEnd]
		whileFalse: [
			self next = anObject
				ifTrue: [^ true]].
	^ false.
]

{ #category : #accessing }
XMLReadStreamAdapter >> upTo: anObject [
	| writeStream next |

	writeStream := self newWriteStream.
	[self atEnd
		or: [(next := self next) = anObject]]
		whileFalse: [writeStream nextPut: next].
	^ writeStream contents.
]

{ #category : #accessing }
XMLReadStreamAdapter >> upToEnd [
	| writeStream |

	writeStream := self newWriteStream.
	[self atEnd]
		whileFalse: [writeStream nextPut: self next].
	^ writeStream contents.
]

{ #category : #defaults }
XMLReadStreamAdapter >> writeStreamCollectionClass [
	self isBinary
		ifTrue: [^ ByteArray]
		ifFalse: [^ String]
]
