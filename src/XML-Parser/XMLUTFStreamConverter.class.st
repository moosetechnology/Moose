"
An abstract class for Unicode stream converters.
"
Class {
	#name : #XMLUTFStreamConverter,
	#superclass : #XMLStatelessStreamConverter,
	#category : #'XML-Parser-Streams'
}

{ #category : #defaults }
XMLUTFStreamConverter class >> abstractClass [
	^ XMLUTFStreamConverter
]

{ #category : #private }
XMLUTFStreamConverter >> errorBadCharacterValue: aValue [
	XMLEncodingException
		formatSignal: 'Invalid {1} code point U+{1}'
		with: self encoding
		with: aValue printStringHex
]

{ #category : #basic }
XMLUTFStreamConverter >> nextCodePointFromStream: aStream [
	self subclassResponsibility
]

{ #category : #decoding }
XMLUTFStreamConverter >> nextFromStream: aStream [
	| codePoint |

	codePoint := self nextCodePointFromStream: aStream.
	[codePoint == 16rFEFF] "the BOM code point"
		whileTrue: [
			aStream atEnd
				ifTrue: [^ nil].
			codePoint := self nextCodePointFromStream: aStream].
	^ codePoint
		ifNotNil: [codePoint asCharacter].
]
