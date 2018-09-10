"
An abstract class for UTF-16 stream converters.
"
Class {
	#name : #XMLUTF16StreamConverter,
	#superclass : #XMLUTFStreamConverter,
	#category : #'XML-Parser-Streams'
}

{ #category : #defaults }
XMLUTF16StreamConverter class >> abstractClass [
	^ XMLUTF16StreamConverter
]

{ #category : #testing }
XMLUTF16StreamConverter >> isBigEndian [
	self subclassResponsibility
]

{ #category : #basic }
XMLUTF16StreamConverter >> nextCodePointFromStream: aStream [
	| codePoint lowSurrogate |

	aStream atEnd
		ifTrue: [^ nil].

	"code points U+10000 to U+10FFFF are encoded with surrogate pairs,
	while those < U+10000 are encoded directly"
	((codePoint := self nextTwoBytesFromStream: aStream) < 16rD800
		or: [codePoint > 16rDFFF])
		ifTrue: [
			codePoint > 16r10FFFF
				ifTrue: [self errorBadCharacterValue: codePoint].
			^ codePoint].

	codePoint > 16rDBFF "max high surrogate"
		ifTrue: [self errorBadCharacterEncoding].

	aStream atEnd
		ifTrue: [self errorBadCharacterEncoding].
	(lowSurrogate := self nextTwoBytesFromStream: aStream)
		ifNil: [self errorBadCharacterEncoding].
	(lowSurrogate < 16rDC00 "min low surrogate"
		or: [lowSurrogate > 16rDFFF]) "max low surrogate"
		ifTrue: [self errorBadCharacterEncoding].

	"A code point > U+10FFFF isn't checked for here because it can't
	be encoded with UTF-16. The maximum surrogate pairs can encode is:
		(16r10000 + (16r3FF bitShift: 10) + 16r3FF) = 16r10FFFF"
	^ ((codePoint bitAnd: 16r3FF) bitShift: 10) +
		(lowSurrogate bitAnd: 16r3FF) +
		16r10000.
]

{ #category : #encoding }
XMLUTF16StreamConverter >> nextPut: aCharacter toStream: aStream [
	| codePoint |

	(codePoint := aCharacter asInteger) < 16r10000
		ifTrue: [
			"check for the reserved surrogate pair code points"
			(codePoint >= 16rD800
				and: [codePoint <= 16rDFFF])
				ifTrue: [self errorBadCharacterValue: codePoint].
			self
				nextPutTwoBytes: codePoint
				toStream: aStream]
		ifFalse: [
			codePoint > 16r10FFFF "max code point"
				ifTrue: [self errorBadCharacterValue: codePoint].
			codePoint := codePoint - 16r10000.
			"the 10 high-order bits"
			self
				nextPutTwoBytes: 16rD800 + ((codePoint bitShift: -10) bitAnd: 16r3FF)
				toStream: aStream.
			"the 10 low-order bits"
			self
				nextPutTwoBytes: 16rDC00 + (codePoint bitAnd: 16r3FF)
				toStream: aStream]
]

{ #category : #basic }
XMLUTF16StreamConverter >> nextPutTwoBytes: anInteger toStream: aStream [
	self subclassResponsibility
]

{ #category : #basic }
XMLUTF16StreamConverter >> nextTwoBytesFromStream: aStream [
	self subclassResponsibility
]
