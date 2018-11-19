"
A highlighting XML document text style decorator.
"
Class {
	#name : #GLMXMLDocumentHighlighterTextStylerDecorator,
	#superclass : #GLMXMLHighlighterTextStylerDecorator,
	#instVars : [
		'encoding',
		'configuration'
	],
	#category : #'XML-Parser-GTExtensions-Highlighting-Parser'
}

{ #category : #accessing }
GLMXMLDocumentHighlighterTextStylerDecorator >> configuration [
	^ configuration
]

{ #category : #accessing }
GLMXMLDocumentHighlighterTextStylerDecorator >> configuration: aConfiguration [
	configuration := aConfiguration
]

{ #category : #private }
GLMXMLDocumentHighlighterTextStylerDecorator >> defaultEncoding [
	^ ''
]

{ #category : #accessing }
GLMXMLDocumentHighlighterTextStylerDecorator >> encoding [
	^ encoding
]

{ #category : #accessing }
GLMXMLDocumentHighlighterTextStylerDecorator >> encoding: anEncodingName [
	encoding := anEncodingName
]

{ #category : #testing }
GLMXMLDocumentHighlighterTextStylerDecorator >> hasEncoding [
	^ self encoding notEmpty
]

{ #category : #parsing }
GLMXMLDocumentHighlighterTextStylerDecorator >> highlightingParse: aString onError: aBlock [
	| highlightingParserHandler highlightingParser |

	highlightingParserHandler :=
		self newHighlightingParserHandlerOn: aString.
	highlightingParser :=
		self newHighlightingParserFromHandler: highlightingParserHandler.
	[highlightingParser parseDocument]
		on: XMLParserException
		do: [:error |
			aBlock cull: error.
			self encoding: highlightingParserHandler encoding.
			^ highlightingParserHandler
				asHighlightedTextColored: self errorColor
				startingAt:
					(self
						highlightStartPositionForErrorAt:
							highlightingParser currentPosition
						in: aString)].
	self encoding: highlightingParserHandler encoding.
	^ highlightingParserHandler asHighlightedText.
]

{ #category : #initialization }
GLMXMLDocumentHighlighterTextStylerDecorator >> initialize [
	super initialize.

	encoding := self defaultEncoding.
]

{ #category : #private }
GLMXMLDocumentHighlighterTextStylerDecorator >> newHighlightingParserFromHandler: aHighlightingParserHandler [
	^ aHighlightingParserHandler parser
]

{ #category : #private }
GLMXMLDocumentHighlighterTextStylerDecorator >> newHighlightingParserHandlerOn: aString [
	| parserHandler |

	parserHandler := XMLHighlightingParser on: aString.
	self configuration
		ifNotNil: [parserHandler configuration: self configuration copy].
	^ parserHandler.
]

{ #category : #files }
GLMXMLDocumentHighlighterTextStylerDecorator >> saveToFile: anXMLFileHandleOrFileName [
	| sourceToSave streamConverter |

	sourceToSave := self text asString.
	streamConverter :=
		self hasEncoding
			ifTrue: [self encoding asXMLStreamConverter]
			ifFalse: [XMLStreamConverter default].
	anXMLFileHandleOrFileName asXMLFileHandle writeStreamDo: [:writeStream |
		writeStream
			streamConverter: streamConverter;
			nextPutByteOrderMark;
			nextPutAll: sourceToSave].
]
