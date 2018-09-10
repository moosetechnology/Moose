"
This class percent decodes octets for URIs.
"
Class {
	#name : #XMLPercentDecodingReadStreamAdapter,
	#superclass : #XMLReadStreamAdapter,
	#category : #'XML-Parser-Streams'
}

{ #category : #testing }
XMLPercentDecodingReadStreamAdapter >> atEnd [
	^ stream atEnd
		or: [stream peek ~~ $%]
]

{ #category : #testing }
XMLPercentDecodingReadStreamAdapter >> isBinary [
	"this stream is binary, because it reads percent-encoded octets
	character sequences like '%HH' and returns the octet values as
	SmallIntegers"
	^ true
]

{ #category : #accessing }
XMLPercentDecodingReadStreamAdapter >> next [
	| byte |

	(stream atEnd not
		and: [stream peek == $%])
		ifTrue: [
			stream next.
			byte :=
				(XMLSmallIntegerReader
					readFrom: stream
					withBase: 16
					upToLimit: 2)
						ifNil: [37] "$% asciiValue"].
	^ byte.
]

{ #category : #accessing }
XMLPercentDecodingReadStreamAdapter >> peek [
	| byte |

	stream atEnd
		ifFalse: [| oldPosition |
			oldPosition := stream position.
			byte := self next.
			stream position: oldPosition].
	^ byte.
]
