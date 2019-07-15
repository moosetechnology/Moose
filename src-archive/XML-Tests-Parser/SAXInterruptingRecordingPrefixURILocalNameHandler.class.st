"
An interrupting version to test #interruptParsing.
"
Class {
	#name : #SAXInterruptingRecordingPrefixURILocalNameHandler,
	#superclass : #SAXRecordingPrefixURILocalNameHandler,
	#instVars : [
		'interruptOn'
	],
	#category : #'XML-Tests-Parser'
}

{ #category : #private }
SAXInterruptingRecordingPrefixURILocalNameHandler class >> generateInterruptingRecordingHandlerMethods [
	"
	self generateInterruptingRecordingHandlerMethods
	"

	#(#'handling - content'
		#'handling - lexical'
		#'handling - declaration')
		do: [:handlerCategory |
			(SAXHandler selectorsInCategory: handlerCategory) do: [:handlerSelector | | parsedMethod sourceStream |
				parsedMethod := RBParser parseMethod: (SAXHandler sourceCodeAt: handlerSelector).
				(sourceStream := String new writeStream)
					nextPutAll: parsedMethod selectorAndArgumentNames;
					cr;
					nextPutAll: '	super'.
				1 to: parsedMethod keywords size do: [:i |
					parsedMethod keywords size > 1
						ifTrue: [
							sourceStream
								cr;
								nextPutAll: '		']
						ifFalse: [sourceStream space].
					sourceStream nextPutAll: (parsedMethod keywords at: i).
					parsedMethod arguments
						ifNotEmpty: [
							sourceStream
								space;
								nextPutAll: (parsedMethod argumentNames at: i)]].
				sourceStream
					nextPut: $.;
					cr;
					cr;
					nextPutAll: '	self interruptOn = #', handlerSelector asString;
					cr;
					nextPutAll: '		ifTrue: [self interruptParsing].'.
				self
					compile: sourceStream contents
					classified: handlerCategory]]
]

{ #category : #'handling - declaration' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> attributeDeclaration: anElementName name: anAttributeName type: aType defaultPragma: aDefaultPragma defaultValue: aDefaultValue [
	super
		attributeDeclaration: anElementName
		name: anAttributeName
		type: aType
		defaultPragma: aDefaultPragma
		defaultValue: aDefaultValue.

	self interruptOn = #attributeDeclaration:name:type:defaultPragma:defaultValue:
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - content' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> characters: aString [
	super characters: aString.

	self interruptOn = #characters:
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - lexical' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> comment: aString [
	super comment: aString.

	self interruptOn = #comment:
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - declaration' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> elementDeclaration: anElementName contentModel: aContentModel [
	super
		elementDeclaration: anElementName
		contentModel: aContentModel.

	self interruptOn = #elementDeclaration:contentModel:
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - lexical' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> endCData [
	super endCData.

	self interruptOn = #endCData
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - lexical' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> endDTD [
	super endDTD.

	self interruptOn = #endDTD
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - content' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> endDocument [
	super endDocument.

	self interruptOn = #endDocument
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - content' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> endElement: aQualifiedName [
	super endElement: aQualifiedName.

	self interruptOn = #endElement:
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - content' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> endElement: aQualifiedName prefix: aPrefix uri: aURI [
	super
		endElement: aQualifiedName
		prefix: aPrefix
		uri: aURI.

	self interruptOn = #endElement:prefix:uri:
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - content' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> endElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName [
	super
		endElement: aQualifiedName
		prefix: aPrefix
		uri: aURI
		localName: aLocalName.

	self interruptOn = #endElement:prefix:uri:localName:
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - lexical' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> endEntity: anEntityName [
	super endEntity: anEntityName.

	self interruptOn = #endEntity:
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - content' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> endPrefixMapping: aPrefix [
	super endPrefixMapping: aPrefix.

	self interruptOn = #endPrefixMapping:
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - declaration' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> generalEntityDeclaration: aName publicID: aPublicID systemID: aSystemID ndata: aNotationName [
	super
		generalEntityDeclaration: aName
		publicID: aPublicID
		systemID: aSystemID
		ndata: aNotationName.

	self interruptOn = #generalEntityDeclaration:publicID:systemID:ndata:
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - declaration' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> generalEntityDeclaration: aName replacement: aReplacement [
	super
		generalEntityDeclaration: aName
		replacement: aReplacement.

	self interruptOn = #generalEntityDeclaration:replacement:
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - content' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> ignorableWhitespace: aString [
	super ignorableWhitespace: aString.

	self interruptOn = #ignorableWhitespace:
		ifTrue: [self interruptParsing].
]

{ #category : #accessing }
SAXInterruptingRecordingPrefixURILocalNameHandler >> interruptOn [
	^ interruptOn
]

{ #category : #accessing }
SAXInterruptingRecordingPrefixURILocalNameHandler >> interruptOn: aSelector [
	interruptOn := aSelector
]

{ #category : #'handling - declaration' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> notationDeclaration: aName publicID: aPublicID systemID: aSystemID [
	super
		notationDeclaration: aName
		publicID: aPublicID
		systemID: aSystemID.

	self interruptOn = #notationDeclaration:publicID:systemID:
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - declaration' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> parameterEntityDeclaration: aName publicID: aPublicID systemID: aSystemID [
	super
		parameterEntityDeclaration: aName
		publicID: aPublicID
		systemID: aSystemID.

	self interruptOn = #parameterEntityDeclaration:publicID:systemID:
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - declaration' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> parameterEntityDeclaration: aName replacement: aReplacement [
	super
		parameterEntityDeclaration: aName
		replacement: aReplacement.

	self interruptOn = #parameterEntityDeclaration:replacement:
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - content' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> processingInstruction: aTargetString data: aDataString [
	super
		processingInstruction: aTargetString
		data: aDataString.

	self interruptOn = #processingInstruction:data:
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - content' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> skippedEntity: anEntityName [
	super skippedEntity: anEntityName.

	self interruptOn = #skippedEntity:
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - lexical' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> startCData [
	super startCData.

	self interruptOn = #startCData
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - lexical' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> startDTD: aRootElementName publicID: aPublicID systemID: aSystemID [
	super
		startDTD: aRootElementName
		publicID: aPublicID
		systemID: aSystemID.

	self interruptOn = #startDTD:publicID:systemID:
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - content' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> startDocument [
	super startDocument.

	self interruptOn = #startDocument
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - content' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> startElement: aQualifiedName attributes: anAttributeDictionary [
	super
		startElement: aQualifiedName
		attributes: anAttributeDictionary.

	self interruptOn = #startElement:attributes:
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - content' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> startElement: aQualifiedName prefix: aPrefix uri: aURI attributes: anAttributeDictionary [
	super
		startElement: aQualifiedName
		prefix: aPrefix
		uri: aURI
		attributes: anAttributeDictionary.

	self interruptOn = #startElement:prefix:uri:attributes:
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - content' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> startElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName attributes: anAttributeDictionary [
	super
		startElement: aQualifiedName
		prefix: aPrefix
		uri: aURI
		localName: aLocalName
		attributes: anAttributeDictionary.

	self interruptOn = #startElement:prefix:uri:localName:attributes:
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - lexical' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> startEntity: anEntityName [
	super startEntity: anEntityName.

	self interruptOn = #startEntity:
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - content' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> startPrefixMapping: aPrefix uri: aURI [
	super
		startPrefixMapping: aPrefix
		uri: aURI.

	self interruptOn = #startPrefixMapping:uri:
		ifTrue: [self interruptParsing].
]

{ #category : #'handling - lexical' }
SAXInterruptingRecordingPrefixURILocalNameHandler >> xmlVersion: aVersionFloat encoding: anEncoding standalone: aBoolean [
	super
		xmlVersion: aVersionFloat
		encoding: anEncoding
		standalone: aBoolean.

	self interruptOn = #xmlVersion:encoding:standalone:
		ifTrue: [self interruptParsing].
]
