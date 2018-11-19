Class {
	#name : #SAX2ParserTest,
	#superclass : #TestCase,
	#category : #'XML-Tests-Parser'
}

{ #category : #source }
SAX2ParserTest >> addressBookXML [
	^ XMLParserTest addressBookXML
]

{ #category : #accessing }
SAX2ParserTest >> contentHandlerClass [
	^ SAX2ContentHandler
]

{ #category : #accessing }
SAX2ParserTest >> declarationHandlerClass [
	^ SAX2DeclarationHandler
]

{ #category : #accessing }
SAX2ParserTest >> lexicalHandlerClass [
	^ SAX2LexicalHandler
]

{ #category : #tests }
SAX2ParserTest >> testContentHandler [
	| parser oldContentHandler newContentHandler |

	parser := SAX2Parser on: self addressBookXML.
	oldContentHandler := parser contentHandler.
	self
		assert: oldContentHandler class == self contentHandlerClass;
		assert: oldContentHandler parser == parser.

	newContentHandler := self contentHandlerClass new.
	self
		assert: (parser contentHandler: newContentHandler) == parser;
		assert: parser contentHandler == newContentHandler;
		assert: newContentHandler parser == parser;
		assert: (parser contentHandler: nil) == parser;
		assert: parser contentHandler class == self contentHandlerClass;
		assert: parser contentHandler parser == parser.
]

{ #category : #tests }
SAX2ParserTest >> testDeclarationHandler [
	| parser oldDeclarationHandler newDeclarationHandler |

	parser := SAX2Parser on: self addressBookXML.
	oldDeclarationHandler := parser declarationHandler.
	self
		assert: oldDeclarationHandler class == self declarationHandlerClass;
		assert: oldDeclarationHandler parser == parser.

	newDeclarationHandler := self declarationHandlerClass new.
	self
		assert: (parser declarationHandler: newDeclarationHandler) == parser;
		assert: parser declarationHandler == newDeclarationHandler;
		assert: newDeclarationHandler parser == parser;
		assert: (parser declarationHandler: nil) == parser;
		assert: parser declarationHandler class == self declarationHandlerClass;
		assert: parser declarationHandler parser == parser.
]

{ #category : #tests }
SAX2ParserTest >> testLexicalHandler [
	| parser oldLexicalHandler newLexicalHandler |

	parser := SAX2Parser on: self addressBookXML.
	oldLexicalHandler := parser lexicalHandler.
	self
		assert: oldLexicalHandler class == self lexicalHandlerClass;
		assert: oldLexicalHandler parser == parser.

	newLexicalHandler := self lexicalHandlerClass new.
	self
		assert: (parser lexicalHandler: newLexicalHandler) == parser;
		assert: parser lexicalHandler == newLexicalHandler;
		assert: newLexicalHandler parser == parser;
		assert: (parser lexicalHandler: nil) == parser;
		assert: parser lexicalHandler class == self lexicalHandlerClass;
		assert: parser lexicalHandler parser == parser.
]

{ #category : #tests }
SAX2ParserTest >> testParseDocument [
	self
		shouldnt: [
			(SAX2Parser on: self addressBookXML)
				parseDocument]
		raise: XMLParserException
]

{ #category : #tests }
SAX2ParserTest >> testParsingResult [
	| parser |

	parser := SAX2Parser on: self addressBookXML.
	self assert: parser parsingResult == parser.

	parser parsingResult: #result.
	self
		assert: parser parsingResult == #result;
		assert: parser parseDocument == #result.
]
