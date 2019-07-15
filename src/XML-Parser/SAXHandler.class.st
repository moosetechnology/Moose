"
This class is an event-handling XML parser. To use it, subclass it and override event handlers in the ""handling"" categories, such as #startDocument, #startElement:attributes:, #endElement:, and #endDocument.

By default XML namespace support and validation are enabled but not external entity resolution.

Once the subclass is ready, use the class ""parsing"" messages to parse XML:
	result := SAXHandlerSubclass parse: xmlStringOrStream.
	resultFromURL := SAXHandlerSubclass parseURL: xmlURLString.
	resultFromFile := SAXHandlerSubclass parseFileNamed: xmlFileName.

The class ""instance creation"" messages create and return new parsers on the input so they can be configured with messages in the  ""configuring"" category before parsing:
	result :=
		(SAXHandlerSubclass on: xmlStringOrStream)
			isValidating: true;
			resolvesExternalEntities: true;
			parseDocument.

#interruptParsing can be sent from within a handler to stop parsing, and there is also #parseDocumentWhile: and #parseDocumentUntil: 
	result :=
		(SAXHandlerSubclass on: xmlStringOrStream)
			parseDocumentWhile: [self shouldKeepParsing].

To parse incrementally, send #parser to an instance to get the underlying XMLParser object and send it #parseToken repeatedly:
	(handler := SAXHandlerSubclass on: xmlStringOrStream)
		isValidating: false; 
		preservesUndeclaredEntityReferences: true.
	parser := handler parser.

	""Only parse the first 10 tokens:""
	10 timesRepeat: [parser parseToken].

There are security limits on input you can remove with #removeLimits or change with messages like #documentReadLimit:
	result :=
		(SAXHandlerSubclass on: xmlStringOrStream)
			removeLimits;
			documentReadLimit: newReadLimit;
			maxEntityReplacementDepth: newMaxEntityDepth;
			parseDocument.
		
#optimizeForLargeDocuments can be used when parsing large documents if you don't care for validating or namespaces.
"
Class {
	#name : #SAXHandler,
	#superclass : #Object,
	#instVars : [
		'input',
		'documentURI',
		'configuration',
		'hasParser',
		'isInContent',
		'isInCDataSection'
	],
	#category : #'XML-Parser'
}

