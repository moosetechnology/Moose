"
This is a class to parse MIME types with a main type and sub type separated by a ""/"", like ""text/plain"", and optional name=value parameters separated by "";"" after. Adapted from ZnMimeType.
"
Class {
	#name : #XMLHTTPMIMETypeParser,
	#superclass : #XMLAbstractReadStreamParser,
	#classVars : [
		'TokenDelimiters'
	],
	#category : #'XML-Parser-HTTP'
}

{ #category : #'class initialization' }
XMLHTTPMIMETypeParser class >> initialize [
	"self initialize"

	self initializeTokenDelimiters
]

{ #category : #'class initialization' }
XMLHTTPMIMETypeParser class >> initializeTokenDelimiters [
	"String streamContents: [:writeStream | | readStream current previous |
		readStream := self tspecialsTemplate readStream.
		[readStream atEnd]
			whileFalse: [
				previous := current.
				current := readStream next.
				(#('""' '<>') anySatisfy: [:each |
					previous = each first
						and: [readStream peek = each last]])
					ifTrue: [writeStream nextPut: current]]]"

	TokenDelimiters :=
		BitmapCharacterSet newFrom: '()<>@,;:\"/[]?.=', Character xmlWhitespace
]

{ #category : #private }
XMLHTTPMIMETypeParser class >> tspecialsTemplate [
	^ '	tspecials :=  "(" / ")" / "<" / ">" / "@"  ; Must be in
                       /  "," / ";" / ":" / "\" / <">  ; quoted-string,
                       /  "/" / "[" / "]" / "?" / "."  ; to use within
                       /  "="                        ; parameter values'
]

{ #category : #private }
XMLHTTPMIMETypeParser >> nextOptionalQuotedString [
	| isEscaping nextChar |

	(readStream
		skipSeparators;
		peekFor: $")
		ifFalse: [^ nil].

	writeStream
		reset;
		nextPut: $".
	isEscaping := false.
	[(nextChar := readStream next) isNil
		or: [isEscaping not
			and: [nextChar == $"]]]
		whileFalse: [
			isEscaping :=
				isEscaping not
					and: [nextChar == $\].
			writeStream nextPut: nextChar].
	^ writeStream
		nextPut: $";
		contents.
]

{ #category : #private }
XMLHTTPMIMETypeParser >> nextToken [
	readStream skipSeparators.
	^ self nextDelimitedByAny: TokenDelimiters.

]

{ #category : #private }
XMLHTTPMIMETypeParser >> nextTokenOrQuotedString [
	^ self nextOptionalQuotedString
		ifNil: [self nextToken]
]

{ #category : #parsing }
XMLHTTPMIMETypeParser >> parseMainType [
	"main types are case insensitive and are converted to
	lowercase for consistentcy"
	^ self nextToken asLowercase
]

{ #category : #parsing }
XMLHTTPMIMETypeParser >> parseParameters [
	| parameters attributes totalAttributes |

	parameters := OrderedCollection new.
	totalAttributes := 0.
	[(readStream
		skipSeparators;
		peekFor: $;)
			and: [
				(readStream
					skipSeparators;
					atEnd) not]]
		whileTrue: [| attribute value hasValue |
			"attributes are case insensitive and are converted
			to lowercase for convenience"
			attribute := self nextToken asLowercase.
			(hasValue :=
				readStream
					skipSeparators;
					peekFor: $=)
				ifTrue: [value := self nextTokenOrQuotedString]
				ifFalse: [value := ''].
			(attribute notEmpty
				or: [hasValue])
				ifTrue: [
					"only initialize if needed"
					((attributes ifNil: [attributes := Set new])
						add: attribute;
						size) > totalAttributes
						ifTrue: [
							parameters addLast: attribute -> value.
							totalAttributes := totalAttributes + 1]]].
	^ parameters.
]

{ #category : #parsing }
XMLHTTPMIMETypeParser >> parseSubType [
	"sub types are case insensitive and are converted to
	lowercase for consistentcy"
	readStream
		skipSeparators;
		peekFor: $/.
	^ self nextToken asLowercase.
]
