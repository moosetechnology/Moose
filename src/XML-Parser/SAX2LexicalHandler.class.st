"
This is a base class for SAX2 lexical handler classes that can be injected into SAX2Parser instances with #lexicalHandler: before parsing:
	(SAX2Parser on: xmlStringOrStream)
		lexicalHandler: MyLexicalHandlerClass new;
		parseDocument.

See SAX2Parser and SAXHandler for more info.
"
Class {
	#name : #SAX2LexicalHandler,
	#superclass : #Object,
	#instVars : [
		'parser'
	],
	#category : #'XML-Parser'
}

{ #category : #'instance creation' }
SAX2LexicalHandler class >> parser: aParser [
	^ self new parser: aParser
]

{ #category : #'handling - lexical' }
SAX2LexicalHandler >> comment: aString [
	"Handles '<!--comment-->' sections in documents."
]

{ #category : #'handling - lexical' }
SAX2LexicalHandler >> endCData [
	"Sent after the character data of a '<![CDATA[...]]>' section."
]

{ #category : #'handling - lexical' }
SAX2LexicalHandler >> endDTD [

]

{ #category : #'handling - lexical' }
SAX2LexicalHandler >> endEntity: anEntityName [
	"Handles the end of some general entity's replacement in content.
	Not sent if the entity is undeclared or if content entity replacement
	is disabled."
]

{ #category : #accessing }
SAX2LexicalHandler >> parser [
	"Returns the SAX2Parser this handler was injected into"

	^ parser
]

{ #category : #accessing }
SAX2LexicalHandler >> parser: aParser [
	parser := aParser
]

{ #category : #'handling - lexical' }
SAX2LexicalHandler >> startCData [
	"Sent before the character data of a '<![CDATA[...]]>' section."
]

{ #category : #'handling - lexical' }
SAX2LexicalHandler >> startDTD: aRootElementName publicID: aPublicID systemID: aSystemID [
	"Handles the start of a '<!DOCTYPE ...>' declaration. Any events
	after this and until endDTD is sent are part of the internal subset
	of the DTD.
	
	aRootElementName - the expected name of the document's root element
	aPublicID - the public ID of the external DTD subset or an empty string
	aSystemID - the URI where the external subset can be found or an empty string"
]

{ #category : #'handling - lexical' }
SAX2LexicalHandler >> startEntity: anEntityName [
	"Handles the start of some general entity's replacement in content.
	Not sent if the entity is undeclared or if content entity replacement
	is disabled."
]

{ #category : #'handling - lexical' }
SAX2LexicalHandler >> xmlVersion: aVersionFloat encoding: anEncoding standalone: aBoolean [
	"Handles the '<?xml ...?>' declaration of a document.
	
	aVersionFloat - the version of XML the document uses, usually 1.0
	anEncoding - the name of the encoding or an empty string
	aBoolean - true if standalone='yes'"
]
