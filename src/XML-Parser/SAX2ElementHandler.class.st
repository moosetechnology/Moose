"
This is a base class for SAX2 element handlers to be used with SAX2ElementParsers.

SAX2ElementParsers use individual SAX2ElementHandlers to handle the #startElement*, #endElement*, and #characters: events of each element in the document.

The parser can be accessed with #parser, and the parent element handler (if any) can be accessed with #parent.
"
Class {
	#name : #SAX2ElementHandler,
	#superclass : #Object,
	#instVars : [
		'parser',
		'parent',
		'parentFactory'
	],
	#category : #'XML-Parser'
}

{ #category : #parsing }
SAX2ElementHandler class >> parser: aParser [
	^ self
		parser: aParser
		parent: aParser elementHandler
		parentFactory: aParser elementHandlerFactory
]

{ #category : #parsing }
SAX2ElementHandler class >> parser: aParser parent: anElementHandler parentFactory: anElementHandlerFactory [
	^ self new
		setParser: aParser
		parent: anElementHandler
		parentFactory: anElementHandlerFactory
]

{ #category : #accessing }
SAX2ElementHandler >> ancestors [	
	"Returns a list of all ancestor element handlers of the receiver."

	| ancestors |

	ancestors := XMLOrderedList new.
	self ancestorsDo: [:each | ancestors addLast: each].
	^ ancestors.
]

{ #category : #enumerating }
SAX2ElementHandler >> ancestorsDo: aBlock [
	| ancestor |

	ancestor := self parent.
	[ancestor notNil]
		whileTrue: [
			aBlock value: ancestor.
			ancestor := ancestor parent].
]

{ #category : #accessing }
SAX2ElementHandler >> characters [
	"This handler ignores #characters: events, so this always returns
	an empty string."

	^ ''
]

{ #category : #'handling - content' }
SAX2ElementHandler >> characters: aString [
	"Handles character data in an element, such as the 'test' in
	'<characters>test</characters>' or in the CDATA section '<![CDATA[test]]>'.
	
	It may be sent multiple times for different sections of character data
	in a single element if they're separated by other nodes or entity
	references like in '<characters>one<!--comment-->two</characters>'."
]

{ #category : #accessing }
SAX2ElementHandler >> elementHandlerFactory [
	"Can be overridden to return a default factory to use by a factory
	mapper when no other factory is mapped to the receiver."

	^ nil
]

{ #category : #'handling - content' }
SAX2ElementHandler >> endElement: aQualifiedName [
	"Handles the end of an element if a subclass doesn't implement
	#endElement:prefix:uri:localName: or #endElement:prefix:uri:."
]

{ #category : #'handling - content' }
SAX2ElementHandler >> endElement: aQualifiedName prefix: aPrefix uri: aURI [
	"Handles the end of an element if a subclass doesn't implement
	#endElement:prefix:uri:localName:. By default it forwards to a simpler
	handler, #endElement:.
	
	aQualifiedName - the full name, including any prefix, such as 'prefix:name'
	aPrefix - the prefix of the qualified name or an empty string
	aURI - the namespace URI of the element or an empty string"

	self endElement: aQualifiedName
]

{ #category : #'handling - content' }
SAX2ElementHandler >> endElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName [
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

{ #category : #testing }
SAX2ElementHandler >> hasParent [
	"Returns true if the receiver has a parent element handler (meaning it's
	not the root element handler)"

	^ parent notNil
]

{ #category : #accessing }
SAX2ElementHandler >> parent [
	"Returns the parent element handler or nil if there isn't one (if
	the receiver is handling the root element)."

	^ parent
]

{ #category : #accessing }
SAX2ElementHandler >> parentFactory [
	"Returns the factory that created the receiver."

	^ parentFactory
]

{ #category : #accessing }
SAX2ElementHandler >> parser [
	"Returns the SAX2ElementParser"

	^ parser
]

{ #category : #initialization }
SAX2ElementHandler >> setParser: aParser parent: anElementHandler parentFactory: anElementHandlerFactory [
	parser := aParser.
	parent := anElementHandler.
	parentFactory := anElementHandlerFactory.
]

{ #category : #'handling - content' }
SAX2ElementHandler >> startElement: aQualifiedName attributes: anAttributeDictionary [
	"Handles the start of an element if a subclass doesn't implement
	#startElement:prefix:uri:localName:attributes: or
	#startElement:prefix:uri:attributes:.

	aQualifiedName - the full name, including any prefix, such as 'prefix:name'
	anAttributeDictionary - an XMLAttributeDictionary of attributes"
]

{ #category : #'handling - content' }
SAX2ElementHandler >> startElement: aQualifiedName prefix: aPrefix uri: aURI attributes: anAttributeDictionary [
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
SAX2ElementHandler >> startElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName attributes: anAttributeDictionary [
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
