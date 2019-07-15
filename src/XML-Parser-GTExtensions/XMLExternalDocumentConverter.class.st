"
This class converts an external XML document  into a string with line endings normalized to CRs (the Pharo/Squeak LE) and decodes it from any of the supported character encodings and will infer incodings from byte order marks or null bytes and also consider  <?xml ...?> encoding attributes.
"
Class {
	#name : #XMLExternalDocumentConverter,
	#superclass : #Object,
	#instVars : [
		'streamReader',
		'outputStream',
		'writeStream'
	],
	#category : #'XML-Parser-GTExtensions-Highlighting-Parser'
}

{ #category : #converting }
XMLExternalDocumentConverter class >> convert: aStringOrStream [
	^ (self on: aStringOrStream) convert
]

{ #category : #converting }
XMLExternalDocumentConverter class >> convert: aStringOrStream readLimit: aReadLimit [
	^ (self
		on: aStringOrStream
		readLimit: aReadLimit) convert
]

{ #category : #converting }
XMLExternalDocumentConverter class >> convertFileNamed: aFileName [
	^ (self onFileNamed: aFileName) convert
]

{ #category : #'instance creation' }
XMLExternalDocumentConverter class >> on: aStringOrStream [
	^ self
		on: aStringOrStream
		readLimit: XMLParserLimits defaultReadLimit
]

{ #category : #'instance creation' }
XMLExternalDocumentConverter class >> on: aStringOrStream readLimit: anInteger [
	^ self new
		setStream:
			(aStringOrStream isStream
				ifTrue: [aStringOrStream]
				ifFalse: [aStringOrStream readStream])
		readLimit: anInteger
]

{ #category : #'instance creation' }
XMLExternalDocumentConverter class >> onFileNamed: aFileName [
	^ self on:
		(XMLDecodingReadStreamAdapter nonDecodingOn:
			aFileName asXMLFileHandle rawReadStream)
]

{ #category : #closing }
XMLExternalDocumentConverter >> close [
	streamReader closeStreams
]

{ #category : #accessing }
XMLExternalDocumentConverter >> contents [
	^ outputStream contents
]

{ #category : #converting }
XMLExternalDocumentConverter >> convert [
	^ self
		detectEncoding;
		nextXMLDeclaration;
		skipToEnd;
		close;
		contents
]

{ #category : #'private ' }
XMLExternalDocumentConverter >> detectEncoding [
	streamReader detectEncoding

]

{ #category : #'private ' }
XMLExternalDocumentConverter >> expectNextAll: aString [
	aString do: [:each |
		"use #= for pre-SpurVM compatibility where wide chars aren't #=="
		self next = each
			ifFalse: [^ nil]].
	^ aString.
]

{ #category : #'private ' }
XMLExternalDocumentConverter >> next [
	^ streamReader next
		ifNotNil: [:nextChar |
			outputStream nextPut: nextChar.
			nextChar]
]

{ #category : #'private ' }
XMLExternalDocumentConverter >> nextXMLAttributeNamed: anAttributeName [
	| quote nextChar |

	self skipSeparators.
	(self expectNextAll: anAttributeName)
		ifNil: [^ nil].

	self skipSeparators.
	self next == $=
		ifFalse: [^ nil].
	self skipSeparators.

	((quote := self next) == $"
		or: [quote == $'])
		ifFalse: [^ nil].

	writeStream reset.
	[(nextChar := self next) isNil
		or: [nextChar == quote]]
		whileFalse: [writeStream nextPut: nextChar].

	nextChar
		ifNil: [^ nil]
		ifNotNil: [^ writeStream contents].
]

{ #category : #'private ' }
XMLExternalDocumentConverter >> nextXMLDeclaration [
	self skipSeparators.
	(self expectNextAll: '<?xml')
		ifNil: [^ self].

	self skipSeparators.
	(self nextXMLAttributeNamed: 'version')
		ifNil: [^ self].

	self skipSeparators.
	(self nextXMLAttributeNamed: 'encoding')
		ifNotNil: [:encodingName |
			encodingName asXMLStreamConverter isNull
				ifFalse: [streamReader convertFromEncoding: encodingName]].
]

{ #category : #'private ' }
XMLExternalDocumentConverter >> peek [
	^ streamReader peek
]

{ #category : #initialization }
XMLExternalDocumentConverter >> setStream: aStream readLimit: anInteger [
	streamReader :=
		XMLNestedStreamReader
			on:
				(aStream isXMLConvertingStreamAdapter
					ifTrue: [aStream]
					ifFalse: [
						XMLDecodingReadStreamAdapter nonDecodingOnIfBinary:
							aStream])
			readLimit: anInteger.

	"this is the preferred LE char for Pharo/Squeak"
	streamReader normalizedLineEndingChar: Character cr.

	outputStream := (String new: 1024) writeStream.
	writeStream := (String new: 64) writeStream.
]

{ #category : #'private ' }
XMLExternalDocumentConverter >> skipSeparators [
	[self peek isXMLSeparator]
		whileTrue: [self next]
]

{ #category : #'private ' }
XMLExternalDocumentConverter >> skipToEnd [
	[self next notNil] whileTrue
]
