Extension { #name : #BitmapCharacterSet }

{ #category : #'*XML-Tests-Parser' }
BitmapCharacterSet class >> fromXMLBNF: aString [
	"parses a subset of the BNF syntax used by the XML spec for character classes"
	| set readStream |

	set := self new.
	readStream := aString readStream.
	[readStream
		skipSeparators;
		atEnd]
		whileFalse: [
			(readStream peekFor: $[)
				ifTrue: [
					[readStream skipSeparators.
						readStream atEnd
							or: [readStream peekFor: $]]]
						whileFalse: [| start |
							start := self nextXMLBNFCharFrom: readStream.
							readStream
								skipSeparators;
								peekFor: $-;
								skipSeparators.
							set
								addRangeFrom: start
								to: (self nextXMLBNFCharFrom: readStream)]]
					ifFalse: [
						(self nextXMLBNFCharFrom: readStream)
							ifNotNil: [:nextChar |
								set add: nextChar]]].
	^ set.
]

{ #category : #'*XML-Tests-Parser' }
BitmapCharacterSet class >> nextXMLBNFCharFrom: aStream [
	(aStream peek == $"
		or: [aStream peek == $'])
		ifTrue: [^ (aStream upTo: aStream next) first].
	(aStream peekFor: $#)
		ifTrue: [
			^ (XMLSmallIntegerReader
				readFrom: aStream
				withBase: 16
				andPrefixes: 'xX'
				orBase: 10) asCharacter].
	(aStream peekFor: $|)
		ifTrue: [^ nil].
	^ aStream next.
]
