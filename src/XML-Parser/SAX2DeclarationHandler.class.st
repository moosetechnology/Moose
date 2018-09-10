"
This is a base class for SAX2 declaration handler classes that can be injected into SAX2Parser instances with #declarationHandler: before parsing:
	(SAX2Parser on: xmlStringOrStream)
		declarationHandler: MyDeclarationHandlerClass new;
		parseDocument.

See SAX2Parser and SAXHandler for more info.
"
Class {
	#name : #SAX2DeclarationHandler,
	#superclass : #Object,
	#instVars : [
		'parser'
	],
	#category : #'XML-Parser'
}

{ #category : #'instance creation' }
SAX2DeclarationHandler class >> parser: aParser [
	^ self new parser: aParser
]

{ #category : #'handling - declaration' }
SAX2DeclarationHandler >> attributeDeclaration: anElementName name: anAttributeName type: aType defaultPragma: aDefaultPragma defaultValue: aDefaultValue [
]

{ #category : #'handling - declaration' }
SAX2DeclarationHandler >> elementDeclaration: anElementName contentModel: aContentModel [

]

{ #category : #'handling - declaration' }
SAX2DeclarationHandler >> generalEntityDeclaration: aName publicID: aPublicID systemID: aSystemID ndata: aNotationName [
]

{ #category : #'handling - declaration' }
SAX2DeclarationHandler >> generalEntityDeclaration: aName replacement: aReplacement [
]

{ #category : #'handling - declaration' }
SAX2DeclarationHandler >> notationDeclaration: aName publicID: aPublicID systemID: aSystemID [

]

{ #category : #'handling - declaration' }
SAX2DeclarationHandler >> parameterEntityDeclaration: aName publicID: aPublicID systemID: aSystemID [
]

{ #category : #'handling - declaration' }
SAX2DeclarationHandler >> parameterEntityDeclaration: aName replacement: aReplacement [
]

{ #category : #accessing }
SAX2DeclarationHandler >> parser [
	"Returns the SAX2Parser this handler was injected into"

	^ parser
]

{ #category : #accessing }
SAX2DeclarationHandler >> parser: aParser [
	parser := aParser
]
