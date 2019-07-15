"
This class is a parser with an API like SAX 2.0, with separate SAX2ContentHandler, SAX2LexicalHandler, and SAX2DeclarationHandler classes that are subclassed unlike SAX 1.0 where a single,  unified handler class is subclassed directly. Parsers can be created with #on: or other instance creation messages, and instances of the content, lexical, and declaration handlers can be injected before parsing with #contentHandler:, #lexicalHandler:, and #declarationHandler:, like this:
	(SAX2Parser on: xmlStringOrStream)
		contentHandler: MyContentHandlerClass new;
		declarationHandler: MyDeclarationHandlerClass new;
		lexicalHandler: MyLexicalHandlerClass new;
		parseDocument.

Each handler can access the SAX2Parser object with #parser and set the parsing result returned by #parseDocument with #parsingResult:.

SAXHandler is not deprecated and can still be used if you prefer the SAX 1.0 style API.
"
Class {
	#name : #SAX2Parser,
	#superclass : #SAXHandler,
	#instVars : [
		'contentHandler',
		'lexicalHandler',
		'declarationHandler',
		'parsingResult'
	],
	#category : #'XML-Parser'
}

{ #category : #'private ' }
SAX2Parser class >> generateHandlerForwardingMethods [
	"
	self generateHandlerForwardingMethods
	"

	(Array
		with: 'contentHandler' -> #'handling - content'
		with: 'lexicalHandler' -> #'handling - lexical'
		with: 'declarationHandler' -> #'handling - declaration')
		do: [:handlerAccessorAndCategory | | handlerAccessor handlerCategory |
			handlerAccessor := handlerAccessorAndCategory key.
			handlerCategory := handlerAccessorAndCategory value.

			(SAXHandler selectorsInCategory: handlerCategory) do: [:each | | parsedMethod sourceStream |
				parsedMethod := RBParser parseMethod: (SAXHandler sourceCodeAt: each).
				(sourceStream := String new writeStream)
					nextPutAll: parsedMethod selectorAndArgumentNames;
					cr;
					nextPutAll: '	self ';
					nextPutAll: handlerAccessor.
				1 to: parsedMethod keywords size do: [:i |
					parsedMethod keywords size > 1
						ifTrue: [
							sourceStream
								cr;
								tab;
								tab]
						ifFalse: [sourceStream space].
					sourceStream nextPutAll: (parsedMethod keywords at: i).
					parsedMethod argumentNames
						ifNotEmpty: [
							sourceStream
								space;
								nextPutAll: (parsedMethod argumentNames at: i)]].

				self
					compile: sourceStream contents
					classified: handlerCategory]]
]

{ #category : #'private ' }
SAX2Parser class >> generateMethodsInHandlerClasses [
	"
	self generateMethodsInHandlerClasses
	"

	(Array
		with: SAX2ContentHandler -> #'handling - content'
		with: SAX2LexicalHandler -> #'handling - lexical'
		with: SAX2DeclarationHandler -> #'handling - declaration')
		do: [:handlerClassAndCategory | | handlerClass handlerCategory |
			handlerClass := handlerClassAndCategory key.
			handlerCategory := handlerClassAndCategory value.

			(SAXHandler selectorsInCategory: handlerCategory) do: [:each |
				handlerClass
					compile: (SAXHandler sourceCodeAt: each)
					classified: handlerCategory]]
]

{ #category : #'handling - declaration' }
SAX2Parser >> attributeDeclaration: anElementName name: anAttributeName type: aType defaultPragma: aDefaultPragma defaultValue: aDefaultValue [
	self declarationHandler
		attributeDeclaration: anElementName
		name: anAttributeName
		type: aType
		defaultPragma: aDefaultPragma
		defaultValue: aDefaultValue
]

{ #category : #'handling - content' }
SAX2Parser >> characters: aString [
	self contentHandler characters: aString
]

{ #category : #'handling - lexical' }
SAX2Parser >> comment: aString [
	self lexicalHandler comment: aString
]

{ #category : #accessing }
SAX2Parser >> contentHandler [
	^ contentHandler
]

{ #category : #accessing }
SAX2Parser >> contentHandler: aContentHandler [
	(contentHandler :=
		aContentHandler ifNil: [self defaultContentHandlerClass new])
			parser: self
]

{ #category : #accessing }
SAX2Parser >> declarationHandler [
	^ declarationHandler
]

{ #category : #accessing }
SAX2Parser >> declarationHandler: aDeclarationHandler [
	(declarationHandler :=
		aDeclarationHandler ifNil: [self defaultDeclarationHandlerClass new])
			parser: self
]

{ #category : #defaults }
SAX2Parser >> defaultContentHandlerClass [
	^ SAX2ContentHandler
]

{ #category : #defaults }
SAX2Parser >> defaultDeclarationHandlerClass [
	^ SAX2DeclarationHandler
]

{ #category : #defaults }
SAX2Parser >> defaultLexicalHandlerClass [
	^ SAX2LexicalHandler
]

{ #category : #defaults }
SAX2Parser >> defaultParsingResult [
	"the default parsing result of SAXHandler"
	^ self
]

{ #category : #'handling - declaration' }
SAX2Parser >> elementDeclaration: anElementName contentModel: aContentModel [
	self declarationHandler
		elementDeclaration: anElementName
		contentModel: aContentModel
]

{ #category : #'handling - lexical' }
SAX2Parser >> endCData [
	self lexicalHandler endCData
]

{ #category : #'handling - lexical' }
SAX2Parser >> endDTD [
	self lexicalHandler endDTD
]

{ #category : #'handling - content' }
SAX2Parser >> endDocument [
	self contentHandler endDocument
]

{ #category : #'handling - content' }
SAX2Parser >> endElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName [
	self contentHandler
		endElement: aQualifiedName
		prefix: aPrefix
		uri: aURI
		localName: aLocalName
]

{ #category : #'handling - lexical' }
SAX2Parser >> endEntity: anEntityName [
	self lexicalHandler endEntity: anEntityName
]

{ #category : #'handling - content' }
SAX2Parser >> endPrefixMapping: aPrefix [
	self contentHandler endPrefixMapping: aPrefix
]

{ #category : #'handling - declaration' }
SAX2Parser >> generalEntityDeclaration: aName publicID: aPublicID systemID: aSystemID ndata: aNotationName [
	self declarationHandler
		generalEntityDeclaration: aName
		publicID: aPublicID
		systemID: aSystemID
		ndata: aNotationName
]

{ #category : #'handling - declaration' }
SAX2Parser >> generalEntityDeclaration: aName replacement: aReplacement [
	self declarationHandler
		generalEntityDeclaration: aName
		replacement: aReplacement
]

{ #category : #'handling - content' }
SAX2Parser >> ignorableWhitespace: aString [
	self contentHandler ignorableWhitespace: aString
]

{ #category : #accessing }
SAX2Parser >> lexicalHandler [
	^ lexicalHandler
]

{ #category : #accessing }
SAX2Parser >> lexicalHandler: aLexicalHandler [
	(lexicalHandler :=
		aLexicalHandler ifNil: [self defaultLexicalHandlerClass new])
			parser: self
]

{ #category : #'handling - declaration' }
SAX2Parser >> notationDeclaration: aName publicID: aPublicID systemID: aSystemID [
	self declarationHandler
		notationDeclaration: aName
		publicID: aPublicID
		systemID: aSystemID
]

{ #category : #initialization }
SAX2Parser >> on: aStringOrStream [
	super on: aStringOrStream.

	contentHandler := self defaultContentHandlerClass parser: self.
	lexicalHandler := self defaultLexicalHandlerClass parser: self.
	declarationHandler := self defaultDeclarationHandlerClass parser: self.
	parsingResult := self defaultParsingResult.
]

{ #category : #'handling - declaration' }
SAX2Parser >> parameterEntityDeclaration: aName publicID: aPublicID systemID: aSystemID [
	self declarationHandler
		parameterEntityDeclaration: aName
		publicID: aPublicID
		systemID: aSystemID
]

{ #category : #'handling - declaration' }
SAX2Parser >> parameterEntityDeclaration: aName replacement: aReplacement [
	self declarationHandler
		parameterEntityDeclaration: aName
		replacement: aReplacement
]

{ #category : #parsing }
SAX2Parser >> parsingResult [
	^ parsingResult
]

{ #category : #parsing }
SAX2Parser >> parsingResult: anObject [
	parsingResult := anObject
]

{ #category : #'handling - content' }
SAX2Parser >> processingInstruction: aTargetString data: aDataString [
	self contentHandler
		processingInstruction: aTargetString
		data: aDataString
]

{ #category : #'handling - content' }
SAX2Parser >> skippedEntity: anEntityName [
	self contentHandler skippedEntity: anEntityName
]

{ #category : #'handling - lexical' }
SAX2Parser >> startCData [
	self lexicalHandler startCData
]

{ #category : #'handling - lexical' }
SAX2Parser >> startDTD: aRootElementName publicID: aPublicID systemID: aSystemID [
	self lexicalHandler
		startDTD: aRootElementName
		publicID: aPublicID
		systemID: aSystemID
]

{ #category : #'handling - content' }
SAX2Parser >> startDocument [
	self contentHandler startDocument
]

{ #category : #'handling - content' }
SAX2Parser >> startElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName attributes: aDictionary [
	self contentHandler
		startElement: aQualifiedName
		prefix: aPrefix
		uri: aURI
		localName: aLocalName
		attributes: aDictionary
]

{ #category : #'handling - lexical' }
SAX2Parser >> startEntity: anEntityName [
	self lexicalHandler startEntity: anEntityName
]

{ #category : #'handling - content' }
SAX2Parser >> startPrefixMapping: aPrefix uri: aURI [
	self contentHandler
		startPrefixMapping: aPrefix
		uri: aURI
]

{ #category : #'handling - lexical' }
SAX2Parser >> xmlVersion: aVersionFloat encoding: anEncoding standalone: aBoolean [
	self lexicalHandler
		xmlVersion: aVersionFloat
		encoding: anEncoding
		standalone: aBoolean
]