{ #category : #'instance creation' }
SAXHandler class >> new [
	Error signal:
		'Parsers should be created with #on: or ',
		'some other "instance creation" message'
]

{ #category : #'instance creation' }
SAXHandler class >> on: aStringOrStream [
	"Returns a new parser on the string or stream argument but doesn't parse it.

	Can be used to configure a parser with 'configuring' messages before
	parsing with #parseDocument."

	^ self basicNew initialize on: aStringOrStream
]

{ #category : #'instance creation' }
SAXHandler class >> on: aStringOrStream documentURI: aURIString [
	"Returns a new parser on the string or stream argument treating the
	specified URI as the base URI of the document but doesn't parse it.

	Can be used to configure a parser with 'configuring' messages before
	parsing with #parseDocument."

	^ (self on: aStringOrStream) documentURI: aURIString
]

{ #category : #'instance creation' }
SAXHandler class >> onFileNamed: aFileName [
	"Returns a new parser on the specified file but doesn't parse it.
	If aFileName is a relative path, it will be resolved in the context of
	the current working directory.

	Can be used to configure file parsers with 'configuring' messages before
	parsing with #parseDocument."

	^ self
		on:
			"return an XMLDecodingReadStreamAdapter on the undecoded file
			stream so we can do our own decoding looking at byte order
			marks and <?xml ...?> encoding attributes"
			(XMLDecodingReadStreamAdapter nonDecodingOn:
				aFileName asXMLFileHandle rawReadStream)
		documentURI: aFileName
]

{ #category : #'instance creation' }
SAXHandler class >> onURL: aURLString [
	"Fetches the URL and returns new parser on the response content but doesn't
	parse it. If the URL has no scheme, it will be treated as a file path.

	Can be used to configure URL parsers with 'configuring' messages before
	parsing with #parseDocument."

	^ self
		onURL: aURLString
		upToLimit: XMLParserLimits defaultDocumentReadLimit
]

{ #category : #'instance creation' }
SAXHandler class >> onURL: aURLString upToLimit: aMaxSize [
	"Fetches a URL and returns new parser on the response content up to the
	input limit (use nil to disable) but doesn't parse it. If the URL has
	no scheme, it will be treated as a file path.

	Can be used to configure limited URL parsers with 'configuring' messages
	before parsing with #parseDocument."

	^ (self
		on:
			(DTDExternalEntityResolver new
				streamResolveExternalEntityURI: aURLString
				upToLimit: aMaxSize)
		documentURI: aURLString)
			documentReadLimit: aMaxSize
]

{ #category : #parsing }
SAXHandler class >> parse: aStringOrStream [
	"Parses the document in the string or stream argument"

	^ (self on: aStringOrStream) parseDocument
]

{ #category : #parsing }
SAXHandler class >> parse: aStringOrStream documentURI: aURIString [
	"Parses the document in the string or stream argument treating the specified
	URI as the base URI of the document."

	^ (self
		on: aStringOrStream
		documentURI: aURIString) parseDocument
]

{ #category : #parsing }
SAXHandler class >> parse: aStringOrStream usingNamespaces: aBoolean [
	"Parses the document in the string or stream argument possibly with namespace
	checking enabled (default)"

	^ (self on: aStringOrStream)
		usesNamespaces: aBoolean;
		parseDocument
]

{ #category : #parsing }
SAXHandler class >> parse: aStringOrStream usingNamespaces: aNamespaceBoolean validation: aValidationBoolean [
	"Parses the document in the string or stream argument possibly with namespace
	checking (default) and validation (default) enabled."

	^ (self on: aStringOrStream)
		usesNamespaces: aNamespaceBoolean;
		isValidating: aValidationBoolean;
		parseDocument
]

{ #category : #parsing }
SAXHandler class >> parse: aStringOrStream usingNamespaces: aNamespaceBoolean validation: aValidationBoolean externalEntities: anEntityResolutionBoolean [
	"Parses the document in the string or stream argument possibly with namespace
	checking (default), validation (default), or external entity resolution (not
	default) enabled."

	^ (self on: aStringOrStream)
		usesNamespaces: aNamespaceBoolean;
		isValidating: aValidationBoolean;
		resolvesExternalEntities: anEntityResolutionBoolean;
		parseDocument
]

{ #category : #deprecated }
SAXHandler class >> parseDocumentFrom: aStringOrStream [
	self deprecated: 'Use #parse: instead'.

	^ self parse: aStringOrStream.
]

{ #category : #deprecated }
SAXHandler class >> parseDocumentFromFileNamed: aFileName [
	self deprecated: 'Use #parseFileNamed: instead'.

	^ self parseFileNamed: aFileName.
]

{ #category : #parsing }
SAXHandler class >> parseFileNamed: aFileNameString [
	"Parses the specified file. If aFileName is a relative path, it will be
	resolved in the context of the current working directory."

	^ (self onFileNamed: aFileNameString) parseDocument
]

{ #category : #parsing }
SAXHandler class >> parseURL: aURLString [
	"Fetches the URL and parses the response content. If the URL has no scheme,
	it will be treated as a file path."

	^ (self onURL: aURLString) parseDocument
]

{ #category : #parsing }
SAXHandler class >> parseURL: aURLString upToLimit: aMaxSize [
	"Fetches the URL upto the input limit (nil to disable) and parses the
	response content. If the URL has no scheme, it will be treated as a file
	path."

	^ (self
		onURL: aURLString
		upToLimit: aMaxSize) parseDocument
]

{ #category : #'handling - declaration' }
SAXHandler >> attributeDeclaration: anElementName name: anAttributeName type: aType defaultPragma: aDefaultPragma defaultValue: aDefaultValue [
]

{ #category : #'handling - content' }
SAXHandler >> characters: aString [
	"Handles character data in an element, such as the 'test' in
	'<characters>test</characters>' or in the CDATA section '<![CDATA[test]]>'.
	
	It may be sent multiple times for different sections of character data
	in a single element if they're separated by other nodes or entity
	references like in '<characters>one<!--comment-->two</characters>'.
	
	See #isInCDataSection and #ignorableWhitespace:"
]

{ #category : #'handling - lexical' }
SAXHandler >> comment: aString [
	"Handles '<!--comment-->' sections in documents."
]

{ #category : #accessing }
SAXHandler >> configuration [
	^ configuration
]

{ #category : #accessing }
SAXHandler >> configuration: aConfiguration [
	(configuration := aConfiguration) parserHandlerClass: self class
]

{ #category : #defaults }
SAXHandler >> configurationClass [
	^ XMLConfiguration
]

{ #category : #configuring }
SAXHandler >> decodesCharacters [
	^ self configuration decodesCharacters
]

{ #category : #configuring }
SAXHandler >> decodesCharacters: aBoolean [
	"When enabled, encoding detection and character decoding will be attemped if:
		1) the input stream or string is binary/external
		2) it starts with a byte-order mark (BOM) byte sequence
		3) the input is wrapped with an XMLDecodingReadStreamAdapter that has
			a null or implicit stream converter
	(Default.)"

	self configuration decodesCharacters: aBoolean
]

{ #category : #defaults }
SAXHandler >> defaultDocumentURI [
	^ ''
]

{ #category : #private }
SAXHandler >> doctypeDefinition: aDoctypeDefinition [
]

{ #category : #configuring }
SAXHandler >> documentReadLimit [
	^ self configuration documentReadLimit
]

{ #category : #configuring }
SAXHandler >> documentReadLimit: anInteger [
	"change the document read limit (maximum number of chars that can be read)
	or nil to disable"

	self configuration documentReadLimit: anInteger
]

{ #category : #accessing }
SAXHandler >> documentURI [
	"Returns current document base URI string"
	^ documentURI ifNil: [documentURI := self defaultDocumentURI]
]

{ #category : #accessing }
SAXHandler >> documentURI: aURIString [
	documentURI := aURIString
]

{ #category : #defaults }
SAXHandler >> driverClass [
	^ SAXParserDriver
]

{ #category : #'handling - declaration' }
SAXHandler >> elementDeclaration: anElementName contentModel: aContentModel [

]

{ #category : #'handling - lexical' }
SAXHandler >> endCData [
	"Sent after the character data of a '<![CDATA[...]]>' section."
]

{ #category : #'handling - lexical' }
SAXHandler >> endDTD [

]

{ #category : #'handling - content' }
SAXHandler >> endDocument [
	"Handles the end of an XML document. No more handlers are invoked after this."
]

{ #category : #'handling - content' }
SAXHandler >> endElement: aQualifiedName [
	"Handles the end of an element if a subclass doesn't implement
	#endElement:prefix:uri:localName: or #endElement:prefix:uri:."
]

{ #category : #'handling - content' }
SAXHandler >> endElement: aQualifiedName prefix: aPrefix uri: aURI [
	"Handles the end of an element if a subclass doesn't implement
	#endElement:prefix:uri:localName:. By default it forwards to a simpler
	handler, #endElement:.
	
	aQualifiedName - the full name, including any prefix, such as 'prefix:name'
	aPrefix - the prefix of the qualified name or an empty string
	aURI - the namespace URI of the element or an empty string"

	self endElement: aQualifiedName
]

{ #category : #'handling - content' }
SAXHandler >> endElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName [
	"Handles the end of an element, either an end tag like '</end>' or a
	self-closed tag like '<empty/>'. By default it forwards to a simpler handler,
	#endElement:prefix:uri:.
	
	aQualifiedName - the full name, including any prefix, such as 'prefix:name'
	aPrefix - the prefix of the qualified name or an empty string
	aURI - the namespace URI of the element or an empty string
	aLocalName - the local part of the qualified name"

	self
		endElement: aQualifiedName
		prefix: aPrefix
		uri:  aURI
]

{ #category : #'handling - lexical' }
SAXHandler >> endEntity: anEntityName [
	"Handles the end of some general entity's replacement in content.
	Not sent if the entity is undeclared or if content entity replacement
	is disabled."
]

{ #category : #'handling - content' }
SAXHandler >> endPrefixMapping: aPrefix [
	"Handles the end of a namespace prefix/URI mapping when namespaces are
	enabled. After, aPrefix (empty for the default namespace) will be either
	unmapped or mapped to a different URI. The 'xml' prefix is predefined
	and never unmapped."
]

{ #category : #private }
SAXHandler >> errorInstancesCannotHaveMultipleParsers [
	XMLParserException
		formatSignal: 'Instances of {1} cannot have multiple parsers'
		with: self class name
]

{ #category : #configuring }
SAXHandler >> externalEntityResolver [
	^ self configuration externalEntityResolver
]

{ #category : #configuring }
SAXHandler >> externalEntityResolver: anExternalEntityResolver [
	"This can be used to set a different DTDExternalEntityResolver"

	self configuration externalEntityResolver: anExternalEntityResolver
]

{ #category : #'handling - declaration' }
SAXHandler >> generalEntityDeclaration: aName publicID: aPublicID systemID: aSystemID ndata: aNotationName [
]

{ #category : #'handling - declaration' }
SAXHandler >> generalEntityDeclaration: aName replacement: aReplacement [
]

{ #category : #testing }
SAXHandler >> hasParser [
	^ hasParser
]

{ #category : #'handling - content' }
SAXHandler >> ignorableWhitespace: aString [
	"When validation is enabled and a DTD with ELEMENT declarations is
	present, this can be used to handle ignorable whitespace in elements
	with 'element content' (meaning they can only contain other elements
	and no PCDATA), such as between '<element-content>' and '<mixed-content>'
	or between '</mixed-content>' and '</element-content>' in this sample:
		'<!DOCTYPE element-content [
			<!--this has element content, so its whitespace is ignorable-->
			<!ELEMENT element-content (mixed-content)>
			<!--this has mixed content, so its whitespace is not ignorable-->
			<!ELEMENT mixed-content (#PCDATA|any-content)*>
			<!--this has any content, so its whitespace is not ignorable-->
			<!ELEMENT any-content ANY>
		]>
		<element-content>
			<mixed-content>
				<any-content> any </any-content>
			</mixed-content>
		</element-content>'

	Not sent if validation is disabled or if there's no DTD with element
	declarations."
]

{ #category : #initialization }
SAXHandler >> initializeParser: aParser [
]

{ #category : #accessing }
SAXHandler >> input [
	"the input being parsed or to be parsed"
	^ input
]

{ #category : #private }
SAXHandler >> input: aStringOrStream [
	"here for backwards compatibility; use #on: instead"

	input := aStringOrStream
]

{ #category : #parsing }
SAXHandler >> interruptParsing [
	"Can be sent within a handler to stop parsing;
	will be silently caught within #parseDocument or other parsing methods"

	XMLParsingInterruptException signal
]

{ #category : #testing }
SAXHandler >> isInCDataSection [
	"Can be used by characters: handlers to distinguish ordinary character
	data from characters within '<![CDATA[...]]>' sections"

	^ isInCDataSection
]

{ #category : #private }
SAXHandler >> isInCDataSection: aBoolean [
	isInCDataSection := aBoolean
]

{ #category : #testing }
SAXHandler >> isInContent [
	"True if parsing has reached the first element of the document."

	^ isInContent
]

{ #category : #configuring }
SAXHandler >> isValidating [
	^ self configuration isValidating
]

{ #category : #configuring }
SAXHandler >> isValidating: aBoolean [
	"If true and the document has a schema (like a DTD with ELEMENT and ATTLIST
	declarations) the document will be validated against it. Otherwise only
	entity references and xml:id attributes will be validated.
	
	(This is unlike the standard which requires validating parsers to reject
	all documents without DTDs or other schemas. To get that behavior,
	use requiresDocumentConstraints:)

	Enabling disables preservesUndeclaredEntityReferences.
	Disabling disables requiresDocumentConstraints."

	self configuration isValidating: aBoolean
]

{ #category : #configuring }
SAXHandler >> maxEntityReplacementDepth [
	^ self configuration maxEntityReplacementDepth
]

{ #category : #configuring }
SAXHandler >> maxEntityReplacementDepth: anInteger [
	"change the max replacement depth or nil to disable"

	self configuration maxEntityReplacementDepth: anInteger
]

{ #category : #'handling - declaration' }
SAXHandler >> notationDeclaration: aName publicID: aPublicID systemID: aSystemID [

]

{ #category : #initialization }
SAXHandler >> on: aStringOrStream [
	input := aStringOrStream.

	"a single instance can parse multiple documents with #on:,
	so each variable must be reset"
	documentURI := nil.
	configuration
		ifNil: [self configuration: self configurationClass new]
		ifNotNil: [self configuration: configuration copy].
	hasParser := false.
	isInContent := false.
	isInCDataSection := false.
]

{ #category : #configuring }
SAXHandler >> optimizeForLargeDocuments [
	"use this for faster parsing/less memory use with large documents"

	self
		isValidating: false;
		usesNamespaces: false;
		documentReadLimit: nil
]

{ #category : #'handling - declaration' }
SAXHandler >> parameterEntityDeclaration: aName publicID: aPublicID systemID: aSystemID [
]

{ #category : #'handling - declaration' }
SAXHandler >> parameterEntityDeclaration: aName replacement: aReplacement [
]

{ #category : #parsing }
SAXHandler >> parseDocument [
	"Parse the entire input string or stream and return the result"

	self parser parseDocument.

	^ self parsingResult.
]

{ #category : #parsing }
SAXHandler >> parseDocumentUntil: aBlock [
	"Parse the input string or stream only until aBlock evalautes as true
	and return the result"

	self parser parseDocumentUntil: aBlock.

	^ self parsingResult.
]

{ #category : #parsing }
SAXHandler >> parseDocumentWhile: aBlock [
	"Parse the input string or stream only as long as aBlock evalautes as true
	and return the result"

	self parser parseDocumentWhile: aBlock.

	^ self parsingResult.
]

{ #category : #parsing }
SAXHandler >> parser [
	"returns a new XMLParser object for this handler"

	| parser |

	hasParser
		ifTrue: [self errorInstancesCannotHaveMultipleParsers].
	hasParser := true.

	parser :=
		self parserClass
			driver: (self driverClass saxHandler: self)
			on: self input.
	self initializeParser: parser.

	^ parser.
]

{ #category : #defaults }
SAXHandler >> parserClass [
	^ XMLParser
]

{ #category : #parsing }
SAXHandler >> parsingResult [
	"value returned by parseDocument and other parsing methods"

	^ self
]

{ #category : #configuring }
SAXHandler >> preservesUndeclaredEntityReferences [
	^ self configuration preservesUndeclaredEntityReferences
]

{ #category : #configuring }
SAXHandler >> preservesUndeclaredEntityReferences: aBoolean [
	"If true, references to undeclared entities in content are
	preserved (not default).
	Disables validation.
	
	(See also replacesContentEntityReferences:, which is usually more appropriate.)"

	self configuration preservesUndeclaredEntityReferences: aBoolean
]

{ #category : #'handling - content' }
SAXHandler >> processingInstruction: aTargetString data: aDataString [
	"Handles processing instructions like '<?name value?>', where 'name' is
	the target and 'value' is the data.
	
	XML declarations may look like PIs but are different and are handled
	with #xmlVersion:encoding:standalone: instead."
]

{ #category : #configuring }
SAXHandler >> removeLimits [
	"remove all input security limits (unsafe)"

	self configuration removeLimits
]

{ #category : #configuring }
SAXHandler >> replacesContentEntityReferences [
	^ self configuration replacesContentEntityReferences
]

{ #category : #configuring }
SAXHandler >> replacesContentEntityReferences: aBoolean [
	"Replace general parsed entity and character references
	in content (default)"

	self configuration replacesContentEntityReferences: aBoolean
]

{ #category : #deprecated }
SAXHandler >> requiresDocumentConstraints [
	"will be deprecated; use #requiresSchema instead"
	^ self requiresSchema
]

{ #category : #deprecated }
SAXHandler >> requiresDocumentConstraints: aBoolean [
	"will be deprecated; use #requiresSchema: instead"
	self requiresSchema: aBoolean
]

{ #category : #configuring }
SAXHandler >> requiresSchema [
	^ self configuration requiresSchema
]

{ #category : #configuring }
SAXHandler >> requiresSchema: aBoolean [
	"If true, a schema containing constraints on elements and attributes
	(like a DTD with ELEMENT and ATTLIST declarations) will be required.
	Enables validation.

	(Not default)."

	self configuration requiresSchema: aBoolean
]

{ #category : #configuring }
SAXHandler >> resolvesExternalEntities [
	^ self configuration resolvesExternalEntities
]

{ #category : #configuring }
SAXHandler >> resolvesExternalEntities: aBoolean [
	"When true, external DTDs and parsed entities will be
	fetched (not default)."

	self configuration resolvesExternalEntities: aBoolean
]

{ #category : #private }
SAXHandler >> schema [
	^ nil
]

{ #category : #'handling - content' }
SAXHandler >> skippedEntity: anEntityName [
	"Sent when a general parsed entity reference like '&name;' is
	unreplaced in content. Only sent when validation is turned off
	or entity replacement is disabled."
]

{ #category : #'handling - lexical' }
SAXHandler >> startCData [
	"Sent before the character data of a '<![CDATA[...]]>' section."
]

{ #category : #private }
SAXHandler >> startContent [
	isInContent := true
]

{ #category : #'handling - lexical' }
SAXHandler >> startDTD: aRootElementName publicID: aPublicID systemID: aSystemID [
	"Handles the start of a '<!DOCTYPE ...>' declaration. Any events
	after this and until #endDTD is sent are part of the internal subset
	of the DTD.
	
	aRootElementName - the expected name of the document's root element
	aPublicID - the public ID of the external DTD subset or an empty string
	aSystemID - the URI where the external subset can be found or an empty string"
]

{ #category : #'handling - content' }
SAXHandler >> startDocument [
	"Handles the start of an XML document, the first handler invoked."
]

{ #category : #'handling - content' }
SAXHandler >> startElement: aQualifiedName attributes: anAttributeDictionary [
	"Handles the start of an element if a subclass doesn't implement
	#startElement:prefix:uri:localName:attributes: or
	#startElement:prefix:uri:attributes:.

	aQualifiedName - the full name, including any prefix, such as 'prefix:name'
	anAttributeDictionary - an XMLAttributeDictionary of attributes"
]

{ #category : #'handling - content' }
SAXHandler >> startElement: aQualifiedName prefix: aPrefix uri: aURI attributes: anAttributeDictionary [
	"Handles the start of an element if a subclass doesn't implement
	#startElement:prefix:uri:localName:attributes:. By default it forwards
	to a simpler handler, #startElement:attributes:.
	
	aQualifiedName - the full name, including any prefix, such as 'prefix:name'
	aPrefix - the prefix of the qualified name or an empty string
	aURI - the namespace URI of the element or an empty string
	anAttributeDictionary - an XMLAttributeDictionary of attributes"

	self
		startElement: aQualifiedName
		attributes: anAttributeDictionary
]

{ #category : #'handling - content' }
SAXHandler >> startElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName attributes: anAttributeDictionary [
	"Handles the start of an element, either a start tag like '<start>' or a
	self-closed tag like '<empty/>'. By default it forwards to a simpler handler,
	#startElement:prefix:uri:attributes:.
	
	aQualifiedName - the full name, including any prefix, such as 'prefix:name'
	aPrefix - the prefix of the qualified name or an empty string
	aURI - the namespace URI of the element or an empty string
	aLocalName - the local part of the qualified name
	anAttributeDictionary - an XMLAttributeDictionary of attributes"

	self
		startElement: aQualifiedName
		prefix: aPrefix
		uri: aURI
		attributes: anAttributeDictionary
]

{ #category : #'handling - lexical' }
SAXHandler >> startEntity: anEntityName [
	"Handles the start of some general entity's replacement in content.
	Not sent if the entity is undeclared or if content entity replacement
	is disabled."
]

{ #category : #'handling - content' }
SAXHandler >> startPrefixMapping: aPrefix uri: aURI [
	"Handles the start of a namespace prefix/URI mapping when namespaces are
	enabled. The 'xml' prefix is predefined and never remapped.

	aPrefix - the prefix of the namespace (empty for the default namesapce)
	aURI - the namespace URI"
]

{ #category : #private }
SAXHandler >> startScope: aNamespaceScope [
]

{ #category : #configuring }
SAXHandler >> usesNamespaces [
	^ self configuration usesNamespaces
]

{ #category : #configuring }
SAXHandler >> usesNamespaces: aBoolean [
	"Namespace checking when true (default)"

	self configuration usesNamespaces: aBoolean
]

{ #category : #'handling - lexical' }
SAXHandler >> xmlVersion: aVersionFloat encoding: anEncoding standalone: aBoolean [
	"Handles the '<?xml ...?>' declaration of a document.
	
	aVersionFloat - the version of XML the document uses, usually 1.0
	anEncoding - the name of the encoding or an empty string
	aBoolean - true if standalone='yes'"
]
