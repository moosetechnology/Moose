"
A stream converter for ISO Latin-1.
"
Class {
	#name : #XMLLatin1StreamConverter,
	#superclass : #XMLStatelessStreamConverter,
	#category : #'XML-Parser-Streams'
}

{ #category : #basic }
XMLLatin1StreamConverter class >> basicEncodingNames [
	^ #('Latin-1' 'Latin1'
			'CP-819' 'CP819'
			'IBM-819' 'IBM819'
			'ISO-8859-1' 'ISO8859-1' 'ISO-88591' 'ISO88591'
			'ISO-IR-100' 'ISOIR-100' 'ISO-IR100' 'ISOIR100'
			'L1'
			'csISOLatin1')
]

{ #category : #decoding }
XMLLatin1StreamConverter >> nextFromStream: aStream [
	| byte |

	aStream atEnd
		ifTrue: [^ nil].
	(byte := aStream next asInteger) > 255
		ifTrue: [self errorBadCharacterValue: byte].

	^ byte asCharacter.
]

{ #category : #encoding }
XMLLatin1StreamConverter >> nextPut: aCharacter toStream: aStream [
	| codePoint |

	(codePoint := aCharacter asInteger) > 255
		ifTrue: [self errorBadCharacterValue: codePoint].

	aStream nextPut: codePoint.
]
