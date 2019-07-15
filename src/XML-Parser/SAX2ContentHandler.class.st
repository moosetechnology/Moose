"
This is a base class for SAX2 content handler classes that can be injected into SAX2Parser instances with #contentHandler: before parsing:
	(SAX2Parser on: xmlStringOrStream)
		contentHandler: MyContentHandlerClass new;
		parseDocument.

See SAX2Parser and SAXHandler for more info.
"
Class {
	#name : #SAX2ContentHandler,
	#superclass : #Object,
	#instVars : [
		'parser'
	],
	#category : #'XML-Parser'
}

{ #category : #'instance creation' }
SAX2ContentHandler class >> parser: aParser [
	^ self new parser: aParser
]

{ #category : #'handling - content' }
SAX2ContentHandler >> characters: aString [
	"Handles character data in an element, such as the 'test' in
	'<characters>test</characters>' or in the CDATA section '<![CDATA[test]]>'.
	
	It may be sent multiple times for different sections of character data
	in a single element if they're separated by other nodes or entity
	references like in '<characters>one<!--comment-->two</characters>'.
	
	See ignorableWhitespace:"
]

{ #category : #'handling - content' }
SAX2ContentHandler >> endDocument [
	"Handles the end of an XML document. No more handlers are invoked after this."
]

{ #category : #'handling - content' }
SAX2ContentHandler >> endElement: aQualifiedName [
	"Handles the end of an element if a subclass doesn't implement
	#endElement:prefix:uri:localName: or #endElement:prefix:uri:."
]

{ #category : #'handling - content' }
SAX2ContentHandler >> endElement: aQualifiedName prefix: aPrefix uri: aURI [
	"Handles the end of an element if a subclass doesn't implement
	#endElement:prefix:uri:localName:. By default it forwards to a simpler
	handler, #endElement:.
	
	aQualifiedName - the full name, including any prefix, such as 'prefix:name'
	aPrefix - the prefix of the qualified name or an empty string
	aURI - the namespace URI of the element or an empty string"

	self endElement: aQualifiedName
]

{ #category : #'handling - content' }
SAX2ContentHandler >> endElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName [
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

{ #category : #'handling - content' }
SAX2ContentHandler >> endPrefixMapping: aPrefix [
	"Handles the end of a namespace prefix/URI mapping when namespaces are
	enabled. After, aPrefix (empty for the default namespace) will be either
	unmapped or mapped to a different URI. The 'xml' prefix is predefined
	and never unmapped."
]

{ #category : #'handling - content' }
SAX2ContentHandler >> ignorableWhitespace: aString [
	"When validation is enabled and a DTD with element declarations is
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

{ #category : #accessing }
SAX2ContentHandler >> parser [
	"Returns the SAX2Parser this handler was injected into"

	^ parser
]

{ #category : #accessing }
SAX2ContentHandler >> parser: aParser [
	parser := aParser
]

{ #category : #'handling - content' }
SAX2ContentHandler >> processingInstruction: aTargetString data: aDataString [
	"Handles processing instructions like '<?name value?>', where 'name' is
	the target and 'value' is the data.
	
	XML declarations may look like PIs but are different and are handled
	with xmlVersion:encoding:standalone: instead."
]

{ #category : #'handling - content' }
SAX2ContentHandler >> skippedEntity: anEntityName [
	"Sent when a general parsed entity reference like '&name;' is
	unreplaced in content. Only sent when validation is turned off
	or entity replacement is disabled."
]

{ #category : #'handling - content' }
SAX2ContentHandler >> startDocument [
	"Handles the start of an XML document, the first handler invoked."
]

{ #category : #'handling - content' }
SAX2ContentHandler >> startElement: aQualifiedName attributes: anAttributeDictionary [
	"Handles the start of an element if a subclass doesn't implement
	#startElement:prefix:uri:localName:attributes: or
	#startElement:prefix:uri:attributes:.

	aQualifiedName - the full name, including any prefix, such as 'prefix:name'
	anAttributeDictionary - an XMLAttributeDictionary of attributes"
]

{ #category : #'handling - content' }
SAX2ContentHandler >> startElement: aQualifiedName prefix: aPrefix uri: aURI attributes: anAttributeDictionary [
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
SAX2ContentHandler >> startElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName attributes: anAttributeDictionary [
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

{ #category : #'handling - content' }
SAX2ContentHandler >> startPrefixMapping: aPrefix uri: aURI [
	"Handles the start of a namespace prefix/URI mapping when namespaces are
	enabled. The 'xml' prefix is predefined and never remapped.

	aPrefix - the prefix of the namespace (empty for the default namesapce)
	aURI - the namespace URI"
]
