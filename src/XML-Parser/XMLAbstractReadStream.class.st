"
An abstract class for read streams.
"
Class {
	#name : #XMLAbstractReadStream,
	#superclass : #Object,
	#category : #'XML-Parser-Streams'
}

{ #category : #basic }
XMLAbstractReadStream class >> basicOn: anObject [
	^ self basicNew initialize on: anObject
]

{ #category : #'instance creation' }
XMLAbstractReadStream class >> new [
	self shouldNotImplement
]

{ #category : #'instance creation' }
XMLAbstractReadStream class >> on: anObject [
	^ self basicOn: anObject
]

{ #category : #testing }
XMLAbstractReadStream >> atEnd [
	self subclassResponsibility
]

{ #category : #closing }
XMLAbstractReadStream >> close [
]

{ #category : #accessing }
XMLAbstractReadStream >> contents [
	self subclassResponsibility
]

{ #category : #testing }
XMLAbstractReadStream >> isBinary [
	^ false
]

{ #category : #testing }
XMLAbstractReadStream >> isStream [
	^ true
]

{ #category : #testing }
XMLAbstractReadStream >> isXMLBinaryOrExternalStream [
	^ self isBinary
]

{ #category : #'instance creation' }
XMLAbstractReadStream >> newWriteStream [
	^ (self writeStreamCollectionClass new: 128) writeStream
]

{ #category : #accessing }
XMLAbstractReadStream >> next [
	self subclassResponsibility
]

{ #category : #accessing }
XMLAbstractReadStream >> next: anInteger [
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

{ #category : #initialization }
XMLAbstractReadStream >> on: anObject [
	self subclassResponsibility
]

{ #category : #accessing }
XMLAbstractReadStream >> peek [
	self subclassResponsibility
]

{ #category : #accessing }
XMLAbstractReadStream >> peekFor: anObject [
	(self atEnd not
		and: [self peek = anObject])
		ifTrue: [
			self next.
			^ true]
		ifFalse: [^ false]
]

{ #category : #positioning }
XMLAbstractReadStream >> position [
	self subclassResponsibility
]

{ #category : #positioning }
XMLAbstractReadStream >> position: anInteger [
	self subclassResponsibility
]

{ #category : #positioning }
XMLAbstractReadStream >> reset [
	self subclassResponsibility
]

{ #category : #positioning }
XMLAbstractReadStream >> skip: anInteger [
	"only supports skipping forwards"
	1 to: anInteger do: [:i |
		self atEnd
			ifTrue: [^ self].
		self next]
]

{ #category : #positioning }
XMLAbstractReadStream >> skipSeparators [
	"we use #isXMLWhitespace instead of the narrower, XML-specific
	#isXMLSeparator, because this class can be used for non-XML
	streams too"
	[self atEnd not
		and: [self peek isXMLWhitespace]]
		whileTrue: [self next]
]

{ #category : #positioning }
XMLAbstractReadStream >> skipTo: anObject [
	[self atEnd]
		whileFalse: [
			self next = anObject
				ifTrue: [^ true]].
	^ false.
]

{ #category : #accessing }
XMLAbstractReadStream >> upTo: anObject [
	| writeStream next |

	writeStream := self newWriteStream.
	[self atEnd
		or: [(next := self next) = anObject]]
		whileFalse: [writeStream nextPut: next].
	^ writeStream contents.
]

{ #category : #accessing }
XMLAbstractReadStream >> upToEnd [
	| writeStream |

	writeStream := self newWriteStream.
	[self atEnd]
		whileFalse: [writeStream nextPut: self next].
	^ writeStream contents.
]

{ #category : #writing }
XMLAbstractReadStream >> writeStreamCollectionClass [
	self isBinary
		ifTrue: [^ ByteArray]
		ifFalse: [^ String]
]
