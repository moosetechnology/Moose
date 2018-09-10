"
A stream converter for ASCII.
"
Class {
	#name : #XMLASCIIStreamConverter,
	#superclass : #XMLStatelessStreamConverter,
	#category : #'XML-Parser-Streams'
}

{ #category : #basic }
XMLASCIIStreamConverter class >> basicEncodingNames [
	^ #('ASCII' 'US-ASCII' 'USASCII')
]

{ #category : #decoding }
XMLASCIIStreamConverter >> nextFromStream: aStream [
	| byte |

	aStream atEnd
		ifTrue: [^ nil].
	(byte := aStream next asInteger) > 127
		ifTrue: [self errorBadCharacterValue: byte].

	^ byte asCharacter.
]

{ #category : #encoding }
XMLASCIIStreamConverter >> nextPut: aCharacter toStream: aStream [
	| codePoint |

	(codePoint := aCharacter asInteger) > 127
		ifTrue: [self errorBadCharacterValue: codePoint].

	aStream nextPut: codePoint.
]
